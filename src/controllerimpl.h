#ifndef CONTROLLERIMPL_H
#define CONTROLLERIMPL_H

#include "controller.h"

#include <QObject>

class Keys;
class Device;
class Server;
class QDateTime;

class ControllerImpl : public QObject
{
    Q_OBJECT

public:
    ControllerImpl() = default;

    virtual ~ControllerImpl() = default;

    virtual void initialize(const Device *device, const Keys *keys)
    {
        Q_UNUSED(device);
        Q_UNUSED(keys);

        emit initialized(true, Controller::StateOff, QDateTime());
    }

    virtual void activate(const Server &server,
                          const Device *device,
                          const Keys *keys,
                          bool forSwitching)
        = 0;

    virtual void deactivate(bool forSwitching)
        = 0;

    virtual void checkStatus() = 0;

signals:
    void initialized(bool status, Controller::State state, const QDateTime& connectionDate);

    void connected();
    void disconnected();

    void statusUpdated(uint32_t txBytes, uint32_t rxBytes);
};

#endif // CONTROLLERIMPL_H
