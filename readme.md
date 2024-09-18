# Go Online Store API
A RESTful API for simple online store API with Go

It is a just simple tutorial or example for making simple RESTful API with Go using **gorilla/mux** (A nice mux library) and **gorm** (An ORM for Go)

## Installation & Run
```bash
# Download this project
go get github.com/mingrammer/go-todo-rest-api-example
```

Before running API server, you should set the database and JWT secret key config with your on a `.env` file
```env
DB_HOST=your_host
DB_PORT=your_port
DB_USER=your_username
DB_PASSWORD=your_password
DB_name=store
JWT_SECRET=your_super_secret_key
```

## Structure
```
├── auth
│   └── auth.go
├── config
│   └── config.go
├── controllers
│	├── cart_controller.go
│	├── product_controller.go
│	└── user_controller.go
├── models
│	├── cart_model.go
│	├── order_model.go
│	├── product_model.go
│	└── user_model.go
├── routes
│   └── routes.go
├── services
│	├── cart_service.go
│	└── user_service.go
└── main.go
```

## API

#### /register
* `POST` : Create a new account

#### /login
* `POST` : Login to the application

#### /logout
* `POST` : Logout from the application

#### /products
* `GET` : Get all products 

#### /products/:category
* `GET` : Get all products from a category

#### /products/:id
* `GET` : Get product by item id

#### /cart
* `POST` : Add item to user's shopping cart

#### /cart
* `GET` : Get all item from user's shopping cart

#### /cart/checkout
* `POST` : Checkout all item from user's shopping cart