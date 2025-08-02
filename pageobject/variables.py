BASE_URL = "https://fakestoreapi.com"

DB_HOST="mongodb+srv://admin:passer123@clusterqatestexamen.ju7prft.mongodb.net/?retryWrites=true&w=majority&appName=ClusterQaTestExamen"
DB_NAME="label1DB"
collProduct="products"
collUsers="users"
collCarts="carts"

URL2="https://automationplayground.com/crm/"
emailValide = "admin@robotframeworktutorial.com"
emailNonValide = "admin@robotframework.com"
password = "pwd"
BROWSER = "chrome"
EBAY_URL="https://api.ebay.com/sell/fulfillment/v1"

platform="Android"
device_name="emulator-5554"
app_package="sn.sonatel.dsi.moussa.wade.moussawade"
app_activity=".MainActivity"
appuim_server="http://localhost:4723"

USERNAME="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]"
PASSWORD="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]"
loginButton="//android.widget.Button[@content-desc=\"Se connecter\"]"
 
 	


title="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]"
prix="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]"
description="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[3]"
categorie="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[4]"
image="//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[5]"
submitButton="//android.widget.Button[@content-desc=\"Ajouter\"]"


VALID_USER = {
    "email": "john@gmail.com",
    "username": "johnd",
    "password": "123456",
    "name": {
        "firstname": "John",
        "lastname": "Doe"
    },
    "address": {
        "city": "kilcoole",
        "street": "7835 new road",
        "zipcode": "12926-3874",
        "geolocation": {
            "lat": "-37.3159",
            "long": "81.1496"
        }
    },
    "phone": "1-570-236-7033"
}

INVALID_USER_1 = {
    "email": "",
    "username": "johnd",
    "password": "123456"
}

INVALID_USER_2 = {
    "email": "john@gmail.com",
    "username": "",
    "password": "123456"
}

VALID_USER_AUTH = {
    "username": "mor_2314",
    "password": "83r5^_"
}

INVALID_USER_1_AUTH = {
    "username": "",
    "password": "any"
}

INVALID_USER_2_AUTH = {
    "username": "mor_2314",
    "password": "wrongpass"
}
