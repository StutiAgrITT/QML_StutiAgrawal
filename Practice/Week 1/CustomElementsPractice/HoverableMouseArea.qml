import QtQuick 2.11

MouseArea {
    id: rootId
    property string buttonName: "default"
    property color hoverColor: "navajowhite"
    property color normalColor: "pink"
    anchors.fill: parent

    hoverEnabled: true

    onEntered: {
        parent.color = rootId.hoverColor
    }

    onExited: {
        parent.color = rootId.normalColor
    }

    Text {
        text : parent.buttonName
        anchors.centerIn: parent
    }
}
