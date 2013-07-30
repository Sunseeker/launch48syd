import bb.cascades 1.0

TabbedPane {
    id: mainPage
    showTabsOnActionBar: false

	activeTab: tasksListTab

    Tab {
        id: tasksListTab
        title: "Who can I help"
        TasksList {
        }
    }
    
    Tab {
        id: heroTab
        title: "Hero"
        Hero {
        }
    }
    
    Tab {
        id: doGoodTab
        title: "Do good"
        DoGood {
        }
    }
    
    onCreationCompleted: {
        Qt._taskOfTheDayPushed = false;
        Qt._mainPage = mainPage;
        Qt._tasksListTab = tasksListTab;
        Qt._heroTab = heroTab;
        Qt._doGoodTab = doGoodTab;
    }
}