// Default empty project template
#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/system/SystemToast>
#include <bb/platform/NotificationDialog>
#include <bb/system/SystemUiButton>

using namespace bb::cascades;

ApplicationUI::ApplicationUI(bb::cascades::Application *app)
: QObject(app)
{
	qmlRegisterType<bb::system::SystemToast>("bb.system", 1, 0, "SystemToast");
    qmlRegisterType<bb::platform::NotificationDialog>("bb.platform", 1, 0, "NotificationDialog");
    qmlRegisterType<bb::system::SystemUiButton>("bb.system", 1, 0, "SystemUiButton");
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
    QmlDocument *qml = QmlDocument::create("asset:///StartPage.qml").parent(this);
//    QmlDocument *qml = QmlDocument::create("asset:///PrizePage.qml").parent(this);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // set created root object as a scene
    app->setScene(root);
}

