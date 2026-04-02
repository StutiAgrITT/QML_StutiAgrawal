import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 450
    height: 500
    title: qsTr("KeyPad")

    property string layoutMode: "alpha"
    property bool isKeypadVisible: true
    property bool isUpperCase: false

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

        { label: "←", type: "navigation", action: "left" },
        { label: "→", type: "navigation", action: "right" },
        { label: "Dismiss", type: "control", action: "dismiss", span: 2 },
    ]

    property var numericKeys: [
        { label: "1", type: "char" },
        { label: "2", type: "char" },
        { label: "3", type: "char" },
        { label: "Backspace", type: "control", action: "backspace" },

        { label: "4", type: "char" },
        { label: "5", type: "char" },
        { label: "6", type: "char" },
        { label: "Shift", type: "control", action: "shift" },

        { label: "7", type: "char" },
        { label: "8", type: "char" },
        { label: "9", type: "char" },
        { label: "Enter", type: "control", action: "enter" },

        { label: "*", type: "char" },
        { label: "0", type: "char" },
        { label: "ABC", type: "layout", action: "toAlpha" },
        { label: "#+=", type: "layout", action: "toSpecial" },

        { label: "Space", type: "control", action: "space", span: 4 },

        { label: "←", type: "navigation", action: "left" },
        { label: "→", type: "navigation", action: "right" },
        { label: "Dismiss", type: "control", action: "dismiss", span: 2 }
    ]

    property var specialKeys: [
        { label: "~`", type: "special" },
        { label: "!@", type: "special" },
        { label: "#$", type: "special" },
        { label: "Backspace", type: "control", action: "backspace" },

        { label: "%^", type: "special" },
        { label: "&*", type: "special" },
        { label: "_-", type: "special" },
        { label: "Shift", type: "control", action: "shift" },

        { label: "()", type: "special" },
        { label: "{}", type: "special" },
        { label: "[]", type: "special" },
        { label: "Enter", type: "control", action: "enter" },

        { label: "+=", type: "special" },
        { label: ".,", type: "special" },
        { label: "ABC", type: "layout", action: "toAlpha" },
        { label: "123", type: "layout", action: "toNumeric" },

        { label: "Space", type: "control", action: "space", span: 4 },

        { label: "←", type: "navigation", action: "left" },
        { label: "→", type: "navigation", action: "right" },
        { label: "Dismiss", type: "control", action: "dismiss", span: 2 }
    ]

    LetterPopup {
        id: letterPopup
        onLetterSelected: {
            insertChar(letter)
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        ScrollView {
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            clip : true

            TextArea {
                id: inputBox
                placeholderText: "Type here..."

                width: parent.width
                wrapMode: TextEdit.Wrap
                cursorVisible: true
                focus: true

                onPressed: {
                    isKeypadVisible = true
                }
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

            Loader {
                id: keypadLoader
                anchors.fill: parent

                sourceComponent:
                    layoutMode === "alpha" ? alphaLayout
                                           : layoutMode === "numeric" ? numericLayout
                                           : specialLayout
            }
        }
    }

    Component {
        id: alphaLayout
        GridLayout {
            anchors.fill: parent
            columns: 4
            columnSpacing: 6
            rowSpacing: 6

            Repeater {
                model: alphaKeys

                delegate: KeyButton {
                    label: modelData.type === "alpha"
                           ? (isUpperCase ? modelData.label.toUpperCase() : modelData.label)
                           : modelData.label
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

    Component {
        id: numericLayout
        GridLayout {
            anchors.fill: parent
            columns: 4
            columnSpacing: 6
            rowSpacing: 6

            Repeater {
                model: numericKeys

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

    Component {
        id: specialLayout
        GridLayout {
            anchors.fill: parent
            columns: 4
            columnSpacing: 6
            rowSpacing: 6

            Repeater {
                model: specialKeys

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

    function handleKey(label, type, action) {
        if (type === "char") {
            insertChar(label)
        }
        else if (type === "alpha" || type === "special") {
            openPopup(label)
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
            inputBox.forceActiveFocus()
        }

        else if (action === "right") {
            moveRight()
            inputBox.forceActiveFocus()
        }

        else if (action === "dismiss") {
            isKeypadVisible = false
        }

        else if (action === "shift") {
            isUpperCase = !isUpperCase
        }

        else if (action === "toNumeric") {
            layoutMode = "numeric"
        }

        else if (action === "toSpecial") {
            layoutMode = "special"
        }

        else if (action === "toAlpha") {
            layoutMode = "alpha"
        }
    }

    function insertChar(ch) {
        inputBox.insert(inputBox.cursorPosition, ch)
        inputBox.forceActiveFocus()
    }

    function deleteChar() {
        if (inputBox.cursorPosition > 0) {
            inputBox.remove(inputBox.cursorPosition - 1, inputBox.cursorPosition)
        }
        inputBox.forceActiveFocus()
    }

    function moveLeft() {
        if (inputBox.cursorPosition > 0)
            inputBox.cursorPosition--
    }

    function moveRight() {
        if (inputBox.cursorPosition < inputBox.length)
            inputBox.cursorPosition++
    }

    function openPopup(label) {
        letterPopup.letters = label.split("")
        letterPopup.open()
    }
}
