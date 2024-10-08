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

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage
    }

    Component {
        id: mainPage
        ColumnLayout {
            spacing: 10
            anchors.fill: parent

            RowLayout {
                spacing: 10
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
                            clock.text = Qt.formatDateTime(new Date(), "hh:mm:ss AP")
                        }
                    }
                }
            }

            RoundButton {
                id: stopwatchButton
                text: "Cronómetro"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    stackView.push(stopwatchPage)
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
    }

    Component {
        id: stopwatchPage
        ColumnLayout {
            spacing: 10
            anchors.fill: parent

            Stopwatch {
                id: stopwatchPanel

            }

            RoundButton {
                id: backButton
                text: "Volver"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    stackView.pop()
                }
            }
        }
    }

    AlarmDialog {
        id: alarmDialog
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        alarmModel: alarmListView.model
    }
}
