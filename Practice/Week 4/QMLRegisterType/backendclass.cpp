#include "backendclass.h"

BackendClass::BackendClass(QObject *parent) : QObject(parent)
{

}

int BackendClass::getNumber() {
    return 21;
}
