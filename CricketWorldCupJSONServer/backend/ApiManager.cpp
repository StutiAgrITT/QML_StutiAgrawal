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

void ApiManager::fetchTeams()
{
    QNetworkReply *reply = m_networkManager->get(buildRequest(TEAMS_ENDPOINT));

    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        reply->deleteLater();
        if (reply->error() != QNetworkReply::NoError) {
            emit errorOccurred(reply->errorString());
            return;
        }
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        if (doc.isArray())
            emit teamsLoaded(doc.array());
        else
            emit errorOccurred("Unexpected response from server");
    });
}

void ApiManager::addTeam(const QJsonObject &teamData)
{
    QByteArray body = QJsonDocument(teamData).toJson(QJsonDocument::Compact);
    QNetworkReply *reply = m_networkManager->post(buildRequest(TEAMS_ENDPOINT), body);

    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        reply->deleteLater();
        if (reply->error() != QNetworkReply::NoError) {
            emit errorOccurred(reply->errorString());
            return;
        }
        QJsonDocument doc = QJsonDocument::fromJson(reply->readAll());
        if (doc.isObject())
            emit teamAdded(doc.object());
        else
            emit errorOccurred("Unexpected response when adding team");
    });
}

void ApiManager::deleteTeam(const QString &id)
{
    QString endpoint = TEAMS_ENDPOINT + "/" + id;
    QNetworkReply *reply = m_networkManager->deleteResource(buildRequest(endpoint));

    connect(reply, &QNetworkReply::finished, this, [this, reply, id]() {
        reply->deleteLater();
        if (reply->error() != QNetworkReply::NoError) {
            emit errorOccurred(reply->errorString());
            return;
        }
        emit teamDeleted(id);
    });
}