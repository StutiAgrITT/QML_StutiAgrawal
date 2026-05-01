import QtQuick 2.12
QtObject {
    id : root
    property var teams: []
    property bool loading : false
    property string error : ""

    Component.onCompleted: {
        apiManager.teamsLoaded.connect(onTeamsLoaded)
        apiManager.teamAdded.connect(onTeamAdded)
        apiManager.teamDeleted.connect(onTeamDeleted)
        apiManager.errorOccurred.connect(onError)
        fetchTeams()
    }

    function fetchTeams() {
        loading = true
        error   = ""
        apiManager.fetchTeams()
    }

    function addTeam(data) {
        apiManager.addTeam(data)
    }

    function deleteTeam(id) {
        apiManager.deleteTeam(id)
    }

    function onTeamsLoaded(loaded) {
        loading = false
        var arr = []
        for (var i = 0; i < loaded.length; i++)
            arr.push(loaded[i])
        teams = arr
    }

    function onTeamAdded(team) {
        fetchTeams()
    }

    function onTeamDeleted(id) {
        teams = teams.filter(function(t) { return String(t.id) !== String(id) })
    }

    function onError(msg) {
        loading = false
        error   = msg
    }
}
