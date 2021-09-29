available_apps=git i3wm nvim profile scripts stow tmux vim x11 zsh brave-tor 
stow:
	stow stow

install: stow
	$(foreach app,$(available_apps), stow $(app);)

uninstall: stow
	$(foreach app,$(available_apps), stow -D $(app);)




