import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "components"
import "models"
import "constants"

ApplicationWindow {
    id: root
    visible: true
    width: Constants.windowWidth
    height: Constants.windowHeight
    minimumWidth: Constants.windowMinWidth
    minimumHeight: Constants.windowMinHeight
    title: Constants.windowTitle

    property bool dark: false

    property color cBg: dark ? Constants.colBgDark : Constants.colBgLight
    property color cHeader: Constants.colHeaderBg
    property color cFooter: Constants.colHeaderBg
    property color cTextSub: Constants.colTextMuted
    color: cBg

    TeamListModel { id: teamModel }

    header: Rectangle {
        width:  parent.width
        height: Constants.headerHeight
        color:  root.cHeader

        RowLayout {
            anchors {
                fill: parent
                leftMargin: Constants.spaceL
                rightMargin: Constants.spaceL
                topMargin: Constants.spaceS
                bottomMargin: Constants.spaceS
            }
            spacing: Constants.spaceS

            Text {
                text: "🏆"
                font.pixelSize: Constants.headerIconSize
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: Constants.spaceXs

                Text {
                    text: Constants.headerTitle
                    font.pixelSize: Constants.fontTitle
                    font.bold: true
                    color: Constants.colTextLight
                }
                Text {
                    text: Constants.headerSubtitle
                    font.pixelSize: Constants.fontS
                    color: Constants.colChipBg
                }
            }

            Rectangle {
                width: Constants.themeToggleSize
                height: Constants.themeToggleSize
                radius: Constants.themeToggleRadius
                color: themeArea.containsMouse ? Constants.colTextMuted : Constants.colOverlay

                Text {
                    anchors.centerIn: parent
                    text: root.dark ? Constants.themeIconLight : Constants.themeIconDark
                    font.pixelSize: Constants.fontXXL
                }
                MouseArea {
                    id: themeArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: root.dark = !root.dark
                }
            }
        }
    }

    footer: Rectangle {
        width: parent.width
        height: Constants.footerHeight
        color: root.cFooter

        RowLayout {
            anchors {
                fill: parent
                leftMargin: Constants.spaceL
                rightMargin: Constants.spaceL
                topMargin: Constants.spaceS
                bottomMargin: Constants.spaceS
            }
            spacing: Constants.spaceS

            Rectangle {
                Layout.fillWidth: true
                height: Constants.footerBtnHeight
                radius: Constants.footerBtnRadius
                color: refArea.containsMouse ? Constants.colTextMuted : Constants.colOverlay

                Text {
                    anchors.centerIn: parent
                    text: Constants.btnRefresh
                    font.pixelSize: Constants.fontM
                    font.bold: true
                    color: Constants.colTextLight
                }
                MouseArea {
                    id: refArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: teamModel.fetchTeams()
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: Constants.footerBtnHeight
                radius: Constants.footerBtnRadius
                color: Constants.colAccent
                Text {
                    anchors.centerIn: parent
                    text: Constants.btnAdd
                    font.pixelSize: Constants.fontM
                    font.bold: true
                    color: Constants.colTextDark
                }
                MouseArea {
                    id: addArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: addDialog.open()
                }
            }
        }
    }

    Item {
        anchors.fill: parent

        Column {
            anchors.centerIn: parent
            visible: teamModel.loading
            spacing: Constants.spaceS

            BusyIndicator {
                anchors.horizontalCenter: parent.horizontalCenter
                running: true
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: Constants.stateLoading
                font.pixelSize: Constants.fontL
                color: root.cTextSub
            }
        }

        Column {
            anchors.centerIn: parent
            visible: !teamModel.loading && teamModel.error !== ""
            spacing: Constants.spaceS

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: Constants.stateError
                font.pixelSize: Constants.fontWarn
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: teamModel.error
                font.pixelSize: Constants.fontM
                color: root.cTextSub
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                width: 280
            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Constants.retrBtnWidth
                height: Constants.retrBtnHeight
                radius: Constants.retrBtnRadius
                color: Constants.colHeaderBg

                Text {
                    anchors.centerIn: parent
                    text: Constants.btnRetry
                    color: Constants.colTextLight
                    font.pixelSize: Constants.fontM
                }
                MouseArea { anchors.fill: parent; onClicked: teamModel.fetchTeams() }
            }
        }

        Column {
            anchors.centerIn: parent
            visible: !teamModel.loading && teamModel.error === "" && teamModel.teams.length === 0
            spacing: Constants.spaceS

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text:Constants.stateEmptyIcon
                font.pixelSize: Constants.fontEmoji
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text:Constants.stateEmpty
                font.pixelSize: Constants.fontL
                color:root.cTextSub
            }
        }

        ListView {
            anchors { fill: parent; margins: Constants.spaceS }
            visible: !teamModel.loading && teamModel.error === ""
            model: teamModel.teams
            spacing: Constants.spaceS
            clip: true

            ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

            delegate: TeamCard {
                width: ListView.view.width
                teamData: modelData
                isDark: root.dark

                onCardClicked: function(team) {
                    detailPopup.teamData = team
                    detailPopup.open()
                }
            }
        }
    }

    TeamDetailPopup {
        id: detailPopup
        isDark: root.dark
        onDeleteRequested: function(id) { teamModel.deleteTeam(id) }
    }

    AddTeamDialog {
        id: addDialog
        isDark: root.dark
        onTeamSubmitted: function(data) { teamModel.addTeam(data) }
    }
}
