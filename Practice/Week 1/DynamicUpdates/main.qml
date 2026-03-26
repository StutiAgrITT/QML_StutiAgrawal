import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "QML Data Types Demo"

    property int myInt: 10
    property real myFloat: 10.5
    property bool isVisible: true
    property string myString: "Hello Stuti"
    property color myColor: "blue"

    property var myArray: [1, 2, 3, 4]
    property var myObject: { "name": "Stuti", "age": 21 }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text { text: "Int: " + myInt }
        Text { text: "Float: " + myFloat }
        Text { text: "Boolean: " + isVisible }
        Text { text: "String: " + myString }
        Text { text: "Color name: " + myColor }

        Rectangle {
            width: 100
            height: 50
            color: myColor
        }

        Text { text: "Array first element: " + myArray[0] }

        Text { text: "Object name: " + myObject.name }

        Button {
            text: "Change Values"

            onClicked: {
                myInt = 20
                myFloat = 99.9
                isVisible = false
                myString = "Updated"
                myColor = "green"

                myArray.push(5)
                myObject.age = 22

                console.log("Array:", myArray)
                console.log("Object:", myObject)
            }
        }
    }
}
