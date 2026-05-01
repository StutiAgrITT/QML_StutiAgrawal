#ifndef APIMANAGER_H
#define APIMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QJsonArray>
#include <QJsonObject>
#include <QUrl>

class ApiManager : public QObject
{
    Q_OBJECT

public:
    explicit ApiManager(QObject *parent = nullptr);

    Q_INVOKABLE void fetchTeams();
    Q_INVOKABLE void addTeam(const QJsonObject &teamData);
    Q_INVOKABLE void deleteTeam(const QString &id);

signals:
    void teamsLoaded(const QJsonArray &teams);
    void teamAdded(const QJsonObject &team);
    void teamDeleted(const QString &id);
    void errorOccurred(const QString &message);

private:
    QNetworkAccessManager *m_networkManager;

    static const QString BASE_URL;
    static const QString TEAMS_ENDPOINT;

    QNetworkRequest buildRequest(const QString &endpoint) const;
};

#endif 