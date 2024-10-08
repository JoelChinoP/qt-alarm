include(C:/Qt/Examples/Qt-6.8.0/tutorials/alarms/build/Desktop_Qt_6_8_0_MinGW_64_bit-Debug/.qt/QtDeploySupport.cmake)
include("${CMAKE_CURRENT_LIST_DIR}/alarms-plugins.cmake" OPTIONAL)
set(__QT_DEPLOY_I18N_CATALOGS "qtbase;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative;qtdeclarative")

qt6_deploy_qml_imports(TARGET alarms PLUGINS_FOUND plugins_found)
qt6_deploy_runtime_dependencies(
    EXECUTABLE C:/Qt/Examples/Qt-6.8.0/tutorials/alarms/build/Desktop_Qt_6_8_0_MinGW_64_bit-Debug/alarms.exe
    ADDITIONAL_MODULES ${plugins_found}
    GENERATE_QT_CONF
)