package main

import (
	"fmt"
	"github.com/urfave/cli/v2"
	"runtime"
)

var (
	// CurrentCommit current git commit hash
	CurrentCommit = ""
	// CurrentBranch current git branch
	CurrentBranch = ""
	// CurrentVersion current project version
	CurrentVersion = "0.0.0"
	// BuildDate compile date
	BuildDate = ""
	// GoVersion system go version
	GoVersion = runtime.Version()
	// Platform info
	Platform = fmt.Sprintf("%s/%s", runtime.GOOS, runtime.GOARCH)
)

func getVersionCMD() *cli.Command {
	return &cli.Command{
		Name:   "version",
		Usage:  "App version",
		Action: printVersion,
	}
}

func printVersion(ctx *cli.Context) error {
	fmt.Printf("App version: %s-%s-%s\n", CurrentVersion, CurrentBranch, CurrentCommit)
	fmt.Printf("App build date: %s\n", BuildDate)
	fmt.Printf("System version: %s\n", Platform)
	fmt.Printf("Golang version: %s\n", GoVersion)

	return nil
}
