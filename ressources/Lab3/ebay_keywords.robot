*** Settings ***
Library    RequestsLibrary
Variables  ../../pageobject/variables.py    # si tu veux externaliser token, url etc.

*** Variables ***
${BASE_URL}       https://api.sandbox.ebay.com/sell/fulfillment/v1
${ACCESS_TOKEN}   access_token
${ORDER_ID}       order_id

*** Keywords ***

_get_auth_header
    [Return]    {'Authorization': 'Bearer ${ACCESS_TOKEN}', 'Content-Type': 'application/json', 'Accept': 'application/json'}
 

Create Ebay Session
    [Documentation]    Crée une session HTTP pour eBay avec le token d'autorisation
    Create Session    ebay    ${BASE_URL}    headers=${_get_auth_header()}


Get List Of Orders
    [Documentation]    Récupérer une liste de commandes (max 5)
    Create Ebay Session
    ${response}=    GET On Session    ebay    /order?limit=5&offset=0
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}
    [Return]    ${response.json()}

Get Single Order
    [Arguments]    ${order_id}
    [Documentation]    Récupérer une commande par ID
    Create Ebay Session
    ${response}=    GET On Session    ebay    /order/${order_id}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}
     [Return]    ${response.json()}