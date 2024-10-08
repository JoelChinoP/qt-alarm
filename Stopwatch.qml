import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Window

Item {
    id: stopwatchPanel
    visible: false // Oculto por defecto

    property int elapsedTime: 0 // Tiempo transcurrido en segundos
    property bool isRunning: false // Estado del cronómetro

    RowLayout {

        spacing: 10

        Text {
            id: stopwatchDisplay
            font.pointSize: 24
            text: formatElapsedTime(elapsedTime)
        }

        RoundButton {
            id: playButton
            text: "Play"
            onClicked: {
                isRunning = true;
                stopwatchTimer.start();
            }
        }

        RoundButton {
            id: pauseButton
            text: "Pause"
            onClicked: {
                isRunning = false;
                stopwatchTimer.stop();
            }
        }

        RoundButton {
            id: stopButton
            text: "Stop"
            onClicked: {
                isRunning = false;
                stopwatchTimer.stop();
                elapsedTime = 0; // Reiniciar el tiempo
                stopwatchDisplay.text = formatElapsedTime(elapsedTime); // Actualizar la visualización
            }
        }
    }

    // Timer para el cronómetro
    Timer {
        id: stopwatchTimer
        interval: 1000 // 1 segundo
        running: false
        repeat: true
        onTriggered: {
            elapsedTime++;
            stopwatchDisplay.text = formatElapsedTime(elapsedTime); // Actualizar la visualización
        }
    }

    // Función para formatear el tiempo
    function formatElapsedTime(seconds) {
        var hours = Math.floor(seconds / 3600);
        var minutes = Math.floor((seconds % 3600) / 60);
        var secs = seconds % 60;
        return formatNumber(hours) + ":" + formatNumber(minutes) + ":" + formatNumber(secs);
    }

    // Función para añadir ceros a la izquierda
    function formatNumber(number) {
        return number < 10 ? "0" + number : number.toString();
    }
}
