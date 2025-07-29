*** Settings ***
Library           RequestsLibrary
Library           Collections
Resource    ../ressources/auth_keywords.robot


*** Test Cases ***
Test Login Réussi
    ${token}=    Obtenir Token
    Log    Token récupéré : ${token}

