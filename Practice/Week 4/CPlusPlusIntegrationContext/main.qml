import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
        id: btn
        anchors.centerIn: parent
        text : "click me"
        onClicked:
            cBackendHelper.printText()
    }

    Text {
        font {
            pointSize: 15
            family: "Times New Roman"
        }
        anchors.top : btn.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: cBackendHelper.getDate()
    }

}
