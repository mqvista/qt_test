import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Transitions")



    Page1Form{
        anchors.fill: parent
        id:page

        signal qmlSignal(string msg)

        mouseArea{
            onClicked: stateGroup.state = ''
        }
        mouseArea1{
            onClicked:stateGroup.state = 'state1'
        }
        mouseArea2{
            onClicked:stateGroup.state = 'state2'
        }

        button01{
            onClicked: {
                serial_base.serial_open();

            }
        }
        button02{
            onClicked: {
                serial_base.serial_close();
                page.qmlSignal("hello")
                //Qt.quit();
            }
        }
        label_text{
            text:serial_base.receiveData
        }
    }

    StateGroup{
        id: stateGroup
        states: [
            State {
                name: "state1"
                PropertyChanges {
                    target: page.ico
                    x: page.middleRightRect.x
                    y: page.middleRightRect.y
                }
            },
            State {
                name: "state2"
                PropertyChanges {
                    target: page.ico
                    x: page.bottomLeftRect.x
                    y: page.bottomLeftRect.y
                }
            }
        ]

        transitions: [
            Transition {
                from: "*"
                to: "state1"
                NumberAnimation{
                    easing.type: Easing.InBack
                    properties: "x,y";
                    duration: 200
                }
            },
            Transition {
                from: "*"
                to: "state2"
                NumberAnimation{
                    easing.type: Easing.InOutBack
                    properties: "x,y";
                    duration: 200
                }
            },
            Transition {
                NumberAnimation{
                    properties: "x,y";
                    duration: 500
                }
            }

        ]
    }
}
