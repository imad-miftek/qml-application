// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    width: 640
    height: 480
    required property var countryModel

    header: Label {
        color: "#15af15"
        text: qsTr("Where do people use Qt?")
        font.pointSize: 17
        font.bold: true
        font.family: "Arial"
        renderType: Text.NativeRendering
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }
    Rectangle {
        id: root
        width: parent.width
        height: parent.height

        Image {
            id: image
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: root
            source: "./logo.png"
            opacity: 0.5
        }

        ListView {
            id: view
            anchors.fill: root
            anchors.margins: 25
            model: ListModel {
                Component.onCompleted: {
                    for (var code in countryModel) {
                        append({
                            "code": code,
                            "display": countryModel[code]
                        });
                    }
                }
            }
            delegate: Rectangle {
                implicitWidth: view.width
                implicitHeight: 50
                color: index % 2 ? "#80ecf0f1" : "#80f5f6fa" // Semi-transparent alternating colors
                opacity: 0.8

                Row {
                    anchors.fill: parent
                    spacing: 1

                    // Code column
                    Rectangle {
                        width: 80
                        height: parent.height
                        color: "#802980b9" // Semi-transparent blue

                        Text {
                            anchors.centerIn: parent
                            text: model.code
                            color: "black"
                            font {
                                family: "Arial"
                                pointSize: 12
                                bold: true
                            }
                        }
                    }

                    // Name column
                    Rectangle {
                        width: parent.width - 81
                        height: parent.height
                        color: "transparent"

                        Text {
                            anchors {
                                left: parent.left
                                leftMargin: 15
                                verticalCenter: parent.verticalCenter
                            }
                            text: model.display
                            color: "black"
                            font {
                                family: "Arial"
                                pointSize: 12
                            }
                            elide: Text.ElideRight
                            width: parent.width - 20
                        }
                    }
                }

                // Bottom border
                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#80bdc3c7"
                    anchors.bottom: parent.bottom
                }
            }
        }
    }
    NumberAnimation {
        id: anim
        running: true
        target: view
        property: "contentY"
        duration: 500
    }
}
