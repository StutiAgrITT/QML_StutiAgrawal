#include "backendhelper.h"
#include <QDebug>
#include <QDateTime>

BackendHelper::BackendHelper(QObject* parent) :
    QObject(parent)
{

}

void BackendHelper::printText()
{
    qInfo() << "Backend called";
}

QString BackendHelper::getDate()
{
    return QDateTime::currentDateTime().toString();
}
