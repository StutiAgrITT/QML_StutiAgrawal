import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 400
    height: 600
    title: qsTr("KeyPad")

    property string layoutMode: "alpha"
    property bool isKeypadVisible: true

    property var alphaKeys:[
        { label: "abc", type: "alpha" },
        { label: "def", type: "alpha" },
        { label: "ghi", type: "alpha" },
        { label: "Backspace", type: "control", action: "backspace" },

        { label: "jkl", type: "alpha" },
        { label: "mno", type: "alpha" },
        { label: "pqrs", type: "alpha" },
        { label: "Shift", type: "control", action: "shift" },

        { label: "tuv", type: "alpha" },
        { label: "wxyz", type: "alpha" },
        { label: ",", type: "char" },
        { label: "Enter", type: "control", action: "enter" },

        { label: "?", type: "char" },
        { label: ".", type: "char" },
        { label: "123", type: "layout", action: "toNumeric" },
        { label: "!@#", type: "layout", action: "toSpecial" },

        { label: "Space", type: "control", action: "space", span: 4 },

        { label: "<-", type: "navigation", action: "left" },
        { label: "->", type: "navigation", action: "right" },
        { label: "Dismiss", type: "control", action: "dismiss", span: 2 },
    ]

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextArea {
            id: inputBox
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            placeholderText: "Type here..."

            onPressed: {
                isKeypadVisible = true
            }
        }

        Button {
            text: "Show Keyboard"
            Layout.fillWidth: true
            visible: !isKeypadVisible

            onClicked: {
                isKeypadVisible = true
            }
        }

        Rectangle {
            id : keypadContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgray"
            visible: isKeypadVisible

            GridLayout {
                anchors.fill: parent
                columns: 4
                columnSpacing: 6
                rowSpacing: 6

                Repeater {
                    model: alphaKeys

                    delegate: KeyButton {
                        label: modelData.label
                        keyType: modelData.type

                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        Layout.columnSpan: modelData.span ? modelData.span : 1

                        onKeyPressed: {
                            handleKey(label, keyType, modelData.action)
                        }
                    }
                }
            }
        }
    }

    function handleKey(label, type, action) {
        if (type === "char") {
            insertChar(label)
        }
        else if (type === "alpha") {
            insertChar(label[0]) // temporary
        }

        else if (action === "backspace") {
            deleteChar()
        }

        else if (action === "enter") {
            insertChar("\n")
        }

        else if (action === "space") {
            insertChar(" ")
        }

        else if (action === "left") {
            moveLeft()
        }

        else if (action === "right") {
            moveRight()
        }

        else if (action === "dismiss") {
            isKeypadVisible = false
        }
    }

    function insertChar(ch) {
        inputBox.insert(inputBox.cursorPosition, ch)
    }

    function deleteChar() {
        if (inputBox.cursorPosition > 0) {
            inputBox.remove(inputBox.cursorPosition - 1, inputBox.cursorPosition)
        }
    }

    function moveLeft() {
        if (inputBox.cursorPosition > 0)
            inputBox.cursorPosition--
    }

    function moveRight() {
        if (inputBox.cursorPosition < inputBox.length)
            inputBox.cursorPosition++
    }
}
