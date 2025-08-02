*** Settings ***
Library           Collections
Variables         ../pageobject/variables.py 
Library    RequestsLibrary

*** Variables ***
${DB_HOST}    mongodb+srv://admin:passer123@clusterqatestexamen.ju7prft.mongodb.net
# ...    /?retryWrites=true&w=majority&appName=ClusterQaTestExamen
${DB_NAME}    label1DB
${collProduct}    products
${collUsers}    users
${collCarts}    carts


*** Keywords ***


# ---------------------------------------------------------------------------
# CRUD – UTILISATEUR
# ---------------------------------------------------------------------------
Create User
    [Arguments]    ${user_data}
    ${result}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collUsers}').insert_one(${user_data})    modules=pymongo
    Should Not Be Empty    ${result.inserted_id}
    Log    Résultat insertion: ${result}
    ${check}=    Evaluate    ${result}.acknowledged
    Should Be True    ${check}
    

Get User by ID
    [Arguments]    ${user_id}
    ${user}=    Evaluate
    ...    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collUsers}').find_one({"id": ${user_id}})
    ...    modules=pymongo
    RETURN    ${user}

Get All Users
    ${users}=    Evaluate
    ...    list(__import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collUsers}').find().limit(10))
    ...    modules=pymongo
    RETURN    ${users}
    


Update User
    [Arguments]    ${user_id}    ${user_data}
    ${user}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collUsers}').update_one({'_id': __import__('bson').ObjectId('${user_id}')}, {'$set': ${user_data}})     modules=pymongo
    RETURN    ${user}



Delete User
    [Arguments]    ${user_id}  
    ${result}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collUsers}').delete_one({"_id": __import__('bson').ObjectId("${user_id}")})  modules=pymongo,bson
    
    Log To Console    ${result.deleted_count}  
    RETURN    ${result}    
    