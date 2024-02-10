extends Control



func _on_btn_run_pressed():
	$HSplitContainer/TabContainer.current_tab = 1


func _on_btn_reset_pressed():
	$HSplitContainer/ColorRect2/Code.clear()
