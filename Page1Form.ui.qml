import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: page
    property alias ico: ico
    property alias topLeftRect: topLeftRect
    property alias mouseArea: mouseArea
    property alias middleRightRect: middleRightRect
    property alias mouseArea1: mouseArea1
    property alias mouseArea2: mouseArea2
    property alias bottomLeftRect: bottomLeftRect
    property alias page: page
    property alias button01: button01
    property alias button02: button02
    property alias label_text: label_text

    Image {
        id: ico
        x: 10
        y: 20
        width: 100
        height: 100
        source: "222.png"
    }

    Rectangle {
        id: topLeftRect
        width: 100
        height: 100
        color: "#00000000"
        visible: true
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        border.color: "#808080"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }

    Rectangle {
        id: middleRightRect
        x: 10
        y: 0
        width: 100
        height: 100
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        visible: true
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
        border.color: "#808080"
    }

    Rectangle {
        id: bottomLeftRect
        y: -3
        width: 100
        height: 100
        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        visible: true
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
        }
        border.color: "#808080"
    }

    Button {
        id: button01
        x: 296
        y: 234
        text: qsTr("Button")
        opacity: 0.8
        checked: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Button {
        id: button02
        x: 270
        y: 294
        height: 38
        text: qsTr("Button")
        focusPolicy: Qt.NoFocus
    }

    Label {
        id: label_text
        x: 249
        y: 72
        width: 201
        height: 81
        color: "#2b2626"
        text: qsTr("Label12345")
        font.pointSize: 30
        renderType: Text.NativeRendering
    }
}
