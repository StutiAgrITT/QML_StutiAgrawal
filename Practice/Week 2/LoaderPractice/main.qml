import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Loader {
        id : loader
        anchors.centerIn: parent
    }

    Component {
        id: redBox
        Rectangle {
            width: 100
            height: 100
            color: "red"
        }
    }
    Component {
        id: blueBox
        Rectangle {
            width: 100
            height: 100
            color: "blue"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            loader.sourceComponent = loader.sourceComponent === redBox ? blueBox : redBox
        }
    }
}
