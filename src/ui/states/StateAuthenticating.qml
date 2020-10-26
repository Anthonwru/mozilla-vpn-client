/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.5
import Mozilla.VPN 1.0
import "../components"

Item {
    Component.onCompleted: fade.start()

    VPNHeadline {
        id: headline

        //% "Waiting for sign in and subscription confirmation…"
        text: qsTrId("vpn.authenticating.waitForSignIn")
        anchors.top: parent.top
        anchors.topMargin: 32
    }

    Image {
        id: spinner

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: headline.bottom
        anchors.topMargin: 96
        sourceSize.height: 80
        fillMode: Image.PreserveAspectFit
        source: "../resources/spinner.svg"

        ParallelAnimation {
            id: startSpinning

            running: true

            PropertyAnimation {
                target: spinner
                property: "opacity"
                from: 0
                to: 1
                duration: 300
            }

            PropertyAnimation {
                target: spinner
                property: "scale"
                from: 0.7
                to: 1
                duration: 300
            }

            PropertyAnimation {
                target: spinner
                property: "rotation"
                from: 0
                to: 360
                duration: 8000
                loops: Animation.Infinite
            }

        }

    }

    VPNFooterLink {
        id: getHelp

        //% "Cancel and try again"
        labelText: qsTrId("vpn.authenticating.cancelAndRetry")
        onClicked: VPN.cancelAuthentication()
    }

    PropertyAnimation on opacity {
        id: fade

        from: 0
        to: 1
        duration: 1000
    }

}
