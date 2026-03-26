import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : rectId
        width: 200
        height: 200
        color: "aquamarine"
        property string name: "Stuti"
        property int age: 21
        property real sheight : 160.2
        property bool isStudent : true
        property var skills : ["C++", "Music", "Art"]
        property var profile: {"name" : "Stuti", "age": 21}

        Text {
            text : rectId.name
            y : 10
            font {
                pointSize : 20
            }
        }

        Text {
            text : rectId.age
            y : 50
            font {
                pointSize : 20
            }
        }

        Text {
            text : rectId.sheight
            y : 90
            font {
                pointSize : 20
            }
        }

        Text {
            text : rectId.isStudent ? "Yes" : "No"
            y : 130
            font {
                pointSize : 20
            }
        }
    }
}
