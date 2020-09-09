package helloworld

import (
	"fmt"
	"net/http"
)

// HelloHTTP is an HTTP cloud function
func HelloHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello World! I'm a Cloud Function!")
}
