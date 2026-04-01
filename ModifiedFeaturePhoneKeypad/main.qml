import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 400
    height: 600
    title: qsTr("KeyPad")

    property string layoutMode: "alpha"
    property bool isKeypadVisible: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextArea {
            id: inputBox
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            placeholderText: "Type here..."

            onPressed: {
                isKeypadVisible = true
            }
        }

        Button {
            text: "Show Keyboard"
            Layout.fillWidth: true
            visible: !isKeypadVisible

            onClicked: {
                isKeypadVisible = true
            }
        }

        Rectangle {
            id : keypadContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgray"
            visible: isKeypadVisible

            Text {
                anchors.centerIn: parent
                text: "keypad area"
            }
        }
    }
}
