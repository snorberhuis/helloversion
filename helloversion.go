package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

var version string

type Version struct {
	Version string
}

func helloHandler(w http.ResponseWriter, _ *http.Request) {
	response := Version{
		Version:version,
	}

	formattedResponse, err := json.Marshal(response)
	if err != nil {
		fmt.Println(err)
	}

	_, err = fmt.Fprintln(w, string(formattedResponse))
	if err != nil {
		fmt.Println(err)
	}
}

func main() {
	http.HandleFunc("/", helloHandler)

	fmt.Println("Started, serving at 8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		panic("ListenAndServe: " + err.Error())
	}
}
