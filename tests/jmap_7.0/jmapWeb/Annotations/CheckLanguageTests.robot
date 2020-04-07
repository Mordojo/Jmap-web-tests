*** Settings ***

Documentation     Check language Test in JMap Web
#---------------------------------------------------------------------------------------------------------------------------------------------------
Library    Collections
Library    String
Library    OperatingSystem
Library    SeleniumLibrary    run_on_failure=No Operation
Library    BuiltIn
Library    DateTime
#--------------------------------------------------------------------------------------------------------------------------------------------------- 
Resource    ../../../../common/admin/CommonKeywords.robot
Resource    ../../../../common/CommonLogin.robot
Resource    ../../../../common/jmapWeb/CommonAnnotationWeb.robot
Resource    ../../../../common/jmapWeb/CommonWeb.robot
#---------------------------------------------------------------------------------------------------------------------------------------------------
Test Setup   Open Browser On JMap Web    ${URLWebApp}    ${RESOLUTION_X}    ${RESOLUTION_Y}
Test Teardown    Close JMap Web
Metadata    author    Mordjane Boussad
#---------------------------------------------------------------------------------------------------------------------------------------------------
*** Variable ***
${RESOLUTION_X}    1920
${RESOLUTION_Y}    1080   
#---------------------------------------------------------------------------------------------------------------------------------------------------
*** Test Cases ***

JM70-930:Verify text With english language
    Login JMap Web With Check Language    ${Title}    en    LOGIN    userTest1    userTest1
    Click On Options Icon
    Verify That Texts Of Options Icon Are    Options    Preferences    Help    Change Password    Logout (${UserName})
    Click On Share features Icon
    Verify That Texts Of Share Features Icon Are    Share features    Link to this map    Embed Map    Create Image
    Verify That Text Of Full Screen Icon Is    Full screen
    Verify That Text Of Overview Map Icon Is    Overview map
    Verify That Text Of Print Map Icon Is    Print map
    Click On Annotation Down List Arrow
    Verify That Texts Of Annotations Icon Are    Freehand    Text    Point    Line    Rectangle    Polygon    Circle
    Verify That Text Of Google Directions Icon Is    Google Directions
    Verify That Text Of Google Street View Icon Is    Google Street View
    Verify That Text Of Information Report Icon Is    Information report
    Click On Measurement Down List Arrow
    Verify That Texts Of Measures Icon Are    Distance measurement    Surface measurement    Circular surface measurement
    Click On Selection Down List Arrow
    Verify That Texts Of Selections Icon Are    Punctual selection    Linear selection    Rectangular selection    Polygonal selection    Circular selection
    Verify That Text Of Show Sidebar Icon Is    Show sidebar
    Click On Show Sidebar Icon
    Verify That The Sidebar Icon Contains The Texts    Layers    Search    My maps
    Click On Logout
    
JM70-931:Verify text With french language 
    Login JMap Web With Check Language    ${Title}    fr    SE CONNECTER    userTest1    userTest1
    Click On Options Icon
    Verify That Texts Of Options Icon Are    Options    Préférences    Aide    Changer le mot de passe    Déconnexion (${UserName})
    Click On Share features Icon
    Verify That Texts Of Share Features Icon Are    Partager    Lien vers cette carte    Carte Intégrée    Créer une image
    Verify That Text Of Full Screen Icon Is    Plein écran
    Verify That Text Of Overview Map Icon Is    Vue d'ensemble
    Verify That Text Of Print Map Icon Is    Impression de la carte
    Click On Annotation Down List Arrow
    Verify That Texts Of Annotations Icon Are    Main levée    Texte    Point    Ligne    Rectangle    Polygone    Cercle
    Verify That Text Of Google Directions Icon Is    Google Directions
    Verify That Text Of Google Street View Icon Is    Google Street View
    Verify That Text Of Information Report Icon Is    Rapport d'information
    Click On Measurement Down List Arrow
    Verify That Texts Of Measures Icon Are    Mesure de distance    Mesure de superficie    Mesure de superficie circulaire
    Click On Selection Down List Arrow
    Verify That Texts Of Selections Icon Are    Sélection ponctuelle    Sélection linéaire    Sélection rectangulaire    Sélection polygonale    Sélection circulaire
    Verify That Text Of Show Sidebar Icon Is    Montrer la barre latérale
    Click On Show Sidebar Icon
    Verify That The Sidebar Icon Contains The Texts    Couches    Recherches    Mes cartes
    Click On Logout
    
