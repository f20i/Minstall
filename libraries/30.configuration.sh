#!/bin/bash
# Configuration Parsing

# INI Variable Tester
read_variable() {
	# Check If Variable Exists
	if [[ $(eval "echo \${INI__$1}") = "" ]]; then
		# Echo False
		echo 0
	else
		# Echo Variable
		eval "echo \${INI__$1}"
	fi
}

# INI Variable Tester (Module)
read_variable_module() {
	# If Unattended Mode, Check Variables
	if [ $UNATTENDED = 1 ]; then
		# Check If Variable Exists
		if [[ $(eval "echo \${INI__$(safe_string $MODULE)__$1}") = "" ]]; then
			# Echo False
			echo 0
		else
			# Echo Variable
			eval "echo \${INI__$(safe_string $MODULE)__$1}"
		fi
	else
		# Return False
		echo 0
	fi
}

# INI Variable Tester (Module Variable)
read_variable_module_variable() {
	# Check If Variable Exists
	if [[ $(eval "echo \${INI__$(safe_string $MODULE)__$1}") = "" ]]; then
		# Echo False
		echo 0
	else
		# Echo Variable
		eval "echo \${INI__$(safe_string $MODULE)__$1}"
	fi
}

# Remove Invalid Characters From Section Names
safe_string() {
	# Replace Dash With Underscore
	echo "$1" | tr - _
}
