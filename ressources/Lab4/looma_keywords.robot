*** Settings ***
Variables  ../../pageobject/variables.py    
Library    AppiumLibrary

*** Keywords ***

Open App
    Open Application    http://localhost:4723    platformName=Android    deviceName=Pixel 3a API 35    appPackage=sn.sonatel.dsi.moussa.wade.moussawade    appActivity=.MainActivity    automationName=UiAutomator2

Type Valid login credentials
    Wait Until Element Is Visible    ${USERNAME}    5
    Wait Until Element Is Visible    ${PASSWORD}    5
    Click Element    ${USERNAME}
    Input Text    ${USERNAME}    johnd
    Click Element    ${PASSWORD}
    Input Password    ${PASSWORD}    m38rmF$
    Log To Console    reussi
    Click Element    ${loginButton}  
    Sleep    5s
    
Add Product
    [Documentation]    #Ajouter un produit à la liste de souhaits
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]    5
    Click Element    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]
    Input Text    ${title}    lait
    Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]    5
    Click Element    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]
    Input Text    ${prix}    1500
     Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[3]    5
    Click Element    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[3]
    
    Input Text    ${description}    lait en poudre    
     Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[4]    5
    Click Element    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[4]
    
    Input Text    ${categorie}    alimentaire
     Wait Until Element Is Visible    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[5]    5
    Click Element    //android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[5]
    
    Input Text    ${image}    liat.png
    Wait Until Element Is Visible    ${submitButton}    5
    Click Element    ${submitButton}
    Sleep    3
    Log To Console    Produit ajouté à la liste de souhaits