JM70-932:Verify text With spanish language 
    Login JMap Web With Check Language    ${Title}    es    CONECTARSE    userTest1    userTest1
    Click On Options Icon
    Verify That Texts Of Options Icon Are    Opciones    Preferencias    Ayuda    Cambiar la contraseña    Desconexión (${UserName})
    Click On Share features Icon
    Verify That Texts Of Share Features Icon Are    Compartir    Enlace a este mapa    Insertar Mapa    Crear imagen
    Verify That Text Of Full Screen Icon Is    Pantalla completa
    Verify That Text Of Overview Map Icon Is    Vista global del mapa
    Verify That Text Of Print Map Icon Is    Impresión del mapa
    Click On Annotation Down List Arrow
    Verify That Texts Of Annotations Icon Are    Mano alzada    Texto    Punto    Línea    Rectángulo    Polígono    Círculo
    Verify That Text Of Google Directions Icon Is    Google Directions
    Verify That Text Of Google Street View Icon Is    Google Street View
    Verify That Text Of Information Report Icon Is    Reporte informativo
    Click On Measurement Down List Arrow
    Verify That Texts Of Measures Icon Are    Medir la distancia    Medir la superficie    Medir la superficie circular
    Click On Selection Down List Arrow
    Verify That Texts Of Selections Icon Are    Selección puntual    Selección lineal    Selección rectangular    Selección poligonal    Selección circular
    Verify That Text Of Show Sidebar Icon Is    Panel lateral
    Click On Show Sidebar Icon
    Verify That The Sidebar Icon Contains The Texts    Capas    Consultas    Mis mapas
    Click On Logout
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
*** Keywords ***
 
Verify That Texts Of Annotations Icon Are    [Arguments]    ${expected1}    ${expected2}    ${expected3}    ${expected4}    ${expected5}    ${expected6}    ${expected7}
    Verify That Text Of Freehand Annotation Icon Is    ${expected1}
    Verify That Text Of Text Annotation Icon Is    ${expected2}
    Verify That Text Of Point Annotation Icon Is    ${expected3}
    Verify That Text Of Line Annotation Icon Is    ${expected4}
    Verify That Text Of Rectangle Annotation Icon Is    ${expected5}
    Verify That Text Of Polygon Annotation Icon Is    ${expected6}
    Verify That Text Of Circle Annotation Icon Is    ${expected7}
    
Verify That Texts Of Measures Icon Are    [Arguments]    ${expected1}    ${expected2}    ${expected3}
    Verify That Text Of Distance Measurement Icon Is    ${expected1}
    Verify That Text Of Surface Measurement Icon Is    ${expected2}
    Verify That Text Of Circular Surface Measurement Icon Is    ${expected3}
    
Verify That Texts Of Selections Icon Are    [Arguments]    ${expected1}    ${expected2}    ${expected3}    ${expected4}    ${expected5}
    Verify That Text Of Punctual Selection Icon Is    ${expected1}
    Verify That Text Of Linear Selection Icon Is    ${expected2}
    Verify That Text Of Rectangular Selection Icon Is    ${expected3}
    Verify That Text Of Polygonal Selection Icon Is    ${expected4}
    Verify That Text Of Circular Selection Icon Is    ${expected5}
    
Verify That The Sidebar Icon Contains The Texts    [Arguments]    ${expected1}    ${expected2}    ${expected3}
    Verify That Text Of Layers Tab Is    ${expected1}
    Verify That Text Of Search Tab Is    ${expected2}
    Verify That Text Of My Maps Tab Is    ${expected3}