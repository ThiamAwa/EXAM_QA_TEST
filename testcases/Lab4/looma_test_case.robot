*** Settings ***
Library    AppiumLibrary 

Resource    ../../ressources/Lab4/looma_keywords.robot


*** Test Cases ***
Open the app
    Open App
Login
    [Tags]     "init"
    Type Valid login credentials 
    Sleep    5

Ajouter Produit 
    Add Product
    Sleep    5   