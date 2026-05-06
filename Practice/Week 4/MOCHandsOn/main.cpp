#include <QCoreApplication>
#include <QDebug>
#include <QMetaObject>
#include <QMetaMethod>
#include "Counter.h"

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    Counter c1;
    Counter c2;

    // signal slot connection
    QObject::connect(&c1, &Counter::valueChanged, &c2, &Counter::setValue);

    // inspect class at runtime - works bcs of staticMetaObject
    const QMetaObject *meta = c1.metaObject();
    qDebug() << "Class name: " << meta->className();
    qDebug() << "Method count: " << meta->methodCount();

    for (int i = meta->methodOffset(); i < meta->methodCount(); i++) {
        QMetaMethod m = meta->method(i);
        qDebug() << " Method:" << m.methodSignature() << "| type: " << m.methodType();
    }

    //invoke a slot by name - works because of qt_static_metacall
    QMetaObject::invokeMethod(&c1, "increment");
    QMetaObject::invokeMethod(&c1, "increment");
    QMetaObject::invokeMethod(&c1, "increment");

    qDebug() << "c1 value: " << c1.value();
    qDebug() << "c2 value: " << c2.value();

    //read.write a property by string name - works bcs of Q_PROPERTY
    c1.setProperty("value", 100);
    qDebug() << "c1 after setProperty: " << c1.property("value");
    return 0;
}
