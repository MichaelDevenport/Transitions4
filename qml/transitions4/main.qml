// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
    id: page
    width: 360
    height: 360
    color: "#343434"

    Image {
        id: icon
        x: 10
        y: 20
        width: 64
        height: 64
        smooth: true
        source: "Super-DX-Ball-Deluxe-icon.png"
    }

    Rectangle {
        id: topLeftRect
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.color: "#808080"

        MouseArea {
            id: mousearea
            hoverEnabled: true
            anchors.fill:parent
            onClicked: page.state = ' '
            }
    }

    Rectangle {
        id: middleRightRect
        x: -7
        y: -6
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#808080"
        MouseArea {
            id: mousearea1
            hoverEnabled: true
            anchors.fill: parent
            onClicked: page.state = 'State 1'
        }
    }

    Rectangle {
        id: bottomLeftRect
        y: 2
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        border.color: "#808080"
        MouseArea {
            id: mousearea2
            hoverEnabled: true
            anchors.fill: parent
            onClicked: page.state = 'State 2'
        }
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: icon
                x: middleRightRect.x
                y: middleRightRect.y
            }
        },
        State {
            name: "State2"

            PropertyChanges {
                target: icon
                x: bottomLeftRect.x
                y: bottomLeftRect.y

            }

            PropertyChanges {
                target: mousearea
                hoverEnabled: true
            }

            PropertyChanges {
                target: mousearea2
                hoverEnabled: true
            }

            PropertyChanges {
                target: mousearea1
                hoverEnabled: true
            }
        }
    ]

    transitions: [
    Transition {
            from: "*"; to:"State1"
            NumberAnimation {
                properties: "x,y";
                duration: 1000
            }
        },
     Transition {
            from: "*"; to: "State2"
            NumberAnimation {
                properties: "x,y";
                easing.type: Easing.InOutQuad;
                duration: 2000
            }

        },
      Transition {
            NumberAnimation {
                properties: "x,y";
                duration: 200
            }
        }
     ]
}
