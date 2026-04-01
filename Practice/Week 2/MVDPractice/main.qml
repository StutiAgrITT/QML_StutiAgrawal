import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        color: "red"
        width: 200
    }

    Rectangle {
         width: 200; height: 200

        ListModel {
            id: fruitModel
            property string language: "en"
            ListElement {
                name: "Apple"
                cost: 2.45
            }
            ListElement {
                name: "Orange"
                cost: 3.25
            }
            ListElement {
                name: "Banana"
                cost: 1.95
            }
        }

        Component {
            id: fruitDelegate
            Row {
                id: fruit
                Text {
                    text: " Fruit: " + name
                    color: fruit.ListView.view.fruit_color
                }
                Text {
                    text: " Cost: $" + cost
                }
                Text {
                    text: " Language: " + fruit.ListView.view.model.language
                }
            }
        }

        ListView {
            property color fruit_color: "green"
            model: fruitModel
            delegate: fruitDelegate
            anchors.fill: parent
        }
    }
}
