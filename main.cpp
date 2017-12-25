#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <serial_base.h>
#include <QtQml>
#include <QThread>
#include <QQuickView>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

//    qmlRegisterType<ShowTest>("com.showtest", 1, 0, "ShowTest");
//    qmlRegisterType<Serial_Com>("com.serial_com", 1, 0, "Serial_Com");
//    viewer.showExpanded();


    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    serial_base sb1;
    engine.rootContext()->setContextProperty("serial_base", &sb1);       //添加QML上下文

    QObject::connect(&engine.rootContext("page"), SIGNAL(qmlSignal(string msg)), sb1, SLOT(slotFromQml(QString msg)));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
