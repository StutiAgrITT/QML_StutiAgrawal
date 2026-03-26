import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("External Components with signals and slots")

    Notifier {
        id: notifierId
        rectColor: "blanchedalmond"
    }

    Receiver {
        id: receiverId
        anchors.right: parent.right
        rectColor: "burlywood"
    }
    Component.onCompleted: {
        notifierId.notify.connect(receiverId.receiveInfo)
    }
}
