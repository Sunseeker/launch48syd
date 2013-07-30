import bb.cascades 1.0
import bb.system 1.0

Page {
    titleBar: TitleBar {
        title: "Spread the happiness"
    }

    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Back"
            onTriggered: {
                Qt._taskOfTheDayPushed = false;
                var pg = tasksPane.pop();
                if (pg) pg.destroy();
            }
        }
    }
    
    // [root]
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
        layout: DockLayout {
        }
        
        // [1]
        Container {
            property bool chosenTask: false
            property int karmaPoints

            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment:  VerticalAlignment.Top 
            ImageView {
                imageSource: "asset:///images/sydcity.jpg"
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Clean up Sydney"
                textStyle.fontSize: FontSize.XLarge
                bottomMargin: 100
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Bonus Task"
                textStyle.fontSize: FontSize.Large
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "127,329"
                textStyle.fontSize: FontSize.XXLarge
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "pieces of litter collected"
                bottomMargin: 150
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "12:01:42 to go!"
                textStyle.fontSize: FontSize.XLarge
            }
        } // [1]

        // [2]
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Button {
                text: "Upload"
            }
            Button {
                text: "Done!"
            }
        } // [2]

    } // // [root]
}
