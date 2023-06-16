import QtQuick 2.0
import QtQuick.Controls 2.5
import org.kde.kirigami 2.4 as Kirigami

Item {
    id: page
    width: childrenRect.width
    height: childrenRect.height

    property alias cfg_icon: configIcon.value
    property alias cfg_executable: executable.text
    property alias cfg_title: title.text
    property alias cfg_min: min.value
    property alias cfg_max: max.value
    property alias cfg_step: step.value
    property alias cfg_init: init.value

    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        ConfigIcon {
            id: configIcon
            Kirigami.FormData.label: "Icon:"
        }

        TextField {
            id: executable
            Kirigami.FormData.label: "Executable:"
        }

        TextField {
            id: title
            Kirigami.FormData.label: "Title:"
        }

        SpinBox {
            id: min
            Kirigami.FormData.label: "Min. value:"
            from:-100000
            to:100000
        }

        SpinBox {
            id: max
            Kirigami.FormData.label: "Max. value:"
            from:-100000
            to:100000
        }

        SpinBox {
            id: step
            Kirigami.FormData.label: "Step:"
            from:-100000
            to:100000
        }

        SpinBox {
            id: init
            Kirigami.FormData.label: "Inital value:"
            from:-100000
            to:100000
        }

    }
}
