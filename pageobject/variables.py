BASE_URL = "https://fakestoreapi.com"

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
