import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: window
    width: 400
    height: 500
    visible: true

    ColumnLayout {
        anchors.fill: parent


        RowLayout {
            spacing: 10
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: clock
                font.pointSize: 24
                color: "white"
                text: Qt.formatDateTime(new Date(), "hh:mm:ss AP")

                Timer {
                    interval: 1000
                    running: true
                    repeat: true
                    onTriggered: {
                        clock.text = Qt.formatDateTime(new Date(), "hh:mm:ss AP");
                    }
                }
            }


        }


        ListView {
            id: alarmListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: AlarmModel {}
            delegate: AlarmDelegate {}
        }

        RoundButton {
            id: addAlarmButton
            text: "+"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: alarmDialog.open()
        }
    }

    AlarmDialog {
        id: alarmDialog
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        alarmModel: alarmListView.model
    }
}
