import bb.cascades 1.0

Page {
    id: heroScreen

    property int karmaPoints: 87

    titleBar: TitleBar {
        title: "Spread the happiness"
        selectedIndex: -1
    }

	ScrollView {
        // [root]
        Container {
            leftPadding: 30
            rightPadding: leftPadding
            topPadding: 30
            horizontalAlignment: HorizontalAlignment.Fill
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "KARMA    " + karmaPoints
                textStyle.fontSize: FontSize.XXLarge
                topPadding: 100
                bottomMargin: 10
            }

            // [1]
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                layout: DockLayout {
                }
                ImageView {
                    horizontalAlignment: HorizontalAlignment.Left
                    imageSource: "asset:///images/superman.jpg"
                }
                Label {
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Center
                    multiline: true
                    text: "5\nBadges"
                    textStyle.base: textMassive.style
                }
                attachedObjects: [
                    TextStyleDefinition {
                        id: textMassive
                        base: SystemDefaults.TextStyles.BodyText
                        fontWeight: FontWeight.W300
                        fontSize: FontSize.PercentageValue
                        fontSizeValue: 400
                        textAlign: TextAlign.Center
                    }
                ]
            } // [1]

            Container {
                topMargin: 50
                horizontalAlignment: HorizontalAlignment.Center
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
	            Button {
	                text: "Nominate a sidekick"
	            }
	            Button {
	                text: "Reward a HERO"
	            }
            }
        } // [root]
    }

    actions: [
        ActionItem {
            title: "Get in the news!"
        },
        ActionItem {
            title: "Do more good!"
            onTriggered: {
                Qt._mainPage.activeTab = _doMoreGood;
            }
        }
    ]
}
