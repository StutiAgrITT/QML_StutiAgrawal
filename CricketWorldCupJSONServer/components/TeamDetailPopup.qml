import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../constants" 1.0

Popup {
    id: root

    property var teamData: ({})
    property bool isDark: false

    signal deleteRequested(var teamId)

    modal: true
    dim: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    width: Constants.popupWidth
    height: Math.min(contentCol.implicitHeight + Constants.spaceL, Constants.popupMaxHeight)
    anchors.centerIn: Overlay.overlay

    background: Rectangle {
        color: isDark ? Constants.colSurfaceDark : Constants.colSurfaceLight
        radius: Constants.radiusL
        border.color: Constants.colBorder
        border.width: 1
    }

    contentItem: Flickable {
        contentHeight: contentCol.implicitHeight
        clip: true

        ColumnLayout {
            id: contentCol
            width: parent.width
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                height: Constants.popupHeaderHeight
                radius: Constants.radiusL
                color: Constants.colHeaderBg

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: Constants.radiusL
                    color: parent.color
                }

                RowLayout {
                    anchors { fill: parent; margins: Constants.popupBodyMargin }
                    spacing: Constants.spaceM

                    Rectangle {
                        width: Constants.popupLogoSize
                        height: Constants.popupLogoSize
                        radius: Constants.popupLogoRadius
                        clip: true
                        color: Constants.colSurfaceLight

                        Image {
                            anchors.fill: parent
                            source: root.teamData.logoUrl || ""
                            fillMode: Image.PreserveAspectCrop
                            asynchronous: true
                            sourceSize: Qt.size(Constants.popupLogoSize, Constants.popupLogoSize)

                            Text {
                                anchors.centerIn: parent
                                visible: parent.status !== Image.Ready
                                text: root.teamData.shortName || "?"
                                font.pixelSize: Constants.fontXL
                                font.bold: true
                                color: Constants.colTextMuted
                            }
                        }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: Constants.spaceXs

                        Text {
                            text: root.teamData.name || ""
                            font.pixelSize: Constants.fontXXL
                            font.bold: true
                            color: Constants.colTextLight
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }

                        Text {
                            text: Constants.labelCode + (root.teamData.shortName || "—")
                            font.pixelSize: Constants.fontM
                            color: Constants.colChipBg
                        }
                    }

                    Rectangle {
                        width: Constants.popupCloseSize
                        height: Constants.popupCloseSize
                        radius: Constants.popupCloseRadius
                        color: closeArea.containsMouse ? Constants.colTextMuted : Constants.colOverlay

                        Text {
                            anchors.centerIn: parent
                            text: Constants.btnClose
                            color: Constants.colTextLight
                            font.pixelSize: Constants.fontM
                        }

                        MouseArea {
                            id: closeArea
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: root.close()
                        }
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.margins: Constants.popupBodyMargin
                spacing: Constants.popupBodySpacing

                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: Constants.labelCaptainFull
                        font.pixelSize: Constants.fontM
                        font.bold: true
                        color: Constants.colTextMuted
                        Layout.minimumWidth: Constants.popupLabelMinWidth
                    }
                    Text {
                        text: root.teamData.captain || "—"
                        font.pixelSize: Constants.fontM
                        color: isDark ? Constants.colTextLight : Constants.colTextDark
                        Layout.fillWidth: true
                    }
                }

                RowLayout {
                    Layout.fillWidth: true

                    Text {
                        text: Constants.labelWinsFull
                        font.pixelSize: Constants.fontM
                        font.bold: true
                        color: Constants.colTextMuted
                        Layout.minimumWidth: Constants.popupLabelMinWidth
                    }

                    Rectangle {
                        width: Constants.winsBadgeWidth
                        height: Constants.winsBadgeHeight
                        radius: Constants.winsBadgeRadius
                        color: Constants.colAccent

                        Text {
                            anchors.centerIn: parent
                            text: root.teamData.worldCupWins !== undefined ? root.teamData.worldCupWins : "0"
                            font.pixelSize: Constants.fontM
                            font.bold: true
                            color: Constants.colTextLight
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: Constants.dividerHeight
                    color: Constants.colBorder
                }

                Text {
                    text: Constants.labelKeyPlayers
                    font.pixelSize: Constants.fontM
                    font.bold: true
                    color: Constants.colTextMuted
                }

                Flow {
                    Layout.fillWidth: true
                    spacing: Constants.chipSpacing

                    Repeater {
                        model: root.teamData.keyPlayers || []

                        Rectangle {
                            height: Constants.chipHeight
                            width: chipText.implicitWidth + Constants.chipPadding
                            radius: Constants.chipRadius
                            color: isDark ? Constants.colSurfaceDark : Constants.colChipBg

                            Text {
                                id: chipText
                                anchors.centerIn: parent
                                text: modelData
                                font.pixelSize: Constants.fontM
                                color: isDark ? Constants.colTextLight : Constants.colChipText
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: Constants.dividerHeight
                    color: Constants.colBorder
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: Constants.linkBtnHeight
                    radius: Constants.radiusS
                    visible: root.teamData.profileLink !== undefined && root.teamData.profileLink !== ""
                    color: profileArea.containsMouse ? Constants.colLink : Constants.colLinkLight

                    Text {
                        anchors.centerIn: parent
                        text: Constants.linkLabel
                        font.pixelSize: Constants.fontM
                        font.bold: true
                        color: isDark ? Constants.colTextLight : Constants.colTextDark
                    }

                    MouseArea {
                        id: profileArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Qt.openUrlExternally(root.teamData.profileLink || "")
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: Constants.linkBtnHeight
                    radius: Constants.radiusS
                    color: popDelArea.containsMouse ? Constants.colDanger : Constants.colDangerLight

                    Text {
                        anchors.centerIn: parent
                        text: Constants.btnDeleteFull
                        font.pixelSize: Constants.fontM
                        font.bold: true
                        color: popDelArea.containsMouse ? Constants.colTextLight : Constants.colDanger
                    }

                    MouseArea {
                        id: popDelArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            root.deleteRequested(root.teamData.id)
                            root.close()
                        }
                    }
                }

                Item { height: Constants.spaceXs }
            }
        }
    }
}
