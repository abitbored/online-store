package services

import (
	"errors"
	"online-store/config"
	"online-store/models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type AddToCartInput struct {
	UserID    uint `json:"user_id"`
	ProductID uint `json:"product_id"`
	Quantity  int  `json:"quantity"`
}

func AddToCart(c *gin.Context, input AddToCartInput) error {
	userID, exists := c.Get("user_id")
	if !exists {
		return errors.New("unauthorized: Login required to add to cart")
	}

	userIDInt, ok := userID.(int)
	if !ok {
		return errors.New("invalid user ID format")
	}

	if input.Quantity <= 0 {
		return errors.New("invalid quantity: Quantity must be greater than 0")
	}

	var product models.Product
	config.DB.First(&product, input.ProductID)
	if product.ID == 0 {
		return errors.New("product not found")
	}

	var cartItem models.Cart
	config.DB.Where("user_id = ? AND product_id = ?", userIDInt, input.ProductID).First(&cartItem)

	if cartItem.ID != 0 {
		cartItem.Quantity += input.Quantity
		result := config.DB.Save(&cartItem)
		if result.Error != nil {
			return result.Error
		}
	} else {
		cart := models.Cart{
			UserID:    uint(userIDInt),
			ProductID: input.ProductID,
			Quantity:  input.Quantity,
		}
		result := config.DB.Create(&cart)
		if result.Error != nil {
			return result.Error
		}
	}

	return nil
}

func ViewCart(userID uint) ([]models.Cart, error) {
	var carts []models.Cart

	err := config.DB.Preload("Product").Preload("User").Where("user_id = ?", userID).Find(&carts).Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("cart not found")
		}
		return nil, err
	}

	return carts, nil
}

func Checkout(userID int) error {
	// Retrieve the user's cart items
	var cartItems []models.Cart
	err := config.DB.Preload("Product").Where("user_id = ?", userID).Find(&cartItems).Error
	if err != nil {
		return err
	}

	// Calculate total price and quantity
	var totalPrice int
	var totalQuantity int
	for _, cartItem := range cartItems {
		totalPrice += cartItem.Product.Price * cartItem.Quantity
		totalQuantity += cartItem.Quantity
	}

	// Create an order
	order := models.Order{
		UserID:        userID,
		TotalPrice:    totalPrice,
		TotalQuantity: totalQuantity,
	}
	err = config.DB.Create(&order).Error
	if err != nil {
		return err
	}

	// Create order items
	for _, cartItem := range cartItems {
		orderItem := models.OrderItem{
			OrderID:   order.ID,
			ProductID: cartItem.Product.ID,
			Quantity:  cartItem.Quantity,
			Price:     cartItem.Product.Price,
		}
		err = config.DB.Create(&orderItem).Error
		if err != nil {
			return err
		}

		// Update product stock
		product := cartItem.Product
		product.Stock -= cartItem.Quantity
		err = config.DB.Save(&product).Error
		if err != nil {
			return err
		}
	}

	// Clear the user's cart
	err = config.DB.Where("user_id = ?", userID).Delete(&models.Cart{}).Error
	if err != nil {
		return err
	}

	return nil
}

// func ViewCart(userID uint) ([]models.Cart, error) {
// 	var cart []models.Cart

// 	err := config.DB.Preload("Product").Where("user_id = ?", userID).Find(&cart).Error
// 	if err != nil {
// 		return nil, err
// 	}
// 	return cart, nil
// }
