#include <QtQuick>
#include <QQmlComponent>
#include <sailfishapp.h>
#include <facebook_mobile_version.h>

int main(int argc, char *argv[])
{
    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();
    app->setApplicationVersion(QStringLiteral(FACEBOOK_MOBILE_VERSION));

    // Show the application
    view->setSource(SailfishApp::pathTo("qml/harbour-facebook-mobile.qml"));
    view->show();

    return app->exec();
}

