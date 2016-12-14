package main

import (
	"fmt"
	"net/http"
)

// Version of the app/image
var Version = "local"

func loveHandler(w http.ResponseWriter, r *http.Request) {

	what := r.URL.Path[1:]
	if what == "" {
		what = "cats"
	}

	fmt.Fprintf(w, "I love %s!", what)
}

func aboutHandler(w http.ResponseWriter, r *http.Request) {

	fmt.Fprintf(w, "Version: %s", Version)
}

func healthHandler(w http.ResponseWriter, r *http.Request) {

	fmt.Fprintf(w, "UP")
}

func main() {
	http.HandleFunc("/", loveHandler)
	http.HandleFunc("/about", aboutHandler)
	http.HandleFunc("/health", healthHandler)
	http.ListenAndServe(":8080", nil)
}
