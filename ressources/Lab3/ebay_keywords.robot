*** Settings ***
Library    RequestsLibrary
Variables  ../../pageobject/variables.py    # si tu veux externaliser token, url etc.
Library    OperatingSystem

*** Variables ***
${base_url_ebay}    https://api.sandbox.ebay.com
${ACCESS_TOKEN}    v^1.1#i^1#r^0#p^3#I^3#f^0#t^H4sIAAAAAAAA/+VYa2wjVxWO89jdaNmNui0tYkuJhrZqace+8/TMsHbXie3GySZ2Yidbu63MnZk79iTjmdl5OHFEUTZ0+xCUVn2BUJECLUit6IPtj5bVlqqIRkDVCqQKISpES1WJh6BVUYX4BXecbNYbYIOY1coS82d07z1z7vm+87hzLljZNfjZu8bu+tu+yO7etRWw0huJUHvB4K6BG/b39X5yoAd0CETWVq5e6V/t+/0hFzYMW5pBrm2ZLhpeahimK7UnE4TvmJIFXd2VTNhAruQpUjE1eUSio0CyHcuzFMsghnPpBEFBGcgsJXNxFsYBxeNZ84zOkpUgNFYBKqLiAhtXEMcjvO66PsqZrgdNL0HQgOZIIJCALgFRojiJE6OAFSrE8BxyXN0ysUgUEMm2uVL7W6fD1vObCl0XOR5WQiRzqWwxn8qlM1OlQ7EOXclNHooe9Hz33NGopaLhOWj46PzbuG1pqegrCnJdIpbc2OFcpVLqjDH/g/ltqpU45GgGCZCGHMOq9AWhMms5Deid345gRldJrS0qIdPTvdZOjGI25HmkeJujKawilx4OXtM+NHRNR06CyIykyrPFzAwxXCwUHKupq0htBxXDshTLCzSR9JCLKUROFTZa1WBQdaGpytbS5p4bijcZ37bpqGWqesCfOzxleSMIA0DbaQIdNGGhvJl3UpoXGNchR1FbdLKVwL8bDvW9uhm4GDUwJ8Pt4c7OOBMdZ+PhQsUHL/OUTEGNl5W4KKjCRnwEuR4uRpKBm1KFQiywBcmwRTags4A824AKIhVMr99Ajq5KDKfRjKAhUuVFjWRFTSNlTuVJSkMIICTLiij8n4aK5zm67HtoK1y2L7TxJoiiYtmoYBm60iK2i7Qr0WZwLLkJou55thSLLS4uRheZqOXUYjQAVOyWySNFpY4akNiS1XcWJvV2iCi4QGN5yWvZ2JolHIV4c7NGJBlHLUDHa434LTwuIsPArzORfI6Fye2z/wHqqKFjHkp4o+5COma5HlJDQVNRU1dQVVcvMrIg13dAR1KhkBlWTTcnkVe3Lja2HXAFtSGXDoUNl1LodReqzgJEtwuQEBXjgARxCYBQYFO2nWs0fA/KBsp1mS9ZjqZ5PhQ82/cvevbtgArptWW7LtRcZSEUtOAElnQY5LomedYCMruvhs5ksjOZ4li1lJ/ITIVCO4M0B7n1UoCz2+I0NZ3KpvAzOTabzx7hcuUj9XlnuWlNWJPcjOvAiVrW8NhFXS+DkTKVN0vHxo+WRmcLo/GFubnZrM/lp8Ya+WYzl0okQpFURIqDuqx0xcqzC/NZW8n4yxPKdD1lpOe9ypI3yjvzs5btt7La+JyuMq1KA4QDX+rOFHA2ArfaztAqHoUAGeQ6/gWudV1N4wVW5DUOUaIAoCzyIkWBuMJTGn6QjJjQR1SX4cWdBe4TcAc0nSrhBiOzRBZHbiEFIMucIEKRRBTkWIUP4+vg7Oo2N1+oo8sNupvughZ872IF0NajwckaVaxGzIK4lw+mqm2LYy5ud6Kab2i6YQTNW7jfTKTqDu48q76j/xsucK4/3wV80BzH8YzAqPE4HTVrjrVA4nqGotC2Ywo0DBmGjIWA4m5sJAqpYvFofiZcK5FGzW4rXayGVEpmKVLkVYpkAaOSELEayQsKwzCyiJeEUJi7rnmi4hxL0TzF/NetxLaJjsuaf7myi517fZ7saT/UauRnYDWy3huJgDQgqRvA9bv6Zvv7Pka4uoeim/dRUR1qUVevmdDzHRRdQC0b6k7vpT1v/vGBYvkXEy8++sPlY8ejN633DHbc4q/dDj6xdY8/2Eft7bjUB1eeXRmghq7YR3NAADQQKY4TK+AzZ1f7qcv7L/te5fSH5cfvvLU1eEXk7Z98OffVo1/JgH1bQpHIQE//aqSH/tNT+c+LyXdO3/kRM/SKuT60vvbksfSq3ffTtZc+/cT3X4ucPFFYSj72j6Mjr1/T+J347OFvH7yt/KPrci8Ojd93GfuH+CPX3X3vl4xP3X99+sDXTz71mwPfuufkwbtfuv3V49+JV6o/v9nLmurCk1cfevr1L7z3ualf7t971Qny/R9fcvChF6be+mjwi+/2D6yD909Nu3vWJn+wr54cf+GDpeeWn/7VG08cLt1ov3btHXbssfF3H3zr4M2VD96e+OvEN5/xm5HHXy5fdYBwrt3zznOHrT2nb1q59ZLTjw41e479+bunHspeuXZi9uPJvzTtzOLDv33z+BvP31fbfeqOb9z47Crx3q+P2/P7L+2557YPTzxT2T3z969VzQ2f/hOzMMT0XxkAAA==  
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
