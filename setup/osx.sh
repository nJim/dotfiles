#!/bin/bash

# Setup machine to match preferred settings.
# See for inspiration: http://mths.be/osx
# and https://github.com/sapegin/dotfiles/blob/master/setup/osx.sh

COMPUTERNAME='JimVomero'
LOCALHOSTNAME='jimvomero'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this file has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# MAC OS Settings and UI                                                      #
###############################################################################

# Set computer name (as done via System Preferences → Sharing.)
sudo scutil --set ComputerName $COMPUTERNAME
sudo scutil --set HostName $COMPUTERNAME
sudo scutil --set LocalHostName $LOCALHOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $LOCALHOSTNAME

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Quit When Finished Printing removing it from the dock.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool YES

# Disable the crash reporter.
defaults write com.apple.CrashReporter DialogType -string "none"

# Disable the “Are you sure you want to open this application?” dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Check for software updates daily, not just once per week.
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Turn off keyboard illumination when computer is not used for 5 minutes.
defaults write com.apple.BezelServices kDimTime -int 300

# Set the timezone; see `systemsetup -listtimezones` for other values.
systemsetup -settimezone "America/New_York" > /dev/null

# Increase grid spacing for icons on the desktop and in other icon views.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 40" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 40" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 40" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 40" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 40" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 40" ~/Library/Preferences/com.apple.finder.plist

# Reveal IP address, hostname, OS version when clicking the clock in the login window.
# Revert: defaults delete /Library/Preferences/com.apple.loginwindow AdminHostInfo
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable Resume system-wide.
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
# Disable automatic termination of inactive apps.
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Restart automatically if the computer freezes.
# systemsetup -setrestartfreeze on
# Never go into computer sleep mode.
# systemsetup -setcomputersleep Off > /dev/null

###############################################################################
# Trackpad                                                                    #
###############################################################################

# Disable "natural" scrolling.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Tap to click for this user and for the login screen.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Tracking Speed (From 0 Slow to 3 Fast.)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5

# Increase sound quality for Bluetooth headphones/headsets.
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Use scroll gesture with the Ctrl (^) modifier key to zoom.
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

###############################################################################
# Dock & hot corners                                                          #
###############################################################################

# Set the icon size of Dock items to 60 pixels
defaults write com.apple.dock tilesize -int 30

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Speed up animation speed of hiding Dock.
defaults write com.apple.dock autohide-delay -float 0

# Hot corners
# Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Desktop
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: hide path bar
defaults write com.apple.finder ShowPathbar -boolean false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

###############################################################################
# Screenshots Tool                                                            #
###############################################################################

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Power                                                                       #
###############################################################################

# Battery: Computer sleep: 10 min
sudo pmset -b sleep 10

# Battery: Display sleep: 5 min
sudo pmset -b displaysleep 5

# Battery: Put the hard disk(s) to sleep when possible: 10 min
sudo pmset -b disksleep 10

# Battery: Slightly dim the display when using this power source
sudo pmset -b lessbright 1

# Battery: Automatically reduce brightness before display goes to sleep
sudo pmset -b halfdim 1

# Power Adapter: Computer sleep: 30 min
sudo pmset -c sleep 30

# Power Adapter: Display sleep: 10 min
sudo mset -c displaysleep 10

# Power Adapter: Put the hard disk(s) to sleep when possible: 10 min
sudo pmset -c disksleep 10

# Power Adapter: Wake for network access
sudo pmset -c womp 0

# Power Adapter: Automatically reduce brightness before display goes to sleep
sudo pmset -c halfdim 1

# Power Adapter: Start up automatically after a power failure
sudo pmset -c autorestart 1

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Terminal                                                                    #
###############################################################################

# Looking for a good set of settings and themes to apply to default terminal.

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dashboard" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" \
  "Terminal" "iTunes" "NotificationCenter"; do
	killall "$app" > /dev/null 2>&1
done
echo "Done. Some of these changes require a logout/restart to take effect."
