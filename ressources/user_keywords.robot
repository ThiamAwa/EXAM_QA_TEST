*** Settings ***
Library           Collections
Variables         ../pageobject/variables.py 
Library    RequestsLibrary


*** Keywords ***

# ---------------------------------------------------------------------------
# UTILITAIRES
# ---------------------------------------------------------------------------
Setup API Session
    [Arguments]    ${alias}=api
    # Crée la session uniquement si elle n’existe pas déjà
    ${status}=     Run Keyword And Return Status    Get Session    ${alias}
    Run Keyword If    not ${status}    Create Session    ${alias}    ${BASE_URL}    verify=False

# ---------------------------------------------------------------------------
# CRUD – UTILISATEUR
# ---------------------------------------------------------------------------
Create User
    [Arguments]    ${user_data}
    Setup API Session
    ${resp}=       POST On Session    api    /users    json=${user_data}
    RETURN         ${resp}

Get User
    [Arguments]    ${user_id}
    Setup API Session
    ${resp}=       GET On Session     api    /users/${user_id}
    RETURN         ${resp}

Update User
    [Arguments]    ${user_id}    ${user_data}
    Setup API Session
    ${resp}=       PUT On Session    api    /users/${user_id}    json=${user_data}
    RETURN         ${resp}

Delete User
    [Arguments]    ${user_id}
    Setup API Session
    ${resp}=       DELETE On Session api    /users/${user_id}
    RETURN         ${resp}
