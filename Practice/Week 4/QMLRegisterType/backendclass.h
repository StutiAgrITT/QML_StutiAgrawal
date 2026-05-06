#ifndef BACKENDCLASS_H
#define BACKENDCLASS_H

#include <QObject>

class BackendClass : public QObject
{
    Q_OBJECT
public:
    explicit BackendClass(QObject *parent = nullptr);
    Q_INVOKABLE int getNumber();
signals:

};

#endif // BACKENDCLASS_H
