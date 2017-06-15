package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
)

func main() {

	url := "https://api.spotify.com/v1/users/{{user_id}}/playlists/{{playlist_id}}/tracks?uris={{uris}}"

	req, _ := http.NewRequest("POST", url, nil)

	req.Header.Add("accept", "application/json")
	req.Header.Add("authorization", "Bearer {{authorization}}")
	req.Header.Add("content-type", "application/json")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)

	fmt.Println(res)
	fmt.Println(string(body))

}