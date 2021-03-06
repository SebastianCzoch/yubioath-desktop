import QtQuick 2.5
import QtQuick.Controls 1.4

Label {

    property var device
    property int nCredentials
    property var settings
    property bool ccidMode: !settings.slotMode

    visible: device.hasDevice
    text: getText()

    horizontalAlignment: Text.AlignHCenter
    wrapMode: Text.WordWrap
    width: parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    function getText() {
        if (settings.slotMode && !device.hasOTP) {
            return qsTr("Authenticator mode is set to YubiKey slots, but the OTP connection mode is not enabled.")
        } else if (ccidMode && !device.hasCCID) {
            return qsTr("Authenticator mode is set to CCID, but the CCID connection mode is not enabled.")
        } else if (credentials === null) {
            return qsTr("Reading credentials...")
        } else if (nCredentials === 0 && credentials !== null) {
            return qsTr("No credentials found.")
        } else {
            return ""
        }
    }
}
