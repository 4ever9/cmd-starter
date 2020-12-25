package main

import (
	"fmt"
	"os"
	"time"

	"github.com/urfave/cli/v2"
)

func main() {
	app := cli.NewApp()
	app.Name = "Starter"
	app.Usage = "A command line tool."
	app.Compiled = time.Now()

	app.Commands = []*cli.Command{
		getVersionCMD(),
	}

	err := app.Run(os.Args)
	if err != nil {
		fmt.Println(err)
	}
}
