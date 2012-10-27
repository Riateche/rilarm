import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0

Page {
  tools: commonTools

  Component {
    id: timeSetupPageComponent
    TimeSetup {
      id: timeSetup
    }
  }


  ListModel {
    id: timesModel

    ListElement {
      hours: 8
      minutes: 0
      timeEnabled: true
    }
    ListElement {
      hours: 9
      minutes: 30
      timeEnabled: false
    }
  }


  Label {
    id: currentTime
    text: "##:##:##"
    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
    }
  }


  ListView {
    anchors {
      top: currentTime.bottom
      left: parent.left
      right: parent.right
      bottom: parent.bottom
    }

    id: timesList
    delegate: ListDelegate {
      Row {
        anchors.fill: parent
        spacing: 20
        Switch {
          anchors.verticalCenter: parent.verticalCenter
          checked: timeEnabled
        }
        Label {
          id: itemLabel
          anchors.verticalCenter: parent.verticalCenter
          text: (hours < 10 ? "0" : "") + hours + ":"
                + (minutes < 10 ? "0" : "") + minutes
        }
      }
      onClicked:  {
        console.log(timesModel.get(index), [timesModel.get(index).hours, timesModel.get(index).minutes])
        timeSetup.time = timesModel.get(index);
        timeSetup.open();
      }
    }
    model: timesModel
  }

}
