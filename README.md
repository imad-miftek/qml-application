# Country List QML Application

A modern Qt Quick application built with Python and QML that displays a list of countries in an interactive table view with a clean, professional interface.

## Features

- Fetches country data from country.io API
- Displays countries in a responsive table view
- Clean and modern UI with:
  - Alternating row colors
  - Separate code and name columns
  - Semi-transparent backgrounds
  - Qt logo watermark
  - Smooth scrolling animation
  - Professional typography

## Prerequisites

- Python 3.12.2
- PySide6
- Qt Quick 2.15
- Internet connection (for API access)

## Project Structure

```
qml-application/
├── main.py        # Main application entry point (version 1)
├── main2.py       # Alternative implementation (version 2)
├── ui/
│   ├── main.qml   # Main QML interface
│   ├── main2.qml  # Alternative QML interface
│   ├── logo.png   # Qt logo for watermark
│   └── qmldir     # QML module definition
└── qml-application.pyproject  # Project configuration
```

## Setup

1. Install the required Python packages:
```bash
pip install PySide6
```

2. Run either version of the application:
```bash
python main.py    # For version 1
python main2.py   # For version 2
```

## Implementation Details

- Uses PySide6 for Python-Qt integration
- Implements a ListView with custom delegates for data display
- Features semi-transparent UI elements for modern look
- Responsive layout that adapts to window size
- Efficient data model binding between Python and QML

## License

This project uses Qt under the BSD-3-Clause license.
Copyright (C) 2021 The Qt Company Ltd.
