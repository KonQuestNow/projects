package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "https://accounts.spotify.com/api/token"

	req, _ := http.NewRequest("POST", url, nil)

	req.Header.Add("authorization", "Basic {{client_credentials}}")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}