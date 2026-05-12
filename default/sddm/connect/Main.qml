import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: root
    width: parent ? parent.width : 1920
    height: parent ? parent.height : 1080
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
            anchors.bottomMargin: root.height * 0.02
            spacing: root.height * 0.02
            
            Text {
                text: "Enter Password"
                color: "#ffffff"
                font.family: "Sans"
                font.pixelSize: 16
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Item {
                width: root.width * 0.10
                height: 20
                anchors.horizontalCenter: parent.horizontalCenter

                TextInput {
                    id: password
                    anchors.horizontalCenter: parent.horizontalCenter
                    echoMode: TextInput.Password
                    font.family: "Sans"
                    font.pixelSize: 16
                    font.letterSpacing: root.height * 0.0005
                    passwordCharacter: "*"
                    color: "#ffffff"
                    focus: true

                    Keys.onPressed: function(event) {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(root.currentUser, password.text, root.sessionIndex)
                            event.accepted = true
                        }
                    }
                }
            }
        }

        Text {
            id: errorMessage
            text: ""
            color: "#f7768e"
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Component.onCompleted: password.forceActiveFocus()
}
