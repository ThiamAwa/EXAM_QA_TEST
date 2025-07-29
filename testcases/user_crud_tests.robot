*** Settings ***
Resource    ../ressources/user_keywords.robot
Library     Collections
Library           RequestsLibrary

*** Test Cases ***


✅ Création Utilisateur - Scénario Valide
    Comment    Ce test crée un utilisateur valide et vérifie l’ID généré
    ${response}=    Create User    ${VALID_USER}
    Log To Console    Status code : ${response.status_code}
    ${json}=    Set Variable    ${response.json()}
    Log To Console    Réponse JSON : ${json}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${json}    id
    Set Suite Variable    ${USER_ID}    ${json["id"]}


Création Utilisateur - Email Vide
    [Documentation]    Teste la création d’un utilisateur avec email vide.
    ${response}=    POST On Session    api    /users    json=${INVALID_USER_1}
    Log To Console    Statut HTTP : ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ⚠️ L’API accepte un utilisateur avec email vide — cela montre un manque de validation côté backend.
    Log To Console    ${response.content}
    
Création Utilisateur - Username Vide
    [Documentation]    Teste la création d’un utilisateur avec un champ username vide. L’API ne devrait pas accepter cette requête.
    ${response}=    POST On Session    api    /users    json=${INVALID_USER_2}
    Log To Console    ⚠️ Statut retourné : ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200

Lecture Utilisateur - Valide
    ${response}=    GET On Session    api    /users/${USER_ID} 
    Log To Console    Lecture Utilisateur - Status : ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200
   
     Log To Console    ${response.status_code}
     Log To Console    ${response.content}


❌ Lecture Utilisateur - ID Inexistant
    ${response}=    GET On Session    api    /users/99999
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Run Keyword If    '${json}' == 'None'    Log To Console    Réponse vide (None) pour utilisateur inexistant
    ...    ELSE    Length Should Be    ${json}    0

❌ Lecture Utilisateur - ID Texte
    ${response}=    GET On Session    api    /users/abc    expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.text}
    Log To Console    Réponse erreur : ${body}




✅ Mise à Jour Utilisateur - Scénario Valide
    ${updated_user}=    Create Dictionary    email=jane@doe.com    username=janedoe    password=5678
    ${response}=    PUT On Session    api    /users/${USER_ID}    json=${updated_user}
    Should Be Equal As Integers    ${response.status_code}    200

❌ Mise à Jour - ID Inexistant
    ${response}=    PUT On Session    api    /users/99999    json=${VALID_USER}
    Log To Console    ⚠️ ID inexistant mais statut : ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ⚠️ Cette API ne valide pas l'existence de l'utilisateur à mettre à jour.


❌ Mise à Jour - Données Vides
    ${response}=    PUT On Session    api    /users/${USER_ID}    json={}    expected_status=400
    Log To Console    🔄 Statut HTTP : ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    400
    Log To Console    ✅ L’API refuse logiquement une mise à jour avec données vides.

✅ Suppression Utilisateur - Scénario Valide
    ${response}=    DELETE On Session    api    /users/${USER_ID}
    Should Be Equal As Integers    ${response.status_code}    200

❌ Suppression Utilisateur - ID Inexistant
    ${response}=    DELETE On Session    api    /users/99999
    Log To Console    Statut HTTP obtenu : ${response.status_code}
    Log To Console    Corps de la réponse : ${response.text}
    Should Not Contain    ${response.text}    "success"    


Suppression Utilisateur - ID Texte
    ${response}=    DELETE On Session    api    /users/abc    expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.text}
    Log To Console    Réponse erreur : ${body}
   

    

    

   



