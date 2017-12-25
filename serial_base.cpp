#include "serial_base.h"
#define FRAMELENGHT 20

QSerialPort serial_port;

//
//构造函数，连接信号槽
//
serial_base::serial_base(QObject* parent)
    : QObject(parent)
{
    connect(&serial_port, SIGNAL(readyRead()), this, SLOT(receiveSlot()));

    //    QQuickView view(QUrl("qrc:/main.qml"));
    //    QObject *item = view.rootObject();
    //    QObject::connect(item, SIGNAL(qmlSignal(string msg)), this, SLOT(slotFromQml(stirng msg)));
}

//
//打开串口
//
void serial_base::serial_open()
{
    serial_port.setPortName("tty.usbserial");
    if (serial_port.open(QIODevice::ReadWrite)) //打开端口
    {
        qDebug() << "serial is opened " << endl;
        serial_port.setBaudRate(QSerialPort::Baud2400);
        serial_port.setDataBits(QSerialPort::Data8);
        serial_port.setParity(QSerialPort::NoParity);
        serial_port.setStopBits(QSerialPort::OneStop);
        serial_port.setFlowControl(QSerialPort::NoFlowControl);
        serial_port.clearError();
        serial_port.clear();
    }
}

void serial_base::serial_close()
{
    serial_port.close();
    qDebug() << "serial is closed " << endl;
}

//
//获取 member receivedata 变量
QString serial_base::getReceiveData() { return m_receivedata; }

void serial_base::receiveSlot()
{
    QByteArray readAllData = serial_port.readAll(); //读取收到的数据one Byte
    static QString receivedata; //生成 static QString变量
    receivedata.append(readAllData.data()); //将QByteArray转为QString，并保存

    if (QString(readAllData.data()) == "\n") {
        m_receivedata = receivedata;
        qDebug() << "Serial is received" << receivedata << endl;
        qDebug() << QThread::currentThreadId() << endl;
        receivedata.clear();
        emit receiveDataChanged();
    }
}

void serial_base::slotFromQml(QString msg)
{
    qDebug() << "in qml signal call:" << msg << endl;
}
