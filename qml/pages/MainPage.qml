import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property string value1: ""
    property string value2: ""
    property string result: ""

    Column {
        width: parent.width
        spacing: Theme.paddingLarge
        anchors.centerIn: parent

        Button {
            text: "Открыть диалог"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var dialog = pageStack.push("SumDialog.qml")
                dialog.accepted.connect(function() {
                    value1 = dialog.value1
                    value2 = dialog.value2
                    result = dialog.result
                })
            }
        }

        Label {
            text: "Первое число: " + value1
            visible: value1 !== ""
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: "Второе число: " + value2
            visible: value2 !== ""
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: "Сумма: " + result
            visible: result !== ""
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
            font.bold: true
        }
    }
}
