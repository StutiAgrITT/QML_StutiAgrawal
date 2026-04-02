import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id: root

    property string label
    property string keyType

    signal keyPressed(string label, string keyType)

    contentItem: Text {
        text: root.label
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        textFormat: Text.PlainText
        color: "black"
    }

    onClicked:{
        keyPressed(label, keyType)
    }
}
