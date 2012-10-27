import QtQuick 1.1
import com.nokia.meego 1.0

Sheet {
  id: sheet
  property QtObject time

  onTimeChanged: {
    if (time === null) return;
    timePicker.hours = time.hours;
    timePicker.minutes = time.minutes;
  }

  acceptButtonText: "Save"
  rejectButtonText: "Cancel"

  content: Item {
    anchors.fill: parent
    Label {
      text: "Alarm time:"
    }

    TimePicker {
      id: timePicker
      anchors.centerIn: sheet

      function orientationSuffix() {
        if (screen.currentOrientation === Screen.Portrait || screen.currentOrientation === Screen.PortraitInverted )
          return "portrait"
        else
          return "landscape"
      }

      backgroundImage: "image://theme/meegotouch-timepicker-light-1-" + orientationSuffix()
      hourDotImage: "image://theme/meegotouch-timepicker-disc-hours-" + orientationSuffix()
      minutesDotImage: "image://theme/meegotouch-timepicker-disc-minutes-" + orientationSuffix()
    }
  }

  onRejected: time = null
  onAccepted: {
    time.hours = timePicker.hours
    time.minutes = timePicker.minutes
    time.timeEnabled = true
    time = null
  }

}
