#ifndef SERIAL_BASE_H
#define SERIAL_BASE_H

#include <QObject>
#include <QQuickItem>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QIODevice>
#include <QThread>
#include <QQuickView>

class serial_base : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString receiveData READ getReceiveData NOTIFY receiveDataChanged)
public:
    explicit serial_base(QObject *parent = nullptr);
    Q_INVOKABLE void serial_open();
    Q_INVOKABLE void serial_close();
    QString getReceiveData(void);

private:
    QString m_receivedata;

signals:
    void receiveDataChanged();

public slots:
    void receiveSlot();
    void slotFromQml(QString);

};

#endif // SERIAL_BASE_H
