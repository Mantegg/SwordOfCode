extends Node

@export var URL = "https://official-joke-api.appspot.com/random_joke"

func _on_button_button_down():
	$HTTPRequest.cancel_request()
	$HTTPRequest.request(URL)
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	var output = body.get_string_from_utf8()
	print(output)
	$HTTPRequest.cancel_request()
	pass
