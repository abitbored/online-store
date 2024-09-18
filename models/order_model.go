package models

import (
	"gorm.io/gorm"
)

type Order struct {
	gorm.Model
	UserID        int `gorm:"index;foreignkey:UserID"`
	TotalPrice    int `gorm:"not null"`
	TotalQuantity int `gorm:"not null"`
}

type OrderItem struct {
	gorm.Model
	OrderID   uint `gorm:"index;foreignkey:OrderID"`
	ProductID uint `gorm:"index;foreignkey:ProductID"`
	Quantity  int  `gorm:"not null"`
	Price     int  `gorm:"not null"`
}
