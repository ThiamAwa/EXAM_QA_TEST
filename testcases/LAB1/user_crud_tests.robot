*** Settings ***
Resource    ../../ressources/Lab1/user_keywords.robot

Library     Collections
Library           RequestsLibrary

*** Test Cases ***

✅ Création Utilisateur - Scénario Valide
    [Tags]    smoke
    [Documentation]    Teste la création d'un utilisateur valide
    ${name}=    Create Dictionary
    ...    firstname    john
    ...    lastname    doe

    # Préparation des données avec un ID numérique
    ${user_data}=    Create Dictionary
    ...    id          ${12345}  
    ...    username    johndoe
    ...    email       john.doe@example.com
    ...    password    secret123
    ...    phone       1234567890
    ...    name    ${name}
    
    
    # Exécution avec gestion d'erreur améliorée
    ${status}=    Run Keyword And Return Status
    ...    Create User    ${user_data}
    





Création Utilisateur - Email Vide
    [Tags]    emailVide
    [Documentation]    Vérifie que le système rejette la création d'un utilisateur sans email conformément au schéma de validation
    
    
    ${user_data}=    Create Dictionary
    ...    username    john_doe
    ...    email       ${EMPTY}
    ...    password    secret123
    ...    phone       1234567890
    ...    name        ${{{"firstname": "John", "lastname": "Doe"}}}
    ...    id          ${123}
    
    # Exécution de la requête avec capture de l'erreur attendue
    ${response}=    Run Keyword And Expect Error    *
    ...    Create User    ${user_data}
    
    # Vérifications plus précises
    Should Contain    ${response}    ValidationError    
    Should Contain    ${response}    email    
    


    

Création Utilisateur - Username Vide
    [Tags]    usernameVide    invalid
    [Documentation]    Vérifie que le système rejette la création avec username vide (scénario invalide)
    
    # Données de test avec username vide
    ${user_data}=    Create Dictionary
    ...    username    ${EMPTY}
    ...    email       valid@email.com
    ...    password    secret123
    ...    phone       1234567890
    ...    name        ${{{"firstname": "John", "lastname": "Doe"}}}
    ...    id          ${123}

    # Doit échouer avec une erreur de validation
    ${response}=    Run Keyword And Expect Error    *Document failed validation*
    ...    Create User    ${user_data}
    
    # Vérifications spécifiques
    Should Contain    ${response}    username
    Should Contain    ${response}    minLength
    Should Contain    ${response}    specified string length was not satisfied
    
    
    
    
    
   
   
    
  
    
    


Lecture Utilisateur by ID - Valide
    [Tags]    usersI    smoke
    ${user}=    Get User by ID    12345  
    Log To Console    Détails utilisateur: ${user}

Get All Users - Valid
    [Tags]    usersRA    smoke
    ${users}=    Get All Users
    Log To Console    Liste utilisateurs: ${users}

Lecture Utilisateur - ID Inexistant
    [Tags]    readidInexistant
   
    ${invalid_id}=    Set Variable    999999 
    
    
    ${user}=    Get User by ID    ${invalid_id}
    
    Should Be Equal    ${user}    None    msg=Le système devrait retourner None pour un ID inexistant 
    
   

❌ Lecture Utilisateur - ID Texte    
    [Tags]    readidTexte
    ${invalid_id}=    Set Variable    abc 
    
    ${user}=    Get User by ID    ${invalid_id}
    
    ${is_none}=    Evaluate    ${user} is None
    Should Be True    ${is_none}    msg=Le système devrait retourner None pour un ID texte invalide
    

✅Mise à Jour Utilisateur - Scénario Valide
    [Tags]    smoke2
    
 
    ${ObjectId} =    Set Variable    688b6eac210c6a7b0334ab8a
    ${id_obj} =    Evaluate    __import__('bson').ObjectId("${ObjectId}")    modules=bson
    
    ${update_data} =    Create Dictionary
    ...    id=${67890} 
    ...    username=newjohndoe
    ...    email=new.john@domain.com
    ...    phone=9876543210
    ...    name=${{ {'firstname': 'John', 'lastname': 'Doe'} }} 
    
    
    ${result} =    Update User    ${id_obj}    ${update_data}
    
    
    Should Be Equal As Integers    ${result.modified_count}    1
 
    
