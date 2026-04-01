import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ListModel {
        id: studentModel
        ListElement {
            name: "Aman"
            marks: 85
            classroom: "A"
        }
        ListElement {
            name: "Riya"
            marks: 92
            classroom: "A"
        }
        ListElement {
            name: "Karan"
            marks: 70
            classroom: "B"
        }
        ListElement {
            name: "Neha"
            marks: 88
            classroom: "B"
        }
    }

    Component {
        id: studentDelegate
        Rectangle {
            height: 60
            width: parent.width
            color: ListView.isCurrentItem ? "lightblue" : "beige"
            border.color: "black"

            Text {
                id : nameText
                text: "Name: " + name
            }
            Text {
                id : marksText
                text: "Marks: " + marks
                anchors.top: nameText.bottom
            }
            Text {
                id : indexText
                text: "Index: " + index
                anchors.top: marksText.bottom
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    studentView.currentIndex = index
                }
            }
        }
    }

    ListView {
        id: studentView
        anchors.fill : parent
        model: studentModel
        delegate: studentDelegate

        header: Rectangle {
            height: 50
            width: parent.width
            color: "lightgray"
            Text {
                id: headerText
                text : "Student List"
                anchors.centerIn: parent
            }
        }

        footer: Rectangle {
            height: 50
            width: parent.width
            color: "lightgray"
        }

        section.property: "classroom"
        section.criteria: ViewSection.FullString
        section.delegate: Rectangle {
            width: parent.width
            height: 30
            color: "pink"

            Text {
                anchors.centerIn: parent
                text: "Class " + section
                font.bold: true
            }
        }
    }
}
