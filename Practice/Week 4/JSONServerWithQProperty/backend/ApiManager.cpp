#include "ApiManager.h"
#include <QJsonDocument>

const QString ApiManager::BASE_URL = "http://localhost:3000";
const QString ApiManager::TEAMS_ENDPOINT = "/teams";

ApiManager::ApiManager(QObject *parent)
    : QObject(parent)
    , m_networkManager(new QNetworkAccessManager(this))
{
}

QNetworkRequest ApiManager::buildRequest(const QString &endpoint) const
{
    QNetworkRequest request;
    request.setUrl(QUrl(BASE_URL + endpoint));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    return request;
}

void ApiManager::setLoading(bool val)
{
    if (m_loading == val) return;
    m_loading = val;
    emit loadingChanged();
}

void ApiManager::setError(const QString &msg)
{
    if (m_error == msg) return;
    m_error = msg;
    emit errorChanged();
}

void ApiManager::fetchTeams()
{
    setLoading(true);
    setError("");
    QNetworkReply *reply = m_networkManager->get(buildRequest(TEAMS_ENDPOINT));

    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        reply->deleteLater();
        setLoading(false);
        if (reply->error() != QNetworkReply::NoError) {
            setError(reply->errorString());
            return;
        }
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        if (!doc.isArray()) {
            setError("Unexpected response from server");
            return;
        }

        m_teams.clear();
        for (const QJsonValue &v : doc.array())
            m_teams.append(v.toObject().toVariantMap());
        emit teamsChanged();
    });
}

void ApiManager::addTeam(const QJsonObject &teamData)
{
    QByteArray body = QJsonDocument(teamData).toJson(QJsonDocument::Compact);
    QNetworkReply *reply = m_networkManager->post(buildRequest(TEAMS_ENDPOINT), body);

    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        reply->deleteLater();
        if (reply->error() != QNetworkReply::NoError) {
            setError(reply->errorString());
            return;
        }
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        if (doc.isObject())
            emit teamAdded(doc.object());
        else
            setError("Unexpected response when adding team");
    });
}

void ApiManager::deleteTeam(const QString &id)
{
    QString endpoint = TEAMS_ENDPOINT + "/" + id;
    QNetworkReply *reply = m_networkManager->deleteResource(buildRequest(endpoint));

    connect(reply, &QNetworkReply::finished, this, [this, reply, id]() {
        reply->deleteLater();
        if (reply->error() != QNetworkReply::NoError) {
            setError(reply->errorString());
            return;
        }
        m_teams.erase(std::remove_if(m_teams.begin(), m_teams.end(),
                                     [&id](const QVariant &v) {
            return v.toMap().value("id").toString() == id;
        }), m_teams.end());
        emit teamsChanged();
        emit teamDeleted(id);
    });
}
