*** Settings ***
Library    SeleniumLibrary
Resource    ../../ressources/Lab3/ebay_keywords.robot
Library    Collections                                                  
*** Test Cases ***

Lister Les Commandes eBay
    ${orders}=    Get List Of Orders
    Log To Console    Voici les commandes: ${orders}

Afficher Une Commande eBay
    ${order}=    Get Single Order    ${ORDER_ID}
    Log To Console    Détails de la commande: ${order}