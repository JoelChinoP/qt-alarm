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
    resizable: false

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPage
    }

    function formatTime(date) {
        var hours = date.getHours() % 12; // Convierte a 12 horas
        if (hours === 0) hours = 12; // Cambia 0 a 12
        var minutes = date.getMinutes();
        return hours + ":" + (minutes < 10 ? "0" + minutes : minutes);
    }

    Component {
        id: mainPage
        ColumnLayout {
            spacing: 10
            anchors.fill: parent

            RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: clockMain
                    font.pointSize: 48
                    color: "white"
                    text: " "

                    Row {
                        spacing: 2
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text {
                            id: clockp1
                            font.pointSize: 48
                            color: "white"
                            text: formatTime(new Date())
                        }

                        Text {
                            id: clockp2
                            anchors.baseline: clockp1.baseline
                            font.pointSize: 24
                            color: "#CCCCCC"
                            text: Qt.formatDateTime(new Date(), "ss")
                        }

                        Text {
                            id: clockAMPM
                            anchors.baseline: clockp1.baseline
                            font.pointSize: 24
                            color: "#CCCCCC"
                            text: " " + Qt.formatDateTime(new Date(), "AP")
                        }
                    }

                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: {
                            var currentDate = new Date();
                            clockp1.text = formatTime(new Date())
                            clockp2.text = Qt.formatDateTime(currentDate, "ss")
                            clockAMPM.text = " " + Qt.formatDateTime(currentDate, "AP")
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
