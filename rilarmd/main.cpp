#include <QtCore/QCoreApplication>
#include <QFile>
#include "Rilarm_daemon.h"

int main(int argc, char *argv[]) {
  QCoreApplication a(argc, argv);
  Rilarm_daemon d;
  return a.exec();
}
