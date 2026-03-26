import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property var fonts: Qt.fontFamilies() //listing fonts
    Rectangle {
        width : 300
        height: 100
        color: "lightpink"
        anchors.centerIn: parent

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("Quitting the app")
                Qt.quit() //closing application

                for (var i = 0; i < fonts.length; i++) {
                    console.log(fonts[i])
                }

                // hashing
                var name = "Stuti Agrawal"
                var hashName = Qt.md5(name)
                console.log("hash of name: " + hashName)

                //open url externally
                Qt.openUrlExternally("https://www.spotify.com")

                //open local files
                Qt.openUrlExternally("file:///home/stuti/Downloads/F1\ Theme.mp3")

                // capture platform info
                console.log("The current platform is : " + Qt.platform.os)
            }
        }
    }
}
