import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../constants"

Popup {
    id: root

    property bool isDark: false

    signal teamSubmitted(var teamData)

    modal: true
    dim: true
    closePolicy: Popup.CloseOnEscape
    width: Constants.popupWidth
    height: Math.min(formCol.implicitHeight + 60, 600)
    anchors.centerIn: Overlay.overlay

    background: Rectangle {
        color: isDark ? Constants.colSurfaceDark : Constants.colSurfaceLight
        radius: Constants.radiusL
        border.color: Constants.colBorder
        border.width: 1
    }

    contentItem: ColumnLayout {
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            height: Constants.footerHeight
            radius: Constants.radiusL
            color: Constants.colHeaderBg

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: Constants.radiusL
                color: parent.color
            }

            RowLayout {
                anchors { fill: parent; leftMargin: Constants.popupBodyMargin; rightMargin: Constants.popupBodyMargin }

                Text {
                    text: Constants.dialogTitle
                    font.pixelSize: Constants.fontTitle
                    font.bold: true
                    color: Constants.colTextLight
                    Layout.fillWidth: true
                }

                Rectangle {
                    width: Constants.popupCloseSize
                    height: Constants.popupCloseSize
                    radius: Constants.popupCloseRadius
                    color: Constants.colOverlay

                    Text {
                        anchors.centerIn: parent
                        text: Constants.btnClose
                        color: Constants.colTextLight
                        font.pixelSize: Constants.fontM
                    }
                    MouseArea { anchors.fill: parent; onClicked: root.close() }
                }
            }
        }

        Flickable {
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: formCol.implicitHeight
            clip: true

            ColumnLayout {
                id: formCol
                width: parent.width
                spacing: Constants.spaceS

                Item { height: Constants.spaceXs }

                Rectangle {
                    id: errBox
                    Layout.fillWidth: true
                    Layout.leftMargin: Constants.popupBodyMargin
                    Layout.rightMargin: Constants.popupBodyMargin
                    height: visible ? Constants.errBoxHeight : 0
                    visible: false
                    radius: Constants.errBoxRadius
                    color: Constants.colDangerLight

                    Text {
                        anchors { left: parent.left; leftMargin: Constants.spaceS; verticalCenter: parent.verticalCenter }
                        text: Constants.validationError
                        font.pixelSize: Constants.fontM
                        color: Constants.colDanger
                    }
                }

                Repeater {
                    id: fieldRepeater
                    model: [
                        { lbl: Constants.fieldName, hint: ""},
                        { lbl: Constants.fieldShortName, hint: ""},
                        { lbl: Constants.fieldCaptain, hint: ""},
                        { lbl: Constants.fieldWins, hint: "e.g. 2", nums: true },
                        { lbl: Constants.fieldLogoUrl, hint: ""},
                        { lbl: Constants.fieldPlayers, hint: ""},
                        { lbl: Constants.fieldLink, hint: ""}
                    ]

                    FormField {
                        label: modelData.lbl
                        hint: modelData.hint
                        isDark: root.isDark
                        numbersOnly: modelData.nums || false
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: Constants.popupBodyMargin
                    Layout.rightMargin: Constants.popupBodyMargin
                    Layout.topMargin: Constants.spaceXs
                    spacing: Constants.spaceS

                    Rectangle {
                        Layout.fillWidth: true
                        height: Constants.formBtnHeight
                        radius: Constants.formBtnRadius
                        color: isDark ? Constants.colSurfaceDark : Constants.colBorder
                        border.color: Constants.colBorder
                        border.width: 1

                        Text {
                            anchors.centerIn: parent
                            text: Constants.btnCancel
                            font.pixelSize: Constants.fontM
                            color: isDark ? Constants.colTextLight : Constants.colTextDark
                        }
                        MouseArea { anchors.fill: parent; onClicked: root.close() }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: Constants.formBtnHeight
                        radius: Constants.formBtnRadius
                        color: saveArea.containsMouse ? "green" : Constants.colHeaderBg

                        Text {
                            anchors.centerIn: parent
                            text: Constants.btnSave
                            font.pixelSize: Constants.fontM
                            font.bold: true
                            color: Constants.colTextLight
                        }
                        MouseArea { id: saveArea; anchors.fill: parent; hoverEnabled: true; onClicked: submit() }
                    }
                }

                Item { height: Constants.spaceS }
            }
        }
    }

    function submit() {
        var name = fieldRepeater.itemAt(0).value.trim()
        var shortNm = fieldRepeater.itemAt(1).value.trim()
        var captain = fieldRepeater.itemAt(2).value.trim()

        if (name === "" || shortNm === "" || captain === "") {
            errBox.visible = true
            return
        }
        errBox.visible = false

        var playersRaw = fieldRepeater.itemAt(5).value.trim()
        var players = playersRaw === ""
                ? []
                : playersRaw.split(",").map(function(p) { return p.trim() })

        root.teamSubmitted({
                               name: name,
                               shortName: shortNm.toUpperCase(),
                               captain: captain,
                               worldCupWins: parseInt(fieldRepeater.itemAt(3).value) || 0,
                               logoUrl: fieldRepeater.itemAt(4).value.trim(),
                               keyPlayers: players,
                               profileLink: fieldRepeater.itemAt(6).value.trim()
                           })
        clear()
        root.close()
    }

    function clear() {
        for (var i = 0; i < fieldRepeater.count; i++)
            fieldRepeater.itemAt(i).value = ""
        errBox.visible = false
    }
}
