import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.6

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property color currentBgColor: "transparent"
    property string rect2Text: "Вот текст"
    property real elementsOpacity: 1.0
    property int rectSize: 200

    property var colorPool: ["red", "blue", "green"]
    property int rect1ColorIndex: 0
    property int rect2ColorIndex: 1
    property int rect3ColorIndex: 2


    Audio {
        id: buttonSound
        property bool wasPlayed: false
        source: "qrc:/sounds/click.wav"
        volume: 1.0

        onPlaying: {
            wasPlayed = true;
            console.log("Начало воспроизведения");
        }

        onStopped: {
            if (wasPlayed) {
                console.log("Воспроизведение завершено успешно");
                wasPlayed = false;
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: currentBgColor
        z: -1
    }

    Column {
        width: parent.width
        spacing: Theme.paddingLarge

        PageHeader {
            objectName: "pageHeader"
            title: qsTr("Лабораторная работа 12")
        }

        Button {
            text: "Сменить цвет фона"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                buttonSound.play()
                if (currentBgColor === Theme.highlightBackgroundColor) {
                    currentBgColor = "transparent"
                } else if (currentBgColor === "lightgray") {
                    currentBgColor = "lightyellow"
                } else {
                    currentBgColor = Theme.highlightBackgroundColor
                }
            }
        }

        Row {
            width: parent.width - 2*Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingMedium

            TextField {
                id: textInput
                width: parent.width - updateButton.width - parent.spacing
                placeholderText: "Введите текст для rect2"
                label: "Новый текст"
            }

            Button {
                id: updateButton
                text: "Обновить"
                onClicked: {
                    buttonSound.play()
                    if (textInput.text !== "") {
                        rect2Text = textInput.text
                    }
                }
            }
        }

        Slider {
            width: parent.width - 2*Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            minimumValue: 0
            maximumValue: 1
            stepSize: 0.1
            value: elementsOpacity
            label: "Прозрачность элементов"
            onValueChanged: elementsOpacity = value
        }

        Row {
            width: parent.width - 2*Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingMedium

            Button {
                text: "Уменьшить"
                width: parent.width / 2 - parent.spacing / 2
                onClicked: {
                    buttonSound.play()
                    if (rectSize > 100) {
                        rectSize -= 20
                    }
                }
            }

            Button {
                text: "Увеличить"
                width: parent.width / 2 - parent.spacing / 2
                onClicked: {
                    buttonSound.play()
                    if (rectSize < 300) {
                        rectSize += 20
                    }
                }
            }
        }

        Row {
            id: rectContainer
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingMedium
            opacity: elementsOpacity

            Column {
                spacing: Theme.paddingSmall

                Rectangle {
                    id: rect1
                    width: rectSize
                    height: width
                    color: colorPool[rect1ColorIndex]
                }

                Button {
                    width: rect1.width
                    text: "Цвет: " + colorPool[rect1ColorIndex]
                    onClicked: {
                        buttonSound.play()
                        rect1ColorIndex = (rect1ColorIndex + 1) % colorPool.length
                    }
                }
            }

            Column {
                spacing: Theme.paddingSmall

                Rectangle {
                    id: rect2
                    width: rectSize
                    height: width
                    color: colorPool[rect2ColorIndex]

                    Text {
                        anchors.centerIn: parent
                        text: rect2Text
                        color: "white"
                        font.pixelSize: Theme.fontSizeLarge
                    }
                }

                Button {
                    width: rect2.width
                    text: "Цвет: " + colorPool[rect2ColorIndex]
                    onClicked: {
                        buttonSound.play()
                        rect2ColorIndex = (rect2ColorIndex + 1) % colorPool.length
                    }
                }
            }

            Column {
                spacing: Theme.paddingSmall

                Rectangle {
                    id: rect3
                    width: rectSize
                    height: width
                    color: colorPool[rect3ColorIndex]
                    property int baseY: y
                    property int liftHeight: -20

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (rect3.y === rect3.baseY) {
                                liftAnimation.start()
                            } else {
                                dropAnimation.start()
                            }
                        }
                    }

                    NumberAnimation {
                        id: liftAnimation
                        target: rect3
                        property: "y"
                        to: rect3.baseY + rect3.liftHeight
                        duration: 200
                        easing.type: Easing.OutQuad
                    }

                    NumberAnimation {
                        id: dropAnimation
                        target: rect3
                        property: "y"
                        to: rect3.baseY
                        duration: 200
                        easing.type: Easing.OutBounce
                    }
                }

                Button {
                    width: rect3.width
                    text: "Цвет: " + colorPool[rect3ColorIndex]
                    onClicked: {
                        buttonSound.play()
                        rect3ColorIndex = (rect3ColorIndex + 1) % colorPool.length
                    }
                }
            }
        }
    }
}
