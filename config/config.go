package config

import (
	"fmt"
	"log"
	"online-store/models"
	"os"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func ConnectDB() {
	dbName := os.Getenv("DB_NAME")
	conn_url := fmt.Sprintf("user=%s password=%s host=%s port=%s sslmode=disable",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASSWORD"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
	)
	conn_db_url := fmt.Sprintf("%s dbname=%s", conn_url, dbName)
	DB, _ = gorm.Open(postgres.Open(conn_db_url), &gorm.Config{})
	count := 0
	DB.Raw("SELECT count(*) FROM pg_database WHERE datname = ?", dbName).Scan(&count)
	if count == 0 {
		sql := fmt.Sprintf("CREATE DATABASE %s", dbName)
		result := DB.Exec(sql)
		if result.Error != nil {
			log.Fatal(result.Error)
		}
	}

	DB, err := gorm.Open(postgres.Open(conn_db_url), &gorm.Config{})
	if err != nil {
		log.Fatal("Failed to connect to the database")
	}

	err = DB.AutoMigrate(&models.User{}, &models.Product{}, &models.Cart{}, &models.Order{}, &models.OrderItem{})
	if err != nil {
		log.Fatal("Failed to migrate database:", err)
	}

	log.Println("Database migrated successfully")
}
