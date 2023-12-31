import QtQuick 2.4
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0

import org.kde.plasma.extras 2.0 as PlasmaExtras // Representation

Item {
    id: widget
    Plasmoid.icon: plasmoid.configuration.icon
    PlasmaCore.DataSource {
		id: executable
		engine: "executable"
		connectedSources: []
		onNewData: {
			var exitCode = data["exit code"]
			var exitStatus = data["exit status"]
			var stdout = data["stdout"]
			var stderr = data["stderr"]
			exited(sourceName, exitCode, exitStatus, stdout, stderr)
			disconnectSource(sourceName) // cmd finished
            disabled = false
		}
		function exec (command) {
            connectSource(command)
		}
  
		signal exited(string cmd, int exitCode, int exitStatus, string stdout, string stderr)
	}



    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

    property int sliderValue: plasmoid.configuration.init
    property bool disabled: false

    Plasmoid.fullRepresentation: RowLayout {
        PlasmaComponents.Label {
        text: plasmoid.configuration.title
        }


        PlasmaComponents3.Slider {
                id: slider
                Layout.fillWidth: true
                from: plasmoid.configuration.min
                to: plasmoid.configuration.max
                value: sliderValue
                stepSize: plasmoid.configuration.step
                live: false
                onValueChanged: {
                    if(!disabled) {
                        disabled = true
                        sliderValue = value
                        executable.exec(plasmoid.configuration.executable+" " + sliderValue + ";")
                        sliderValue
                    } else {
                        slider.value = sliderValue
                    }
                }
   
            }




    } 

    
}
