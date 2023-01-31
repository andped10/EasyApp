// SPDX-FileCopyrightText: 2022 EasyTexture contributors
// SPDX-License-Identifier: BSD-3-Clause
// © 2022 Contributors to the EasyTexture project <https://github.com/EasyScience/EasyTextureApp>

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtWebEngine 1.10

WebEngineView {
    id: chartView

    property bool loadSucceededStatus: false

    property string xAxisTitle: ''
    property string yAxisTitle: ''

    property var xArray: ([])
    property var yArray: ([])

    width: parent.width
    height: parent.height

    url: 'ChartTemplateBasic1dPlotly.html'

    onLoadSucceededStatusChanged: {
        if (loadSucceededStatus) {
            setXAxisTitle(xAxisTitle)
            setYAxisTitle(yAxisTitle)
            setXArray(xArray)
            setYArray(yArray)
            redrawPlot()
        }
    }

    onXAxisTitleChanged: {
        if (loadSucceededStatus) {
            setXAxisTitle(newTitle)
            redrawPlot()
        }
    }

    onYAxisTitleChanged: {
        if (loadSucceededStatus) {
            setYAxisTitle(newTitle)
            redrawPlot()
        }
    }

    onXArrayChanged: {
        if (loadSucceededStatus) {
            setXArray(xArray)
            redrawPlot()
        }
    }

    onYArrayChanged: {
        if (loadSucceededStatus) {
            setYArray(yArray)
            redrawPlot()
        }
    }

    onLoadingChanged: {
        if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
            loadSucceededStatus = true
        }
    }

    function setXAxisTitle(newTitle) {
        runJavaScript(`setXAxisTitle(${JSON.stringify(newTitle)})`)
    }

    function setYAxisTitle(newTitle) {
        runJavaScript(`setYAxisTitle(${JSON.stringify(newTitle)})`)
    }

    function setXArray(newArray) {
        runJavaScript(`setXArray(${JSON.stringify(newArray)})`)
    }

    function setYArray(newArray) {
        runJavaScript(`setYArray(${JSON.stringify(newArray)})`)
    }

    function redrawPlot() {
        runJavaScript(`redrawPlot()`)
    }

}