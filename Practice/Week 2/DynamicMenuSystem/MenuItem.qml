import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: menuItemComponent
    color: "pink"
    Layout.fillWidth: true
    height: 80
    property string label
    property int indexValue
    property var loaderRef
    Text {
        text : modelData
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (index == 0) loader.source = "Home.qml"
            else if (index == 1) loader.source = "Profile.qml"
            else loader.source = "Settings.qml"
        }
    }
}

