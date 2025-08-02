*** Settings ***
Library    RequestsLibrary
Variables  ../../pageobject/variables.py    # si tu veux externaliser token, url etc.
Library    OperatingSystem

*** Variables ***
${base_url_ebay}    https://api.sandbox.ebay.com
${ACCESS_TOKEN}   v^1.1#i^1#r^0#p^3#I^3#f^0#t^H4sIAAAAAAAA/+VYW2wcVxn2+pIoCaGitGlBFdpMSqU2mt0z150ZshvW3t1kndje9axN7FKWMzNn1mPPzgxz8XpdHowpKagXtRIqDxiISAVU3FtcFTUhFg9RSCMoiKovUQlqCRBBiFIJgooCZ9YbxzbgIDYKKzEvo3POP//5v++/nPkPmNu05YHD+w//ZXtkc+eROTDXGYlQ28CWTT27393V+f6eDrBKIHJk7t657vmu3+3xYNV0pGHkObbloehM1bQ8qTGZJALXkmzoGZ5kwSryJF+V5PTAQYmOAclxbd9WbZOI5jNJguFBQqNpTtc4ABiE8Kx1TWfJThIcRek0YijE0FDjmXDd8wKUtzwfWn6SoAHNkUAgAV0ClASAxAoxHlDjRHQUuZ5hW1gkBohUw1yp8a27ytaNTYWeh1wfKyFS+XROHkrnM9nB0p74Kl2pJg+yD/3AWzvqszUUHYVmgDbexmtIS3KgqsjziHhqeYe1SqX0NWP+C/MbVEOVoUQFMhRkWV5Q9JtCZc52q9Df2I5wxtBIvSEqIcs3/PqNGMVsKJNI9ZujQawin4mGr2IATUM3kJsksr3psRE5O0xE5ULBtacNDWkhUophWQpjpImUjzxMIXLLsFovh4OyBy1NsWeaey4rbjK+btM+29KMkD8vOmj7vQgDQGtpAhK3iiYsNGQNuWndD41bLcc06eREfjz077JDA3/CCl2MqpiTaGN4Y2dci47r8XCz4kNHEPEaI3ACw9J6ohkeYa63FCKp0EvpQiEemoIUWCer0J1CvmNCFZEqZjeoItfQJIbTaUbQEanxok6yoq6TCqfxJKUjBBBSFFUU/k8jxfddQwl8tBIt6xcaeJOErNoOKtimodaJ9SKNQtSMjRkvSUz4viPF47VaLVZjYrZbidMAUPFDAwdldQJVIbEia9xYmDQaIaLi+ozlJb/uYGtmcBDiza0KkWJcrQBdv94b1PFYRqaJX9cCeY2FqfWz/wZqn2lgHkp4o/ZCut/2fKS1BE1D04aKyoZ2q5GFub4xOpJqCZlpVwxrAPkT9i3HtjGusDbkMy1hw5UU+u2FaqWwUCUq0SxAbDhO4CrTEti04+Sr1cCHionybeZLlqNpnm8JnhMEtz77NkaFjMqsMyFUPHWqJWjhCSwZUA9zXfLtKWS1Xw0dzuaGs/L+cmnoQHawJbTDSHeRN1EKcbZbnKaL6VwaPwOF0dl9/SO7iyP1yuC0kC9QdKXIaAqTqWq8XLNA/yxwM2hAzbkiU++rw8RYbTY3avvpcQfBojhQTCZbIklGqovarHTFx0amJnOOmg1mD6jFibSZmfTHZ/w+3p0csZ2gntP7Rw2NqY9XQWvgS+2ZAu5y4JYbGVrGo1ZAhrlOZCttV9N4gRV5nUOUKACoiLxIUSCh8pSOH6QgpuUjqs3w4s4C9wm4AyqmS7jByM6Qcu8hUgCKwgkiFElEQY5V+ZZ8jc+udnPzzTq6vLC7aS9o4fceVgAdIxaerDHVrsZtiFv5cKrcsDju4XYnpgembphm2Ly19puJNMPFnWc5cI1/xQXO9ef/93zQHMfxjMBoiQQdsyquPUXieoZi0HHiKjRNBbYYCyHF7dhIFNKy/JGh4dZaiQyabrfSxepIoxSWIkVeo0gWMBoJEauTvKAyDKOIeEloCXPbNU9UgmOByLPMf9wprZtYdVnzTzd28bW356mOxkPNR06D+cjJzkgEZABJ7Qb3b+oa6e56F+EZPoo176Ni+O895hkVC/qBi2JTqO5Aw+18b8cvLzwlj/38wEvP/Gj2E5+K7T3ZsWXVJf6Rh8DdK9f4W7qobavu9ME911d6qNvu2k5zQAA0oABghXGw6/pqN7Wj+46DL08eOaEsfuzu+166a+zST+e/WL/4Y7B9RSgS6enono90PLJp69czn7/zV8eO1y7JT6fPLS5++OMPL5wxj3312zWVfeSO32w7X7s6f3apq/vUUfG7b4399Vzi2JnFpeOp05/b/NDtLz8zd+656FP5nW8XT3326MVd7+x9z21/f/KNF1+/79Gt5aXNnZWeZy9f+daJV/54+2Mnl37wDfhpc+ntHRenz3zgZ07/xNzM8NUX/3Q+j579zoeO/uRrT+7980WpuusLjxV2bt5X3HMs93j1twvv5C9PnTq889U9cOHqG0vP/35H/6Ffb/X84Pgh+ZNfGnqi4/RHc2fPP7hw4Mo9T1/6yi9UuTv/5g+//+gr3c9978xr2tWlKy/84egHLxAvLP7tbO8J9/7LD2dNNz9cefXCZ8Qvv++bD+xe2Lfs038AUqv4aV4ZAAA=
${ORDER_ID}       1

