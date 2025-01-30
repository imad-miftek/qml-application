import QtQuick 2.15

Rectangle {
    id: rect
    color: "#2c3e50" // Dark blue-gray background
    width: 500
    height: 500

    // // Add background image
    // Image {
    //     anchors.centerIn: parent
    //     width: parent.width * 0.8  // 80% of parent width
    //     height: width              // maintain aspect ratio
    //     source: "logo.png"
    //     opacity: 0.1              // make it very transparent
    //     fillMode: Image.PreserveAspectFit
    // }

    Column {
        anchors.fill: parent
        spacing: 1

        // Header
        Rectangle {
            width: parent.width
            height: 50
            color: "#2980b9" // Darker blue for header

            Row {
                anchors.fill: parent
                spacing: 1

                // Code header
                Rectangle {
                    width: 80
                    height: parent.height
                    color: "#2980b9"

                    Text {
                        text: "Code"
                        anchors.centerIn: parent
                        color: "white"
                        font {
                            bold: true
                            pixelSize: 16
                        }
                    }
                }

                // Name header
                Rectangle {
                    width: parent.width - 81
                    height: parent.height
                    color: "#2980b9"

                    Text {
                        text: "Country Name"
                        anchors {
                            left: parent.left
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        color: "white"
                        font {
                            bold: true
                            pixelSize: 16
                        }
                    }
                }
            }
        }

        // Table content
        TableView {
            width: parent.width
            height: parent.height - 51
            columnSpacing: 1
            rowSpacing: 1
            clip: true

            model: ListModel {
                id: countryModel
                Component.onCompleted: {
                    for (var code in countryData) {
                        append({
                            "code": code,
                            "name": countryData[code]
                        });
                    }
                }
            }

            delegate: Rectangle {
                implicitWidth: TableView.view.width
                implicitHeight: 40
                color: model.index % 2 ? "#34495e" : "#2c3e50" // Alternating row colors

                Row {
                    anchors.fill: parent
                    spacing: 1

                    // Code column
                    Rectangle {
                        width: 80
                        height: parent.height
                        color: "#3498db" // Blue

                        Text {
                            text: model.code
                            anchors.centerIn: parent
                            color: "white"
                            font.bold: true
                        }
                    }

                    // Name column
                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: "transparent"

                        Text {
                            text: model.name
                            anchors {
                                left: parent.left
                                leftMargin: 10
                                verticalCenter: parent.verticalCenter
                            }
                            color: "white"
                            elide: Text.ElideRight
                            width: parent.width - 20
                        }
                    }
                }
            }
        }
    }
}
