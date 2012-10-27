#include "Rilarm_daemon.h"
#include <QFile>
#include <QDebug>

Rilarm_daemon::Rilarm_daemon(QObject *parent) :
  QObject(parent)
{
  test = 0;
  connect(&timer, SIGNAL(timeout()), this, SLOT(check()));
  timer.start(1000);
}

void Rilarm_daemon::check() {
  test++;
  qDebug() << "rilarmd test" << test;
  QFile f("/tmp/rilarmd-test");
  f.open(QFile::WriteOnly);
  f.write(QString("%1\n").arg(test).toAscii());
}
