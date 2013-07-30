import bb.cascades 1.0
import bb.system 1.0

Container {
	property alias title: taskTitle.text
	property bool chosenTask: false
    property int karmaPoints: 0
    
    horizontalAlignment: HorizontalAlignment.Fill
    layout: DockLayout {
    }

	// [1]
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
	    Label {
	        id: taskTitle
	        multiline: true
	        textStyle.fontSize: FontSize.XLarge
	    }
        Button {
            id: doneButton
            visible: chosenTask
            text: "Done it"
            onClicked: {
            	toast.body = "Cool! You've got " + karmaPoints + " points";
            }
        }
    } // [1]
    Divider {
    }

    attachedObjects: [
        SystemToast {
            id: toast
            position: SystemUiPosition.MiddleCenter
            modality: SystemUiModality.Application
            onBodyChanged: {
                show()
            }
        }
    ]
}
