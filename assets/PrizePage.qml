import bb.cascades 1.0
import bb.platform 1.0
import bb.system 1.0

Page {
    id: heroScreen

    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Do Good"
            onTriggered: {
                var pages = Qt._chosenTasksPane.navigateTo(Qt._doGood);
                for (var i = 0; i < pages.length; i ++) {
                    delete pages[i];
                }
            }
        }
    }

    titleBar: TitleBar {
        title: "Spread the happiness"
        selectedIndex: -1
    }

    ScrollView {
        // [root]
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            layout: DockLayout {
            }            
            // [2]
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                    text: "Great work!"
                    textStyle.fontSize: FontSize.XXLarge
                    bottomMargin: 50
                    textStyle.textAlign: TextAlign.Center
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                    text: "Thanks to your good deeds"
                    textStyle.fontSize: FontSize.XLarge
                    bottomMargin: 50
                    textStyle.textAlign: TextAlign.Center
                }
                ImageView {
                    horizontalAlignment: HorizontalAlignment.Center
                    imageSource: "asset:///images/blackberry-logo.png"
                    bottomMargin: 50
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                    text: "Have donated two mobile phones to local charities!"
                    textStyle.fontSize: FontSize.XLarge
                    textStyle.textAlign: TextAlign.Center
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                    text: "POW!!!"
                    textStyle.fontSize: FontSize.XXLarge
                    bottomMargin: 50
                    textStyle.textAlign: TextAlign.Center
                }

                //                Label {
//                    horizontalAlignment: HorizontalAlignment.Center
//                    text: "TO CHARITY"
//                    textStyle.base: massive.style
//                    attachedObjects: [
//                        TextStyleDefinition {
//                            id: massive
//                            base: SystemDefaults.TextStyles.BodyText
//                            fontWeight: FontWeight.W300
//                            fontSize: FontSize.PercentageValue
//                            fontSizeValue: 250
//                            textAlign: TextAlign.Center
//                        }
//                    ]
//                }
            } // [2]
        } // [root]
        attachedObjects: [
            NotificationDialog {
                id: popup
                title: "COOL!"
                body: "Thanks a lot! You've just made the world better!"
                buttons: [
                    SystemUiButton {
                        label: "Okay"
                    }
                ]
            }
        ]
    } // scrollview
}
