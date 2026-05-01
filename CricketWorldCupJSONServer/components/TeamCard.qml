import QtQuick 2.12
import QtQuick.Layouts 1.12
import "../constants" 1.0

Rectangle {
    id: root

    property var teamData: ({})
    property bool isDark: false

    signal cardClicked(var team)

    width: parent.width
    height: Constants.cardHeight
    radius: Constants.radiusM
    color: cardArea.containsMouse
        ? (isDark ? "dimgray" : "gainsboro")
        : (isDark ? Constants.colSurfaceDark : Constants.colSurfaceLight)
    border.color: Constants.colBorder
    border.width: 1

    Rectangle {
        width: Constants.accentBarWidth
        height: parent.height - Constants.accentBarInset
        radius: Constants.accentBarRadius
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        color: Constants.colHeaderBg
    }

    RowLayout {
        anchors {
            fill: parent
            leftMargin: Constants.spaceM
            rightMargin: Constants.spaceS
            topMargin: Constants.spaceS
            bottomMargin: Constants.spaceS
        }
        spacing: Constants.spaceS

        Rectangle {
            width: Constants.cardLogoSize
            height: Constants.cardLogoSize
            radius: Constants.cardLogoRadius
            clip: true
            color: Constants.colBorder

            Image {
                anchors.fill: parent
                source: teamData.logoUrl || ""
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                sourceSize: Qt.size(Constants.cardLogoSize, Constants.cardLogoSize)

                Text {
                    anchors.centerIn: parent
                    visible: parent.status !== Image.Ready
                    text: teamData.shortName || "?"
                    font.pixelSize: Constants.fontM
                    font.bold: true
                    color: Constants.colTextMuted
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: Constants.spaceXs

            Text {
                text: (teamData.name || "") + "  ·  " + (teamData.shortName || "")
                font.pixelSize: Constants.fontL
                font.weight: Font.DemiBold
                color: isDark ? Constants.colTextLight : Constants.colTextDark
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Text {
                text: Constants.labelCaptain + (teamData.captain || "—")
                font.pixelSize: Constants.fontM
                color: isDark ? Constants.colTextMutedLight : Constants.colTextMuted
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

            Text {
                text: {
                    var w = teamData.worldCupWins || 0
                    return Constants.labelWins + w + (w === 1 ? Constants.labelWinsSuffix : Constants.labelWinsSuffixP)
                }
                font.pixelSize: Constants.fontS
                color: Constants.colAccent
            }
        }
    }

    MouseArea {
        id: cardArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.cardClicked(teamData)
    }
}
