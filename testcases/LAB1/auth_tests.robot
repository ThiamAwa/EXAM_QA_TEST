*** Settings ***
Library           Collections
Variables         ../pageobject/variables.py
Resource    ../ressources/auth_keywords.robot

*** Test Cases ***
Connexion Utilisateur Valide
    [Tags]    valid
    ${credentials}=    Create Dictionary
    ...    username    johndoe
    ...    password    secret123
    
    ${response}=    Login User    ${credentials}
    
    # Vérifications (notation point recommandée)
    Should Be Equal As Strings    ${response.status}    SUCCESS
    Dictionary Should Contain Key    ${response}    token
    Should Not Be Empty    ${response.token}



Connexion Mot de Passe Incorrect
    [Tags]    invalid
    ${credentials}=    Create Dictionary
    ...    username=johndoe
    ...    password=fauxmotdepasse
    
    ${response}=    Login User    ${credentials}
    
    # Vérifications renforcées
    Should Be Equal As Strings    ${response.status}    FAILURE
    Should Be Equal As Strings    ${response.message}    Mot de passe incorrect
    Dictionary Should Contain Key    ${response}    error_code
    Should Be Equal As Numbers    ${response.error_code}    401
    Dictionary Should Not Contain Key    ${response}    token