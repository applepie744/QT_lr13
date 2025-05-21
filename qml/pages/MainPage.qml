import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    property bool buttonPressed: false

    Column {
        width: parent.width
        spacing: Theme.paddingLarge
        anchors.centerIn: parent

        Label {
            id: statusLabel
            text: buttonPressed ? "Кнопка нажата" : "Кнопка не нажата"
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.highlightColor
        }

        Button {
            id: controlButton
            text: "Нажми меня"
            anchors.horizontalCenter: parent.horizontalCenter

            onPressedChanged: {
                buttonPressed = pressed
            }
        }
    }
}
