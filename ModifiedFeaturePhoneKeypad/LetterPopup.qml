import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Popup {
    id: root
    property var letters
    signal letterSelected(string letter)

    y: parent.height - 200

    width: parent.width
    height: 80
    modal: true
    focus: true

    background: Rectangle {
        color: "white"
        border.color: "gray"
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: root.letters
            delegate: KeyButton {
                label : modelData
                keyType: "char"

                onKeyPressed: {
                    root.letterSelected(label)
                    root.close()
                }
            }
        }
    }
}
