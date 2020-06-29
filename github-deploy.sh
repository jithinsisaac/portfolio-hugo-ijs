	#!/bin/sh
	
	# If a command fails then the deploy stops
	set -e

	#COMMITING & PUBLISHING TO Portfolio MAIN PROJECT REPOSITORY
	printf "\033[0;32mDeploying updates to Portfolio main project repository...\033[0m\n"
	# Add changes to git.
	git add .
	
	# Commit changes.
	msg="Main Hugo project files commit $(date)"	
	if [ -n "$*" ]; then
		msg="$*"
	fi
	git commit -m "$msg"
	
	# Push source and build repos.
	git push origin master



	#COMMITING & PUBLISHING TO Portfolio MAIN Website REPOSITORY
	printf "\033[0;32mDeploying updates to Portfolio Website...\033[0m\n"
	# Build the project.
	hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
	
	# Go To Public folder
	cd public
	
	# Add changes to git.
	git add .
	
	# Commit changes.
	msg="Rebuilding site $(date)"

	if [ -n "$*" ]; then
		msg="$*"
	fi
	git commit -m "$msg"
	
	# Push source and build repos.
	git push origin master
