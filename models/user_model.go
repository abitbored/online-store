package models

import "gorm.io/gorm"

type User struct {
	gorm.Model
	Name     string `json:"name"`
	Email    string `json:"email"`
	Username string `gorm:"unique;not null" json:"username"`
	Password string `json:"password"`
}
