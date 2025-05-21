import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: dialog

    property string value1: ""
    property string value2: ""
    property string result: ""

    Column {
        width: parent.width
        spacing: Theme.paddingLarge

        DialogHeader {
            title: "Сумма чисел"
            acceptText: "Подтвердить"
        }

        TextField {
            id: field1
            width: parent.width
            placeholderText: "Введите первое число"
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }

        TextField {
            id: field2
            width: parent.width
            placeholderText: "Введите второе число"
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }
    }

    onAccepted: {
        value1 = field1.text
        value2 = field2.text
        var num1 = parseFloat(value1) || 0
        var num2 = parseFloat(value2) || 0
        result = (num1 + num2).toString()
    }
}
