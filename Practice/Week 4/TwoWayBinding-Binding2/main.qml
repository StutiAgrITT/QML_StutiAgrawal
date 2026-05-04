import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int p1: 0
    property int p2: 0
    property bool p1WasLast: true

    Binding {
        target: root
        property: "p1"
        value: root.p2
        when: !p1WasLast
    }
    Binding {
        target: root
        property: "p2"
        value: root.p1
        when: p1WasLast
    }

    Column {
        spacing: 10

        Row {
            spacing: 10
            Button {
                onClicked: {
                    root.p1WasLast = true
                    p1 += 1
                }
            }
            Text {
                text: p1
            }
        }

        Row {
            spacing: 10
            Button {
                onClicked: {
                    root.p1WasLast = false
                    p2 += 1
                }
            }
            Text {
                text: p2
            }
        }

    }

}
