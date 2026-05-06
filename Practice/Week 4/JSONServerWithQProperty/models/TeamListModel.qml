import QtQuick 2.12

QtObject {
    id: root

    property var teams: apiManager.teams
    property bool loading: apiManager.loading
    property string error: apiManager.error

    Component.onCompleted: {
        apiManager.teamAdded.connect(fetchTeams)
        fetchTeams()
    }

    function fetchTeams() {
        apiManager.fetchTeams()
    }
    function addTeam(data) {
        apiManager.addTeam(data)
    }
    function deleteTeam(id) {
        apiManager.deleteTeam(id)
    }
}
