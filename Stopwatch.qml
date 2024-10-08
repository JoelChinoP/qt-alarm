import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window

Item {
    id: stopwatchPanel
    visible: true // Mostrar por defecto para pruebas
    property int elapsedTime: 0 // Tiempo transcurrido en segundos
    property bool isRunning: false // Estado del cronómetro

    ColumnLayout {
        spacing: 10
        width: 400
        height: 200
        Text {
            id: stopwatchDisplay
            font.pointSize: 50
            color: "white"
            text: formatElapsedTime(elapsedTime)
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {

            Layout.alignment: Qt.AlignHCenter

            RoundButton {
                id: playButton
                text: "Play"
                onClicked: {
                    isRunning = true
                    stopwatchTimer.start()
                }
            }

            RoundButton {
                id: pauseButton
                text: "Pause"
                onClicked: {
                    isRunning = false
                    stopwatchTimer.stop()
                }
            }

            RoundButton {
                id: stopButton
                text: "Stop"
                onClicked: {
                    isRunning = false
                    stopwatchTimer.stop()
                    elapsedTime = 0 // Reiniciar el tiempo
                    stopwatchDisplay.text = formatElapsedTime(elapsedTime) // Actualizar la visualización
                }
            }
        }
    }

    // Timer para el cronómetro
    Timer {
        id: stopwatchTimer
        interval: 10 // Actualizar cada 10 milisegundos
        running: false
        repeat: true
        onTriggered: {
            elapsedTime += 10
            stopwatchDisplay.text = formatElapsedTime(elapsedTime) // Actualizar la visualización
        }
    }

    // Función para formatear el tiempo
    function formatElapsedTime(milliseconds) {
        var totalSeconds = Math.floor(milliseconds / 1000)
        var minutes = Math.floor(totalSeconds / 60)
        var seconds = totalSeconds % 60
        var millis = Math.floor((milliseconds % 1000) / 10)
        return formatNumber(minutes) + ":" + formatNumber(seconds) + ":" + formatNumber(millis)
    }

    // Función para añadir ceros a la izquierda
    function formatNumber(number, isMillis = false) {
        if (isMillis) {
            if (number < 100) {
                return number < 10 ? "00" + number : "0" + number
            }
            return number.toString().slice(0, 2)
        }
        return number < 10 ? "0" + number : number.toString()
    }
}
