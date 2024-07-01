package main

import (
	"log"

	"github.com/natrongmbh/next-pocket/pkg/env"
	"github.com/natrongmbh/next-pocket/pkg/server"
)

func init() {
	err := env.Init()
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	server := server.Setup()

	// start the pocketbase server
	if err := server.Start(); err != nil {
		log.Fatal(err)
	}
}
