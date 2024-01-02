#!/bin/bash

# Self-modify to ensure this script has execute permissions
if [ ! -x "$(command -v "$0")" ]; then
    echo "Setting execute permissions for this script..."
    chmod +x "$0"
    exec "$0" "$@"
fi

echo "Configuring Sleeper..."

# Ask for idle time
read -p "Enter the desired idle time in seconds (default 900): " idle_time
idle_time=${idle_time:-900}

# Ask for a custom username for the label
read -p "Enter a custom username for the label (default 'user'): " custom_username
custom_username=${custom_username:-user}

# Define the path to the plist file in the Homebrew cellar
plist_cellar_path="$(brew --prefix sleeper)/libexec/sleeper_launch.plist"

# Define the path to the sleeper_loop.sh script
sleeper_loop_path="$(brew --prefix sleeper)/bin/sleeper_loop.sh"

# Check if the plist file exists in the cellar
if [ ! -f "$plist_cellar_path" ]; then
    echo "Error: plist file not found at $plist_cellar_path"
    exit 1
fi

echo "Updating the script path in plist..."
/usr/libexec/PlistBuddy -c "Set :ProgramArguments:0 $sleeper_loop_path" "$plist_cellar_path"
echo "Path in plist updated to $sleeper_loop_path."

echo "Setting execute permissions for sleeper_loop.sh..."
chmod +x "$sleeper_loop_path"
echo "Execute permissions set for sleeper_loop.sh."

echo "Updating the idle time in plist..."
/usr/libexec/PlistBuddy -c "Set :EnvironmentVariables:IDLE_TIME $idle_time" "$plist_cellar_path"
echo "Idle time in plist updated to $idle_time seconds."

echo "Updating the label in plist..."
label="com.$custom_username.sleeper"
/usr/libexec/PlistBuddy -c "Set :Label $label" "$plist_cellar_path"
echo "Label in plist updated to $label."

echo "Linking plist to the LaunchAgents directory..."
launch_agents_dir="$HOME/Library/LaunchAgents"
mkdir -p "$launch_agents_dir"
ln -sfv "$plist_cellar_path" "$launch_agents_dir/$label.plist"
echo "Plist linked to $launch_agents_dir"

echo "Sleeper configuration complete. Please run 'launchctl load -w ~/Library/LaunchAgents/$label.plist' to start the service."
