import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string mstring: "hello"
    property int mint: 80
    property bool isFemale: true

    Rectangle {
        id : blueRectId
        width: 150
        height: 150 + mint
        color: "blue"
        radius: 10
        Text {
            id: textId
            text: mstring
            anchors.centerIn: parent
            font.bold: isFemale ? true : false
        }
    }

    Component.onCompleted: {
        console.log("value of mstring is : " + mstring)
        console.log("value of mint is : " + mint)
        if (isFemale) {
            console.log("you may wear a dress")
        }
        else {
            console.log("you may wear a suit")
        }

    }
}