❌Mise à Jour - ID Inexistant
    [Tags]    mjIDInex
    [Documentation]    Vérifie le rejet des IDs seniors invalides
    
    ${invalid_senior_id}=    Set Variable    00000000000000
    
    
    &{update_data}=    Create Dictionary
    ...    username    senior_invalid_test
    ...    email       senior_invalid@test.com
    ...    senior      ${True}
    
    
    ${result}=    Update User    ${invalid_senior_id}    ${update_data}
    
    # Vérifications
    Should Be Equal As Integers    ${result.matched_count}    0
    ...    msg=ERREUR: Un ID senior invalide a été accepté!
    
    Should Be Equal As Integers    ${result.modified_count}    0
    ...    msg=ERREUR: Modification effectuée avec un ID senior invalide!
    
    #Vérification du statut senior
    ${user}=    Get User by ID    ${invalid_senior_id}
    Should Be Equal    ${user}    ${None}
    ...    msg=ERREUR: Utilisateur créé avec ID senior invalide!
   


 ❌Mise à Jour - Données Vides avec ID Senior Invalide
    [Tags]    mjdonneVide
    [Documentation]    Vérifie que le système rejette une mise à jour vide sur un ID senior invalide

    ${invalid_senior_id}=    Set Variable    688b6ed81fd8ccb745780043
    
    ${empty_data}=    Create Dictionary

    ${status}    ${error}=    Run Keyword And Ignore Error
    ...    Update User    ${invalid_senior_id}    ${empty_data}

    
    Should Be Equal    ${status}    FAIL
    ...    msg=Le système devrait rejeter cette requête!

    Should Contain    ${error}    InvalidId
    ...    msg=Erreur attendue: ID senior invalide non détecté

    Log    Comportement correct: ${error}    level=INFO
    
    





Suppression Utilisateur - Scénario Valide
    [Tags]    smoke3
    ${user_id}=    Set Variable    688abbb4a1f3cbaceb149ca0
    ${result}=    Delete User    ${user_id}
    
    Should Be Equal As Integers    ${result.deleted_count}    1
    Log    Suppression réussie de l'utilisateur ${user_id}
    
  
    

❌Suppression Utilisateur - ID Inexistant
    [Tags]    deleteIDI    negative
    [Documentation]    Scénario invalide: doit ÉCHOUER pour un ID inexistant

    ${non_existent_id}=    Set Variable    000000000000000000000000

   
    ${result}=    Delete User    ${non_existent_id}

    
    Run Keyword If    ${result.deleted_count} == 0
    ...    Fail    ❌ ERREUR: Le système devrait rejeter la suppression d'un ID inexistant!
    ...    ELSE
    ...    Log    ⚠️ Comportement inattendu: ${result}    level=WARN

   
    ${user_exists}=    Run Keyword And Return Status
    ...    User Should Exist    ${non_existent_id}
    Run Keyword If    ${user_exists}
    ...    Fail    ❌ ERREUR CRITIQUE: L'utilisateur a été créé lors de la suppression!




❌Suppression Utilisateur - ID Texte
    [Tags]    deleteIDIText    negative
    [Documentation]    Scénario invalide: doit ÉCHOUER pour un ID Texte

    ${non_existent_id}=    Set Variable    abcccvv

   
    ${result}=    Delete User    ${non_existent_id}

    
    Run Keyword If    ${result.deleted_count} == 0
    ...    Fail    ❌ ERREUR: Le système devrait rejeter la suppression d'un ID inexistant!
    ...    ELSE
    ...    Log    ⚠️ Comportement inattendu: ${result}    level=WARN

   
    ${user_exists}=    Run Keyword And Return Status
    ...    User Should Exist    ${non_existent_id}
    Run Keyword If    ${user_exists}
    ...    Fail    ❌ ERREUR CRITIQUE: L'utilisateur a été créé lors de la suppression!
   

    

    

   