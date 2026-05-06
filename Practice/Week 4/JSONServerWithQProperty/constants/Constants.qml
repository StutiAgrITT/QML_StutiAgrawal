pragma Singleton
import QtQuick 2.12

QtObject {

    readonly property int windowWidth: 460
    readonly property int windowHeight: 760
    readonly property int windowMinWidth: 300
    readonly property int windowMinHeight: 400
    readonly property string windowTitle: "Cricket World Cup Teams"

    readonly property string apiBase: "http://localhost:3000"
    readonly property string apiTeams: "/teams"

    readonly property int spaceXs: 4
    readonly property int spaceS: 8
    readonly property int spaceM: 14
    readonly property int spaceL: 20

    readonly property int radiusS: 6
    readonly property int radiusM: 12
    readonly property int radiusL: 20

    readonly property int headerHeight: 64
    readonly property int footerHeight: 58
    readonly property int cardHeight: 88
    readonly property int cardLogoSize: 52
    readonly property int cardLogoRadius: 26
    readonly property int accentBarWidth: 4
    readonly property int accentBarRadius: 2
    readonly property int accentBarInset: 20
    readonly property int popupWidth: 380
    readonly property int popupMaxHeight: 540
    readonly property int popupHeaderHeight: 110
    readonly property int popupLogoSize: 70
    readonly property int popupLogoRadius: 35
    readonly property int popupCloseSize: 30
    readonly property int popupCloseRadius: 15
    readonly property int popupBodySpacing: 14
    readonly property int popupBodyMargin: 16
    readonly property int popupLabelMinWidth: 90
    readonly property int winsBadgeWidth: 44
    readonly property int winsBadgeHeight: 26
    readonly property int winsBadgeRadius: 13
    readonly property int chipHeight: 28
    readonly property int chipRadius: 14
    readonly property int chipPadding: 20
    readonly property int chipSpacing: 6
    readonly property int dividerHeight: 1
    readonly property int linkBtnHeight: 40
    readonly property int footerBtnHeight: 38
    readonly property int footerBtnRadius: 19
    readonly property int formFieldHeight: 38
    readonly property int formFieldRadius: 8
    readonly property int formBtnHeight: 42
    readonly property int formBtnRadius: 8
    readonly property int errBoxHeight: 34
    readonly property int errBoxRadius: 6
    readonly property int retrBtnWidth: 100
    readonly property int retrBtnHeight: 34
    readonly property int retrBtnRadius: 8
    readonly property int themeToggleSize: 40
    readonly property int themeToggleRadius: 20
    readonly property int headerIconSize: 28

    readonly property int fontS: 11
    readonly property int fontM: 13
    readonly property int fontL: 15
    readonly property int fontXL: 18
    readonly property int fontXXL: 20
    readonly property int fontTitle: 16
    readonly property int fontEmoji: 48
    readonly property int fontWarn: 40

    readonly property color colBgLight: "whitesmoke"
    readonly property color colBgDark: "black"
    readonly property color colSurfaceLight: "white"
    readonly property color colSurfaceDark: "darkslategray"
    readonly property color colHeaderBg: "midnightblue"
    readonly property color colAccent: "darkorange"
    readonly property color colDanger: "firebrick"
    readonly property color colDangerLight: "mistyrose"
    readonly property color colLink: "steelblue"
    readonly property color colLinkLight: "lightsteelblue"
    readonly property color colChipBg: "honeydew"
    readonly property color colChipText: "darkgreen"
    readonly property color colTextDark: "black"
    readonly property color colTextLight: "white"
    readonly property color colTextMuted: "gray"
    readonly property color colTextMutedLight: "lightgray"
    readonly property color colBorder: "lightgray"
    readonly property color colOverlay: "transparent"

    readonly property string headerTitle: "Cricket World Cup"
    readonly property string headerSubtitle: "ICC : All Teams"
    readonly property string themeIconLight: "🌞"
    readonly property string themeIconDark: "🌙"

    readonly property string btnRefresh: "↺  Refresh"
    readonly property string btnAdd: "+  Add Team"

    readonly property string labelCaptain: "Captain: "
    readonly property string labelWins: "🏆 "
    readonly property string labelWinsSuffix: " WC Win"
    readonly property string labelWinsSuffixP: " WC Wins"

    readonly property string labelCode: "Code: "
    readonly property string labelCaptainFull: "Captain"
    readonly property string labelWinsFull: "WC Wins"
    readonly property string labelKeyPlayers: "Key Players"
    readonly property string btnClose: "✕"
    readonly property string btnDeleteFull: "🗑  Delete Team"
    readonly property string linkLabel: "Official ICC Profile  ↗"

    readonly property string dialogTitle: "Add New Team"
    readonly property string fieldName: "Team Name *"
    readonly property string fieldShortName: "Short Name (e.g. IND) *"
    readonly property string fieldCaptain: "Captain *"
    readonly property string fieldWins: "World Cup Wins"
    readonly property string fieldLogoUrl: "Logo (qrc:/images/xxx.png)"
    readonly property string fieldPlayers: "Key Players (comma separated)"
    readonly property string fieldLink: "ICC Profile Link"
    readonly property string btnSave: "Save Team"
    readonly property string btnCancel: "Cancel"
    readonly property string validationError: "Please fill all required fields (*)"

    readonly property string stateLoading: "Loading teams..."
    readonly property string stateEmpty: "No teams found. Try refreshing."
    readonly property string stateError: "⚠️"
    readonly property string stateEmptyIcon: "🏏"
    readonly property string btnRetry: "Retry"
}
