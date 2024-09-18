package routes

import (
	"online-store/controllers"

	"github.com/gin-gonic/gin"
)

func SetupRouter() *gin.Engine {
	r := gin.Default()

	r.POST("/register", controllers.RegisterHandler)
	r.POST("/login", controllers.LoginHandler)
	r.POST("/logout", controllers.AuthMiddleware, controllers.LogoutHandler)

	r.GET("/products", controllers.GetProducts)
	r.GET("/products/:category", controllers.GetProductsByCategory)
	r.GET("/product/:id", controllers.GetProduct)

	r.POST("/cart", controllers.AuthMiddleware, controllers.AddToCartHandler)
	r.GET("/cart", controllers.AuthMiddleware, controllers.ViewCartHandler)
	r.POST("/cart/checkout", controllers.AuthMiddleware, controllers.CheckoutHandler)

	return r
}
