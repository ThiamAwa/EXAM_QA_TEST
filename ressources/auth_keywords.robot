*** Settings ***
Library           RequestsLibrary
Library           Collections
Variables         ../pageobject/variables.py

*** Variables ***
${DB_NAME}        label1DB
${collProduct}    products
${collUsers}      users
${collCarts}      carts

*** Keywords ***
Login User
    [Arguments]    ${credentials}
    
    
    ${user_query}=    Set Variable    {'username': '${credentials['username']}', 'password': '${credentials['password']}'}
    
    ${user}=    Evaluate    __import__('pymongo').MongoClient('mongodb+srv://admin:passer123@clusterqatestexamen.ju7prft.mongodb.net').get_database('${DB_NAME}').get_collection('${collUsers}').find_one(${user_query})
    
    # Create le resultat du dictionnaire
    ${result}=    Create Dictionary
    IF    $user is None
        Set To Dictionary    ${result}    status=FAILURE
        Set To Dictionary    ${result}    message=Authentification échouée
        Set To Dictionary    ${result}    error_code=401
    ELSE
        ${token}=    Generate Auth Token    ${credentials['username']}
        Set To Dictionary    ${result}    status=SUCCESS
        Set To Dictionary    ${result}    token=${token}
        Set To Dictionary    ${result}    user=${user}
    END
    
    RETURN    ${result}

Generate Auth Token
    [Arguments]    ${username}
    RETURN    mock_token_${username}