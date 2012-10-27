#ifndef RILARM_DAEMON_H
#define RILARM_DAEMON_H

#include <QObject>
#include <QTimer>

class Rilarm_daemon : public QObject {
  Q_OBJECT
public:
  explicit Rilarm_daemon(QObject *parent = 0);
  
signals:
  
private slots:
  void check();

private:
  QTimer timer;
  int test;
  
};

#endif // RILARM_DAEMON_H
