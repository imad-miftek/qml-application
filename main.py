# This Python file uses the following encoding: utf-8
import sys
import urllib.request
import json
from PySide6.QtGui import QGuiApplication
from PySide6.QtQuick import QQuickView


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    view = QQuickView()
    view.engine().addImportPath(sys.path[0])

    url = "https://country.io/names.json"
    response = urllib.request.urlopen(url)
    data = json.loads(response.read().decode('utf-8'))

    view.rootContext().setContextProperty("countryData", data)

    view.loadFromModule("ui", "main")
    view.show()

    sys.exit(app.exec())
