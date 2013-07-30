import bb.cascades 1.0

Page {
    id: heroScreen

    titleBar: TitleBar {
        title: "Spread the happiness"
        selectedIndex: -1
    }

    ScrollView {
        // [root]
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
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
                    text: "Level\n6"
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

            ImageView {
                horizontalAlignment: HorizontalAlignment.Left
                imageSource: "asset:///images/LaserEyes.jpg"
            }

			// [2]
			Container {
                horizontalAlignment: HorizontalAlignment.Center
			    layout: StackLayout {
           			orientation: LayoutOrientation.LeftToRight
           		}	
	            Button {
	                text: "GET IT!"
	                onClicked: {
	                	var page = prize.createObject();
                        Qt._chosenTasksPane.push(page);
                    }
	            }
	            Button {
	                text: "DO MORE GOOD !!"
	            }
       		} // [2]
        } // [root]
        
        attachedObjects: [
            ComponentDefinition {
                id: prize
                source: "PrizePage.qml"
            }
        ]
    } // scrollview
}
