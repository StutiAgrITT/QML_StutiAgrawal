#include "Counter.h"
#include <QDebug>

Counter::Counter(QObject *parent) :
    QObject(parent), m_value(0) {}

int Counter::value() const {
    return m_value;
}

void Counter::setValue(int val) {
    if (m_value == val) return;
    m_value = val;
    emit valueChanged(m_value);
}

void Counter::increment() {
    setValue(m_value + 1);
}

void Counter::reset() {
    setValue(0);
}



