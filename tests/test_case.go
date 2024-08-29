package tests

import (
	"github.com/goravel/framework/testing"

	"Hackathon/bootstrap"
)

func init() {
	bootstrap.Boot()
}

type TestCase struct {
	testing.TestCase
}
