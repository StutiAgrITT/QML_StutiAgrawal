import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id: root

    property string label
    property string keyType

    signal keyPressed(string label, string keyType)

    text: label

    onClicked:{
        keyPressed(label, keyType)
    }
}
