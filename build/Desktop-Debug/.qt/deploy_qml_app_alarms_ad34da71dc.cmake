include(G:/Proyectos/TO/qt-alarm/build/Desktop-Debug/.qt/QtDeploySupport.cmake)
include("${CMAKE_CURRENT_LIST_DIR}/alarms-plugins.cmake" OPTIONAL)
set(__QT_DEPLOY_I18N_CATALOGS "qtbase;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative")

qt6_deploy_qml_imports(TARGET alarms PLUGINS_FOUND plugins_found)
qt6_deploy_runtime_dependencies(
    EXECUTABLE G:/Proyectos/TO/qt-alarm/build/Desktop-Debug/alarms.exe
    ADDITIONAL_MODULES ${plugins_found}
    GENERATE_QT_CONF
)