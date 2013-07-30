import bb.cascades 1.0

NavigationPane {
    id: chosenTasksPane

    Page {
        id: doGood
        titleBar: TitleBar {
            title: "Spread the happiness"
        }
        // [root]
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            ListView {
                id: listView
                dataModel: XmlDataModel {
                    source: "models/chosen_tasks.xml"
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "task"
                        ChosenTask {
                            title: ListItemData.title
                            category: ListItemData.category
                            bottomMargin: 40
                            topMargin: bottomMargin
                            onTaskDone: {
                                var page = heroPromoted.createObject();
                                Qt._chosenTasksPane.push(page);
                            }
                            
                            attachedObjects: [
                                ComponentDefinition {
                                    id: heroPromoted
                                    source: "HeroPromoted.qml"
                                }
                            ]
                        }
                    }
                ]
                
                function itemType(data, indexPath) {
                    return (indexPath.length == 1 ? 'task' : 'task');
                }
            } // listview
        } // [root]
    } // page
    
    onCreationCompleted: {
        Qt._chosenTasksPane = chosenTasksPane;
        Qt._doGood = doGood;
    }
}// navigation pane
