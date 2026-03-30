import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")



    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Layout.fillWidth: true
            spacing: 10
            Repeater {
                model : ["Home", "Profile", "Settings"]
                delegate: MenuItem {
                    label: modelData
                    indexValue: index
                    loaderRef: loader
                }
            }
        }
        Loader {
            id : loader
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "Home.qml"
        }

    }
}
