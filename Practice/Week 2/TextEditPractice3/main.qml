import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Flickable {
        width: 150
        height: 150
        clip : true

        contentWidth: width
        //contentHeight: edit.contentHeight


        TextEdit {
            id : edit
            width: parent.width
            wrapMode: TextEdit.Wrap
            focus: true
        }
    }

    Text {
        id: lengthId
        text: "Length: " + edit.length
        y : 170
    }
}
