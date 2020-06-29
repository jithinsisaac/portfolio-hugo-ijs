	#!/bin/sh
	
	# If a command fails then the deploy stops
	set -e

	#COMMITING & PUBLISHING TO Portfolio MAIN PROJECT REPOSITORY
	printf "\033[0;32mDeploying updates to Local Portfolio main project repository...\033[0m\n"
	# Add changes to git.
	git add .
	
	# Commit changes.
	msg="Main Hugo project files commit $(date)"	
	if [ -n "$*" ]; then
		msg="$*"
	fi
	git commit -m "$msg"
	