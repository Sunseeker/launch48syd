import bb.cascades 1.0

NavigationPane {
    id: tasksPane

    Page {
        id: tasksList
        titleBar: TitleBar {
            title: "Spread the happiness"
        }
        // [root]
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            Container {
                horizontalAlignment: HorizontalAlignment.Fill
                background: Color.Red
	            Label {
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "TASK OF THE DAY"
                    textStyle.fontSize: FontSize.XXLarge
                    onTouch: {
                        if (Qt._taskOfTheDayPushed === false) {
                            Qt._taskOfTheDayPushed = true;
	                    	var page = taskOfTheDay.createObject();
	                    	tasksPane.push(page);
                        }
                    }
                }
            }
            
            ListView {
                dataModel: XmlDataModel {
                    source: "models/tasks.xml"
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "category"
                        Category {
                            title: ListItemData.category
                        }
                    },
                    ListItemComponent {
                        type: "task"
                        Task {
                            title: ListItemData.title
                            bottomMargin: 40
                            topMargin: bottomMargin
                        }
                    }
                ]

                onTriggered: {
                    var selectedItem = dataModel.data(indexPath);
                    var page = detailedTask.createObject();
                    page.title = selectedItem.title;
                    tasksPane.push(page);
                }

                attachedObjects: [
                    ComponentDefinition {
                        id: detailedTask
                        source: "DetailedTask.qml"
                    }
                ]

                function itemType(data, indexPath) {
                    return (indexPath.length == 1 ? 'category' : 'task');
                }
            } // listview
        } // [root]
        
        onCreationCompleted: {
            Qt._tasksList = tasksList;
        }

        attachedObjects: [
            ComponentDefinition {
                id: taskOfTheDay
                source: "TaskOfTheDay.qml"
            }
        ]
    } // page
} // navigation pane
