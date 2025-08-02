*** Settings ***
Library    SeleniumLibrary
Resource    ../../ressources/Lab3/ebay_keywords.robot
Library    Collections               

Suite Setup    Désactiver Avertissements SSL                                   
*** Test Cases ***

Lister Les Commandes eBay
    ${orders}=    Get List Of Orders
    Log To Console    Voici les commandes: ${orders}

Afficher Une Commande eBay
    [Tags]    ebay
    ${order}=    Get Single Order    ${ORDER_ID}
    Log To Console    Détails de la commande: ${order}


Lister Les Commandes eBayTest Non Passant
    [Tags]    ebaynonpassant
    Get List Of Orders - Test Non Passant    
    
Get Single Order_Test Non Passant 
    [Tags]    ebaynonpassant2
    Get Single Order - Test Non Passant   