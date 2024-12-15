package routes

import (
	"RedisRateLimiter/controller"
	"database/sql"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine, db *sql.DB) {
	router.GET("/health", controller.HealthCheck())
	router.GET("/users", controller.GetUsers(db))
	router.GET("/users/:id", controller.GetUserById(db))
	router.POST("/users", controller.CreateUser(db))
	router.PUT("/users/:id", controller.UpdateUser(db))
	router.DELETE("/users/:id", controller.DeleteUser(db))
}
