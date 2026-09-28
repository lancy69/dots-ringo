if [[ ! -d "/Applications/Hammerspoon.app/" ]]; then
	warn "Hammerspoon: app not exist, skipping plugin..."
	return 0
fi

# Set config dir for Hammerspoon.
if ! defaults read "org.hammerspoon.Hammerspoon" "MJConfigFile" &> /dev/null; then
	defaults write "org.hammerspoon.Hammerspoon" "MJConfigFile" "$XDG_CONFIG_HOME/hammerspoon/init.lua"
fi
