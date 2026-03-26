import QtQuick 2.11

FocusScope {
    width: containerRect.width
    height: containerRect.height
    property alias color: containerRect.color
    Rectangle {
        id: containerRect
        width: 300
        height: 50
        color: "paleturquoise"
        focus : true

        Text {
            id : textId
            anchors.centerIn: parent
            text: "Default"
        }

        Keys.onPressed: function(event){
            if (event.key === Qt.Key_1) {
                textId.text = "Pressed on Key1"
            }
            else if (event.key === Qt.Key_2) {
                textId.text = "Pressed on Key2"
            }
            else {
                textId.text = "Pressed on another key : " + event.key
            }
        }
    }
}
