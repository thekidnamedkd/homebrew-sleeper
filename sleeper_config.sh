#!/bin/bash

echo "Configuring Sleeper..."

# Ask for idle time
read -p "Enter the desired idle time in seconds (default 900): " idle_time
idle_time=${idle_time:-900}

# Ask for a custom username for the label
read -p "Enter a custom username for the label (default 'user'): " custom_username
custom_username=${custom_username:-user}

# Define the path to the plist file in the Homebrew cellar
plist_cellar_path="$(brew --prefix sleeper)/libexec/sleeper_launch.plist"

# Check if the plist file exists in the cellar
if [ ! -f "$plist_cellar_path" ]; then
    echo "Error: plist file not found at $plist_cellar_path"
    exit 1
fi

# Update the idle time in the plist file
/usr/libexec/PlistBuddy -c "Set :EnvironmentVariables:IDLE_TIME $idle_time" "$plist_cellar_path"
echo "Updated idle time in plist to $idle_time seconds."

# Update the label in the plist file
label="com.$custom_username.sleeper"
/usr/libexec/PlistBuddy -c "Set :Label $label" "$plist_cellar_path"
echo "Updated label in plist to $label."

# Link the plist file to the user's LaunchAgents directory
launch_agents_dir="$HOME/Library/LaunchAgents"
mkdir -p "$launch_agents_dir"
ln -sfv "$plist_cellar_path" "$launch_agents_dir/$label.plist"

echo "Linking plist to $launch_agents_dir"
echo "Sleeper configuration complete. Please run 'launchctl load -w ~/Library/LaunchAgents/$label.plist' to start the service."
