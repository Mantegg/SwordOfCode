extends Control

@onready var lblOutput = $HSplitContainer/TabContainer/Output/VBoxContainer/lblOutput
var token

func _on_btn_run_pressed():
	var javaCode = $HSplitContainer/ColorRect2/Code.text
	var encodedJavaCode = Marshalls.utf8_to_base64(javaCode)
	#print(javaCode)
	#print(encodedJavaCode)
	$HTTPRequestInput.cancel_request()
	$HTTPRequestInput.request("http://localhost/SwordOfCode/createSubmission.php?sourceCode=" + encodedJavaCode)
	
	$HSplitContainer/TabContainer.current_tab = 1

func _on_btn_reset_pressed():
	$HSplitContainer/ColorRect2/Code.clear()

func _on_http_request_request_completed(result, response_code, headers, body):
	var output = JSON.parse_string(body.get_string_from_utf8())
	token = output["token"]
	#print(token)
	$Timer.start()
	$HTTPRequestInput.cancel_request()

func _on_http_request_output_request_completed(result, response_code, headers, body):
	var output = JSON.parse_string(body.get_string_from_utf8())
	var outputStr = Marshalls.base64_to_utf8(output["stdout"])
	lblOutput.text = outputStr
	$HTTPRequestOutput.cancel_request()

func _on_timer_timeout():
	$HTTPRequestOutput.cancel_request()
	$HTTPRequestOutput.request("http://localhost/SwordOfCode/getSubmission.php?token="+token)
	#$HTTPRequestOutput.request("http://localhost/SwordOfCode/getSubmission.php?token=70d368a2-542c-4b76-b239-536ada6c7221")
	
	
