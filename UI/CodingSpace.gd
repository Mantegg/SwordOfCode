extends Control

@onready var lblOutput = $HSplitContainer/TabContainer/Output/VBoxContainer/lblOutput

func _on_btn_run_pressed():
	var javaCode = $HSplitContainer/ColorRect2/Code.text
	var encodedJavaCode = javaCode.uri_encode()
	#print(encodedJavaCode)
	
	$HTTPRequestInput.cancel_request()
	$HTTPRequestInput.request("http://localhost/SwordOfCode/createSubmission.php?sourceCode=" + javaCode+ "")
	
	
	$HSplitContainer/TabContainer.current_tab = 1

func _on_btn_reset_pressed():
	$HSplitContainer/ColorRect2/Code.clear()

func _on_http_request_request_completed(result, response_code, headers, body):
	var output = JSON.parse_string(body.get_string_from_utf8())

	$HTTPRequestOutput.cancel_request()
	$HTTPRequestOutput.request("http://localhost/SwordOfCode/getSubmission.php?token="+output["token"])
	
	$HTTPRequestInput.cancel_request()

func _on_http_request_output_request_completed(result, response_code, headers, body):
	var output = JSON.parse_string(body.get_string_from_utf8())
	print(output["source_code"])
	
	$HTTPRequestOutput.cancel_request()
