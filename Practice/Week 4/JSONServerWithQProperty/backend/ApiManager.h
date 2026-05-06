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

    Q_PROPERTY(bool loading READ loading NOTIFY loadingChanged)
    Q_PROPERTY(QString error READ error NOTIFY errorChanged)
    Q_PROPERTY(QVariantList teams READ teams NOTIFY teamsChanged)

public:
    explicit ApiManager(QObject *parent = nullptr);

    bool loading() const { return m_loading; }
    QString error() const { return m_error; }
    QVariantList teams() const { return m_teams; }

    Q_INVOKABLE void fetchTeams();
    Q_INVOKABLE void addTeam(const QJsonObject &teamData);
    Q_INVOKABLE void deleteTeam(const QString &id);

signals:
    void loadingChanged();
    void errorChanged();
    void teamsChanged();
    void teamAdded(const QJsonObject &team);
    void teamDeleted(const QString &id);

private:
    QNetworkAccessManager *m_networkManager;

    bool m_loading = false;
    QString m_error;
    QVariantList m_teams;

    static const QString BASE_URL;
    static const QString TEAMS_ENDPOINT;

    QNetworkRequest buildRequest(const QString &endpoint) const;
    void setLoading(bool val);
    void setError(const QString &msg);
};

#endif 
