import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TextEdit {
        width: 240
        text: "<b>Hello</b> <i>World</i>"
        textFormat: TextEdit.RichText
        font {
            family : "Helvetica"
            pointSize: 20
        }
        color: "blue"
        focus: true


    }
}
