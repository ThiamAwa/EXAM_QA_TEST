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
# Connect To MongoDB
#     ${client}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}')
#     Set Suite Variable    ${client}
#     ${db}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}')
#     Set Suite Variable    ${db}
#     ${collectionProduct}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collProduct}')
#     ${collectionUsers}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collUsers}')
#     ${collectionCart}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collCarts}')
#     Set Suite Variable    ${collectionProduct}
#     Set Suite Variable    ${collectionUsers}
#     Set Suite Variable    ${collectionCart}



#                         CRUD PRODUCT     
# Add Product
#     [Arguments]    ${product_data}
#     Evaluate    ${collectionProduct}.insert_one(${product_data})

Add Product
    [Arguments]    ${product_data}
    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collProduct}').insert_one(${product_data})    modules=pymongo

    

Read Product By Id
    [Arguments]    ${product_id}
    ${product_id_int}=    Evaluate    int(${product_id})
    ${product}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collProduct}').find_one({"id": ${product_id_int}})    modules=pymongo
    Log To Console    ${product}

    

Read All Product
    ${products}=    Evaluate    list(__import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collProduct}').find())    modules=pymongo
    Log To Console    ${products} 

Update Product
    [Arguments]    ${product_id}    ${product}    
    ${result}=    Evaluate    __import__('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collProduct}').update_one({'_id': __import__('bson').ObjectId('${product_id}')}, {'$set': ${product}})    modules=pymongo,bson
    Log To Console    ${result.modified_count}
 
Delete Product
    [Arguments]    ${product_id}
    ${result}=    Evaluate
    ...     ('pymongo').MongoClient('${DB_HOST}').get_database('${DB_NAME}').get_collection('${collProduct}').delete_one({'_id': __import__('bson').ObjectId('${product_id}')})
    ...    modules=pymongo,bson
    Log To Console    ${result.deleted_count}
 
