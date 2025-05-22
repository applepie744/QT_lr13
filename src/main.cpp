#include <auroraapp.h>
#include <QtQuick>
#include <QAudioDeviceInfo>
#include <QDebug>


int main(int argc, char *argv[])
{
    qDebug() << "Available audio devices:";
    foreach (const QAudioDeviceInfo &deviceInfo, QAudioDeviceInfo::availableDevices(QAudio::AudioOutput)) {
        qDebug() << "Device:" << deviceInfo.deviceName();
    }

    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.template"));
    application->setApplicationName(QStringLiteral("testing"));

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/testing.qml")));
    view->show();

    return application->exec();
}
