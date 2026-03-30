import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    RowLayout {
        anchors.fill: parent
        Rectangle {
            Layout.preferredWidth: 120
            Layout.fillHeight: true
            color: "lightgray"
        }

        ColumnLayout {
            id : mainArea
            Layout.fillWidth: true
            Layout.fillHeight: true

            Rectangle {
                id: topBar
                Layout.preferredHeight: 60
                Layout.fillWidth: true
                color: "darkblue"
            }

            Rectangle {
                id: contentArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "lightblue"

                RowLayout {
                    anchors.fill: parent
                    spacing: 10

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 80
                        color: "red"
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 80
                        color: "blue"
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 80
                        color: "green"
                    }
                }
            }
        }
    }
}
