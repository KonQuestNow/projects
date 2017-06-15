package main

import (
	"fmt"
	"strings"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "https://api.getpostman.com/environments/{{environment_id}}"

	payload := strings.NewReader("{\n    \"environment\": {\n        \"values\": {{updated_environment}}\n    }\n}")

	req, _ := http.NewRequest("PUT", url, payload)

	req.Header.Add("x-api-key", "{{postman_api_key}}")
	req.Header.Add("content-type", "application/json")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}