# Go Online Store API
A RESTful API for simple online store API with Go

It is a just simple tutorial or example for making simple RESTful API with Go using **gorilla/mux** (A nice mux library) and **gorm** (An ORM for Go)

## Run

Before running API server, you should set the database and JWT secret key config with your on a `.env` file
```env
DB_HOST=your_host
DB_PORT=your_port
DB_USER=your_username
DB_PASSWORD=your_password
DB_name=store
JWT_SECRET=your_super_secret_key
```
After that, you should manually input the product data directly to the database with this query
```sql
INSERT INTO products (name, description, price, category, stock)
VALUES('Beng-Beng', 'A chocolate-combo snack, combines multi layers of tasty element beyond just luscious real chocolate snack. Only Beng Beng holds the key to the exciting combinations, more than just chocolate or wafer.', 2500, 'food', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Onigiri Tuna Mayo', 'Nasi kepal dengan filling tuna mayonaise yang dapat dimakan langsung tanpa dipanaskan.', 13000, 'food', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Le Minerale Air Mineral 600ml', 'Le minerale air minum dalam kemasan. Air mineral pegunungan, dibotolkan langsung di sumbernya.', 3500, 'beverage', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Ultra Susu Uht Steril Slim Strawberry 250Ml', 'Susu cair segar berkualitas dengan rasa yang lezat dan istimewa serta mengandung kalsium susu dan fosfor.', 7500, 'beverage', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Faber Castell Pensil 2B', 'Pensil 2B Faber Castell yang dapat digunakan untuk ujian.', 3000, 'stationery', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Joyko Twist Crayon 12 Warna TWCR-12S', 'Crayon Favourit Yang Banyak Digunakan Oleh Anak-Anak Dan Bahkan Orang Dewasa. Pilihan Warna Yang Menarik, Aman Digunakan Bagi Balita Maupun Anak-Anak Karena Tidak Mengandung Toxic/Racun Yang Sangat Berbahaya Menjadikan Crayon Joyko Oil Pastel Menjadi Produk Pilihan Yang Sangat Berkualitas. Crayon Joyko Oil Pastel Adalah Pilihan Yang Terbaik Bagi Anak-Anak Bahkan Balita Yang Baru Saja Akan Belajar Mewarnai Dan Menggambar.', 50000, 'stationery', 999999);
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