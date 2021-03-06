cmake_minimum_required (VERSION 2.8)
include("GNUInstallDirs")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
include("${PROJECT_SOURCE_DIR}/cmake/EnableCXX11.cmake")
set(PluginName "BinaryInfo")

set(UI_FILES
		OptionsPage.ui
		DialogHeader.ui)

if(Qt5Core_FOUND)
    find_package(Qt5 5.0.0 REQUIRED Widgets)
	qt5_wrap_ui(UI_H ${UI_FILES})
else(Qt5Core_FOUND)
	find_package(Qt4 4.6.0 QUIET REQUIRED QtCore QtGui)
	include(${QT_USE_FILE})
	qt4_wrap_ui(UI_H ${UI_FILES})
endif()

# we put the header files from the include directory here 
# too so automoc can "just work"
add_library(${PluginName} SHARED
	BinaryInfo.cpp
	BinaryInfo.h
	demangle.h
	DialogHeader.cpp
	DialogHeader.h
	ELFXX.cpp
	ELF32.cpp
	ELF64.cpp
	elf_binary.h
	OptionsPage.cpp
	OptionsPage.h
	PE32.cpp
	PE32.h
	pe_binary.h
	symbols.cpp
	symbols.h
	${UI_H}
)

if(Qt5Core_FOUND)
	target_link_libraries(${PluginName} Qt5::Widgets)
else(Qt5Core_FOUND)
	target_link_libraries(${PluginName} Qt4::QtGui)
endif()

set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR})
install (TARGETS ${PluginName} DESTINATION ${CMAKE_INSTALL_LIBDIR}/edb)
