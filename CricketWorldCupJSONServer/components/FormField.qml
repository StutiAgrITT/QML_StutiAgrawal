import QtQuick 2.12
import QtQuick.Layouts 1.12
import "../constants"

ColumnLayout {
    property bool   isDark
    property string label
    property alias value: input.text
    property string hint:  ""
    property bool numbersOnly: false

    Layout.fillWidth: true
    Layout.leftMargin: Constants.popupBodyMargin
    Layout.rightMargin: Constants.popupBodyMargin
    spacing: Constants.spaceXs

    Text {
        text: label
        font.pixelSize: Constants.fontM
        font.bold: true
        color: Constants.colTextMuted
    }

    Rectangle {
        Layout.fillWidth: true
        height: Constants.formFieldHeight
        radius: Constants.formFieldRadius
        color: isDark ? Constants.colSurfaceDark : Constants.colBorder
        border.color: input.activeFocus ? Constants.colHeaderBg : Constants.colBorder
        border.width: input.activeFocus ? 2 : 1

        TextInput {
            id: input
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: Constants.spaceS
                rightMargin: Constants.spaceS
                verticalCenter: parent.verticalCenter
            }
            font.pixelSize: Constants.fontM
            color: isDark ? Constants.colTextLight : Constants.colTextDark
            clip: true
            inputMethodHints: numbersOnly ? Qt.ImhDigitsOnly : Qt.ImhNone
            Keys.onPressed: {
                if (numbersOnly && event.text !== "" && isNaN(parseInt(event.text))) {
                    event.accepted = true
                }
            }
            Text {
                visible: input.text.length === 0
                text: hint
                font.pixelSize: Constants.fontM
                color: Constants.colTextMuted
            }
        }
    }
}
