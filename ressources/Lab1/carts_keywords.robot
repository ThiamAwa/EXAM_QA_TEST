
*** Settings ***
Library    RequestsLibrary
Variables  ../pageobject/variables.py

*** Variables ***
${DB_HOST}    mongodb+srv://admin:passer123@clusterqatestexamen.ju7prft.mongodb.net/?retryWrites=true&w=majority&appName=ClusterQaTestExamen 
${DB_NAME}    label1DB
${collProduct}    products
${collUsers}    users
${collCarts}    carts


*** Keywords ***

Add Cart
    [Arguments]    ${carts_data}
    ${cart}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collCarts}').insert_one(${carts_data})    modules=pymongo
    Log To Console    ${cart.inserted_id}

Read Cart by id  
    [Arguments]    ${carts_id}
    ${carts_id_int}=    Evaluate    int(${carts_id})
    ${cart}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collCarts}').find_one({"id": ${carts_id_int}})    modules=pymongo
    Log To Console    ${cart}

Read All Cart
    ${carts}=    Evaluate    list(__import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collCarts}').find())    modules=pymongo
    Log To Console    ${carts}  

Update Cart
    [Arguments]    ${carts_id}    ${carts_data}
    ${result}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collCarts}').update_one({'_id': __import__('bson').ObjectId('${carts_id}')}, {'$set': ${carts_data}})    modules=pymongo,bson
    Log To Console    ${result.modified_count}
 
Delete Cart
    [Arguments]    ${carts_id}
    ${ObjectId}=    Evaluate    __import__('bson').ObjectId('${carts_id}')    modules=bson
    ${result}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collCarts}').delete_one({'_id': __import__('bson').ObjectId('${carts_id}')})    modules=pymongo,bson
    Log To Console    ${result.deleted_count}      