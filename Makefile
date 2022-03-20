available_apps=git i3wm profile scripts stow tmux vim x11 rofi fish
disabled_apps= brave-tor nvim zsh bash
stow:
	stow stow

install: stow
	$(foreach app,$(available_apps), stow $(app);)

uninstall: 
	$(foreach app,$(available_apps), stow -D $(app) stow;)


.phony: install stow uninstall


