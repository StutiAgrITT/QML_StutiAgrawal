import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        width: parent.width
        height: parent.height
        color: "beige"

        Image {
            source: "qrc:/images/images.jpeg"
            width: 200
            height: 200
            fillMode: Image.PreserveAspectFit
        }
    }
}
