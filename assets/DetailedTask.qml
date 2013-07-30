import bb.cascades 1.0
import bb.system 1.0

Page {
    property alias title: taskTitle.text 
    property alias chosenTask: heroAction.enabled
    property int karmaPoints: 17
    property int karmaLvl: 0
    property int minHero: 1

    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Not yet"
            onTriggered: {
                goback();
            }
        }
    }
    
    titleBar: TitleBar {
        title: "Spread the happiness"
    }

    ScrollView {
        // [root]
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            Label {
                id: taskTitle
                textStyle.fontSize: FontSize.XXLarge
                horizontalAlignment: HorizontalAlignment.Center
            }
            Label {
                id: taskDescription
                multiline: true
                textStyle.textAlign: TextAlign.Justify
            }
            Label {
                text: "Karma Points: " + karmaPoints
                textStyle.fontSize: FontSize.Large
            }
            Label {
                text: "Karma Level: " + karmaLvl
                textStyle.fontSize: FontSize.Large
            }
            Label {
                text: "Minimum Hero: " + minHero
                textStyle.fontSize: FontSize.Large
            }
        } // [root]
    } // scrollview
    
    actions: [
        ActionItem {
	        id: heroAction
            enabled: true
            title: "I wanna be a hero!"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                toast.body = "You're awesome! Get it done now!";
                goback();
            }
        },
        ActionItem {
            enabled: true
            imageSource: "asset:///images/ic_share.png"
            title: "Share that!"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
                shareInvocation.trigger(shareInvocation.query.invokeActionId);
            }
        }
    ]
    
    attachedObjects: [
        Invocation {
            id: shareInvocation
            query.mimeType: "text/plain"
            query.invokeActionId: "bb.action.SHARE"
            query.data: "Check out this cool task - URL goes here. Awesome app via @happyapp"
        },
        SystemToast {
            id: toast
            position: SystemUiPosition.MiddleCenter
            modality: SystemUiModality.Application
            onBodyChanged: {
                show()
            }
        }
    ]
    
    function goback() {
        var pg = tasksPane.pop();
    }
} // page
