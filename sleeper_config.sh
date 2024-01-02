echo "Configuring Sleeper..."

read -p "Enter the desired idle time in seconds (default 900): " idle_time
idle_time=${idle_time:-900}

read -p "Enter a custom username for the label (default 'user'): " custom_username
custom_username=${custom_username:-user}

plist_cellar_path="$(brew --prefix sleeper)/libexec/sleeper_launch.plist"

sleeper_loop_path="$(brew --prefix sleeper)/bin/sleeper_loop.sh"

if [ ! -f "$plist_cellar_path" ]; then
    echo "Error: plist file not found at $plist_cellar_path"
    exit 1
fi

/usr/libexec/PlistBuddy -c "Set :ProgramArguments:0 $sleeper_loop_path" "$plist_cellar_path"
echo "Updated path in plist to $sleeper_loop_path."

/usr/libexec/PlistBuddy -c "Set :EnvironmentVariables:IDLE_TIME $idle_time" "$plist_cellar_path"
echo "Updated idle time in plist to $idle_time seconds."

label="com.$custom_username.sleeper"
/usr/libexec/PlistBuddy -c "Set :Label $label" "$plist_cellar_path"
echo "Updated label in plist to $label."

launch_agents_dir="$HOME/Library/LaunchAgents"
mkdir -p "$launch_agents_dir"
ln -sfv "$plist_cellar_path" "$launch_agents_dir/$label.plist"

echo "Linking plist to $launch_agents_dir"
echo "Sleeper configuration complete. Please run 'launchctl load -w ~/Library/LaunchAgents/$label.plist' to start the service."
