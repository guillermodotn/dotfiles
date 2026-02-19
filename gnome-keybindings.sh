gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings "switch-to-application-${i}" [] #"['<Super>${i}']"
	gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-${i}" "['<Super>${i}']"
done
