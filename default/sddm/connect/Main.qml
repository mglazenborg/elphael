import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    color: "#000000"

    property string currentUser: userModel.lastUser
    property int sessionIndex: {
        for (var i = 0; i < sessionModel.rowCount(); i++) {
            var name = (sessionModel.data(sessionModel.index(i, 0), Qt.DisplayRole) || "").toString()
            if (name.indexOf("uwsm") !== -1)
                return i
        }
        return sessionModel.lastIndex
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.text = "Login failed"
            password.text = ""
            password.focus = true
        }
        function onLoginSucceeded() {
            errorMessage.text = ""
        }
    }


    AnimatedImage {
        id: anim
        source: "connect.gif"
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
    }

    Item {
        id: passwordArea
        width: parent.width
        height: root.height * 0.15
        anchors.bottom: parent.bottom

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: root.height * 0.01
            spacing: root.height * 0.01

            Text {
                text: "Enter Password"
                color: "#ffffff"
                font.family: "Sans"
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: bulletDisplay
                text: password.text.length > 0
                      ? "*".repeat(password.text.length)
                      : " "
                color: "#ffffff"
                font.family: "Sans"
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    TextInput {
        id: password
        opacity: 0
        width: 1
        height: 1
        focus: true
        anchors.bottom: parent.bottom

        Keys.onPressed: function(event) {
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                sddm.login(root.currentUser, password.text, root.sessionIndex)
                event.accepted = true
            }
        }
    }
}