*** Keywords ***

# _get_auth_header
#     [Return]    {'Authorization': 'Bearer ${ACCESS_TOKEN}', 'Content-Type': 'application/json', 'Accept': 'application/json'}
 
Désactiver Avertissements SSL
    Set Environment Variable    PYTHONWARNINGS    ignore:Unverified HTTPS request 
    
Create Ebay Session
    [Documentation]    Crée une session HTTP pour eBay avec le token d'autorisation
    Create Session    ebay    ${base_url_ebay}    
    

Get List Of Orders
    [Documentation]    Récupérer une liste de commandes (max 5)
    Create Ebay Session
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    ...    Accept=application/json
    ${response}=    Get Request    ebay    /sell/fulfillment/v1/order?limit=5    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN    ${response.json()['orders']}

Get Single Order
    [Arguments]    ${order_id}
    [Documentation]    Récupérer une commande par ID
    Create Ebay Session
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    ...    Accept=application/json
    ${response}=    Get Request    ebay    /sell/fulfillment/v1/order/${order_id}    headers=${headers}
   
    Log To Console    ${response.json()}

Get List Of Orders - Test Non Passant
    [Documentation]    Ce test échoue si aucune commande n'est trouvée
    Create Ebay Session
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    ...    Accept=application/json
    ${response}=    Get Request    ebay    /sell/fulfillment/v1/order?limit=5    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}
    Should Be Equal As Integers    ${response.status_code}    200
    ${orders}=    Set Variable    ${response.json()['orders']}
    Should Not Be Empty    ${orders}
    
Get Single Order - Test Non Passant
    [Documentation]    Ce test échoue exprès avec un ID de commande invalide
    ${invalid_order_id}=    Set Variable    123456789INVALID
    Create Ebay Session
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    ...    Accept=application/json
    ${response}=    Get Request    ebay    /sell/fulfillment/v1/order/${invalid_order_id}    headers=${headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}
    Should Be Equal As Integers    ${response.status_code}    200    L'ID de commande est invalide. Test échoue comme prévu.

Issue Refund
    [Arguments]    ${order_id}    ${lineItemId}
    [Documentation]    Effectuer un remboursement sur une commande lineItemId sert à identifier de manière unique chaque article dans une commande.
    Create Ebay Session
    ${headers}=    Create Dictionary
    ...    Authorization=Bearer ${ACCESS_TOKEN}
    ...    Content-Type=application/json
    ...    Accept=application/json

    ${body}=    Create Dictionary
    ...    refundReason=BUYER_CANCEL
    ...    refundItems=[
    ...        {
    ...            "lineItemId": "${lineItemId}",
    ...            "amount": {
    ...                "currency": "USD",
    ...                "value": "10.00"
    ...            }
    ...        }
    ...    ]

    ${response}=    Post Request    ebay    /sell/fulfillment/v1/order/${order_id}/issue_refund    data=${body}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Réponse remboursement : ${response.text}
