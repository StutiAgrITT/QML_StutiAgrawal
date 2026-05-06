#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject {
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)
private:
    int m_value;

public:
    explicit Counter(QObject *parent = nullptr);
    int value() const;
    void setValue(int val);

signals:
    void valueChanged(int newValue);
    void someSignal();

public slots:
    void increment();
    void reset();
};

#endif // COUNTER_H
