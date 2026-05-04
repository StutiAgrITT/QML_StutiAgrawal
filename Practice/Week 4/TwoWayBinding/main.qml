import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int p1: 0
    property int p2: 0

    Binding {
        target: root
        property: "p1"
        value: p2
    }

    Binding {
        target: root
        property: "p2"
        value: p1
    }

    Column {
        spacing: 20
        RowLayout {
            spacing: 10
            Button {
                text: "increase p1"
                onClicked: {
                    p1 += 1;
                }
            }

            Text {
                text: p1
            }
        }
        RowLayout {
            spacing: 10
            Button {
                text: "increase p2"
                onClicked: {
                    p2 += 1;
                }
            }

            Text {
                text: p2
            }
        }
    }
}
