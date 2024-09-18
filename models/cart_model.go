package models

import "gorm.io/gorm"

type Cart struct {
	gorm.Model
	UserID    uint    `json:"user_id"`
	ProductID uint    `json:"product_id"`
	Quantity  int     `json:"quantity"`
	User      User    `gorm:"foreignKey:UserID" json:"user"`
	Product   Product `gorm:"foreignKey:ProductID" json:"product"`
}
