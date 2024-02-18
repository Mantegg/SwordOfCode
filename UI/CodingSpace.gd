extends Control

@onready var lblOutput = $HSplitContainer/TabContainer/Output/VBoxContainer/lblOutput

func executeJavaCode(playerCode: String):
	var tempDir = DirAccess.make_dir_absolute("user://levels/world1")
	
	

func _on_btn_run_pressed():
	var javaCode = $HSplitContainer/ColorRect2/Code.text
	
	executeJavaCode(javaCode)
	
	$HSplitContainer/TabContainer.current_tab = 1

func _on_btn_reset_pressed():
	$HSplitContainer/ColorRect2/Code.clear()

#func execute_player_java_code(player_code: String) -> String:
	## Create a temporary directory to store the player's Java file
	#var temp_dir = DirAccess.current_directory.get_child_directory("player_java_temp")
	#temp_dir.make_dir()
#
	## Create a unique filename for the player's Java file
	#var java_file_name = "PlayerJavaCode.java"
	#var java_file_path = temp_dir.get_file(java_file_name)
#
	## Write the player's code to the Java file
	#var file = File.new()
	#file.open(java_file_path, File.WRITE)
	#file.store_string(player_code)
	#file.close()
#
	## Compile the Java file using the javac compiler
	#var javac_command = "javac " + java_file_path
	#OS.shell_exec(javac_command)
#
	## If the Java file failed to compile, delete the temporary directory and return an error message
	#if not File.exists(java_file_path.replace(".java", ".class")):
		#temp_dir.remove_dir()
		#return "Java code failed to compile."
#
	## Execute the Java code using the java interpreter
	#var java_command = "java " + java_file_name.replace(".java", "")
	#var output = OS.shell_exec(java_command, temp_dir.get_path())
#
	## Delete the temporary directory
	#temp_dir.remove_dir()
#
	## Return the output of the Java code
	#return output.get_output()
