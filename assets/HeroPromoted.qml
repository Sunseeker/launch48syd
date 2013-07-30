import bb.cascades 1.0

Page {
	id: heroScreen
	
	property int karmaPoints: 102
	
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
                ImageView {
                    horizontalAlignment: HorizontalAlignment.Right
                    imageSource: "asset:///images/karmabar_promoted.jpg"
                }
            } // [1]

            TextArea {
                horizontalAlignment: HorizontalAlignment.Center
                editable: false
                text: "BOOM!!!\nYou're on level 6!!! Unlock LASER EYES"
                textStyle.fontSize: FontSize.Large
                textStyle.textAlign: TextAlign.Center
            }

			Button {
			    horizontalAlignment: HorizontalAlignment.Center
			    text: "UNLOCK!"
			    onClicked: {
			        var page = prizeSelection.createObject();
                    Qt._chosenTasksPane.push(page);			        
                }
			}
        } // [root]
    } // scrollview
    
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
    
    attachedObjects: [
        ComponentDefinition {
            id: prizeSelection
            source: "PrizePageSelection.qml"
        }
    ]
}
