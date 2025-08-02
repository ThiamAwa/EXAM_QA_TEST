*** Settings ***
Library    SeleniumLibrary
Resource    ../../ressources/Lab2/customer_service_keywords.robot



Suite Setup    Ouverture Navigateur    
Suite Teardown    Close web browser

*** Test Cases ***

Home page should load id1
    Navigate to home page adresse
   

Login should succeed with valid credentials id2
    Navigate to home page adresse
    Click "Login" Link
    Type Valid login credentials    email=${emailValide}    password=${password}

Should be able to add new customer id6
    Click "New Customer button"
    Type customer attributs


Should be able to Logout id4
    logout


Login should fail with missing credential id3
    Click "Login" Link
    Type Valid login credentials    email=${emailNonValide}    password=${password}
    logout



# Remember me checkbox should persist email address id3
#      [Tags]       smoke    auth
#     Click "Login" Link 
#     Navigate to LOGIN page adresse
#     Type Valid login credentials    email=${emailValide}    password=pwd
#     Select Remenber option
#     logout
#     # Click "Login" Link

# Customers page should display multiple customers id5
#     Click "Login" Link
#     Type Valid login credentials    email=${emailValide}    password=${password}
#     Examine customers grid for multiple records

# Should be able to cancel adding new customer id7
   
#     Click "Login" Link
#     Type Valid login credentials    email=${emailValide}    password=${password} 
#     Click "New Customer button"
#     Click "Cancel" button

    


    




    