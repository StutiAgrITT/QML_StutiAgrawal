import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        width: parent
        spacing: 20

        Slider {
            anchors.horizontalCenter: parent.horizontalCenter
            from : 1
            to : 100
            onValueChanged: {
                progress.value = value
            }
        }

        ProgressBar {
            anchors.horizontalCenter: parent.horizontalCenter
            id : progress
            from : 1
            to : 100

        }
    }
}
