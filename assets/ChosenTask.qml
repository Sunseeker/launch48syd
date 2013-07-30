import bb.cascades 1.0
import bb.system 1.0

Container {
    property alias title: taskTitle.text
    property alias category: taskCategory.text
    property int karmaPoints: 0
    
    signal taskDone();
    
    Container {
        leftPadding: 15
        rightPadding: leftPadding
        verticalAlignment: VerticalAlignment.Center
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        // [0]
        Container {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 2
            }
            Label {
                id: taskTitle
                multiline: true
                textStyle.fontSize: FontSize.Large
            }
            Label {
                id: taskCategory
                textStyle.fontSize: FontSize.Small
            }
        } // [0]
        Button {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
            id: doneButton
            text: "Done it"
            onClicked: {
                taskDone();
            }
        }
    }
    Divider {
    }
}
