import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : rectId
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent

//    using ternary
//        color: width > 500 ? "purple"
//             : width > 400 ? "blue"
//             : width > 300 ? "green"
//             : width > 200 ? "yellow"
//             : "red"

//    using js block version
        color : {
            if (width > 500) return "purple"
            else if (width > 400) return "blue"
            else if (width > 300) return "green"
            else if (width > 200) return "yellow"
            else return "red"
        }
    }
}
