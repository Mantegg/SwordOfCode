extends Control

@onready var lblOutput = $HSplitContainer/TabContainer/Output/VBoxContainer/lblOutput
var token
var test
@onready var parallax = $VBoxContainer/ParallaxBackground
var speed = 250
var rotationSpeed = 0.3
var direction = Vector2(-1,1)

#move background
func _process(delta):
	parallax.scroll_offset += direction * speed * delta

func _on_btn_run_pressed():
	print("post input")
	var javaCode = $HSplitContainer/ColorRect2/Code.text
	var encodedJavaCode = Marshalls.utf8_to_base64(javaCode)
	#print(javaCode)
	#print(encodedJavaCode)
	$HTTPRequestInput.cancel_request()
	$HTTPRequestInput.request("http://localhost/SwordOfCode/createSubmission.php?sourceCode=" + encodedJavaCode)
	$HSplitContainer/TabContainer.current_tab = 1

func _on_btn_reset_pressed():
	$HSplitContainer/ColorRect2/Code.clear()

func _on_http_request_input_request_completed(result, response_code, headers, body):
	print("wait output")
	var output = JSON.parse_string(body.get_string_from_utf8())
	token = output["token"]
	print(token)
	$HTTPRequestInput.cancel_request()
	$Timer.start()

func _on_timer_timeout():
	print("request output")
	$HTTPRequestOutput.request("http://localhost/SwordOfCode/getSubmission.php?token="+token)

func _on_http_request_output_request_completed(result, response_code, headers, body):
	print("get output")
	var output = JSON.parse_string(body.get_string_from_utf8())

	var outputStr
	if output["stdout"]:
		outputStr = Marshalls.base64_to_utf8(output["stdout"])
		$Window.visible = true
		lblOutput.text = outputStr
	elif output["compile_output"]:
		outputStr = Marshalls.base64_to_utf8(output["compile_output"])
		lblOutput.text = outputStr
	else:
		pass
		
	$HTTPRequestOutput.cancel_request()


func _on_btn_hint_pressed():
	var hint = $HSplitContainer/TabContainer/Question/VBoxContainer2/Control/Hint
	if hint.visible == true:
		hint.visible = false
	else:
		hint.visible = true


func _on_btn_back_pressed():
	get_tree().change_scene_to_file("res://UI/documentation.tscn")

func _on_window_close_requested():
	$Window.visible = false
