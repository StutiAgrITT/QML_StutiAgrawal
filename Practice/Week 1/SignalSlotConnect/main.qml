import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Text {
        id : notificationText
        text : "No action yet"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function showNotification(msg) {
        notificationText.text = "Last action: " + msg

        if (msg === "Open Google") {
            Qt.openUrlExternally("https://google.com")
        }
        else if (msg === "Display Time") {
            console.log(Qt.formatDateTime(new Date(), "hh:mm:ss"))
        }
        else if (msg === "Exit") {
            Qt.quit()
        }
    }

    function logAction(msg) {
        console.log("LOG: " + msg)
    }

    Rectangle {
        id: rect1Id
        width: 200
        height: 200
        color: "pink"
        x : 50
        y : 50

        HoverableMouseArea {
            id : btn1
            buttonName: "Open Google"
        }
    }

    Rectangle {
        id: rect2Id
        width: 200
        height: 200
        anchors.left: rect1Id.right
        color: "pink"
        y : rect1Id.y

        HoverableMouseArea {
            id: btn2
            buttonName: "Display Time"
        }
    }

    Rectangle {
        id: rect3Id
        width: 200
        height: 200
        color: "pink"
        anchors.left : rect2Id.right
        y : rect1Id.y

        HoverableMouseArea{
            id : btn3
            buttonName: "Exit"
        }
    }

    Component.onCompleted: {
        btn1.customClicked.connect(showNotification)
        btn2.customClicked.connect(showNotification)
        btn3.customClicked.connect(showNotification)
        btn1.customClicked.connect(logAction)
        btn2.customClicked.connect(logAction)
        btn3.customClicked.connect(logAction)
    }
}
