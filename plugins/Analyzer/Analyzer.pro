
include(../plugins.pri)

greaterThan(QT_MAJOR_VERSION, 4) {
    QT += concurrent
}

# Input
HEADERS += Analyzer.h AnalyzerWidget.h AnalyzerOptionsPage.h DialogSpecifiedFunctions.h
FORMS += analyzer_options_page.ui dialogspecified.ui
SOURCES += Analyzer.cpp AnalyzerWidget.cpp AnalyzerOptionsPage.cpp DialogSpecifiedFunctions.cpp

