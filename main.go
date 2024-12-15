package main

import (
	"RedisRateLimiter/db"
	"RedisRateLimiter/middleware"
	"RedisRateLimiter/routes"
	"log"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	db.LoadEnv()

	db := db.ConnectPostgres()
	defer db.Close()
	middleware.RedisInit()
	defer middleware.RedisClose()

	router := gin.Default()
	router.Use(middleware.RedisRateLimiter())
	routes.RegisterRoutes(router, db)
	log.Fatal(router.Run(":" + os.Getenv("PORT")))
}
