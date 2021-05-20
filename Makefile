# PATHs to apps dirs
P-nvim=~/.config/nvim
P-zsh=~/.config/zsh
P-x11=~/.config/x11
P-xmonad=~/.xmonad
P-xmobar=~/.config/.xmobar
P-zprofile=~/.config/shell/

P-dotfiles=~/.config/dotfiles

DEV_NULL=2>/dev/null



all: nvim zshrc xinitrc zprofile xmonad

nvim: 
	mkdir -p $(P-nvim) $(DEV_NULL); 
	rm -f $(P-nvim)/init.vim $(DEV_NULL); 
	ln -s $(P-dotfiles)/init.vim $(P-nvim)/init.vim $(DEV_NULL);

zshrc:
	mkdir -p $(P-zsh) $(DEV_NULL); 
	rm -f $(P-zsh)/.zshrc $(DEV_NULL); 
	ln -s $(P-dotfiles)/.zshrc $(P-zsh)/.zshrc $(DEV_NULL);

xinitrc:
	mkdir -p $(P-x11) $(DEV_NULL); 
	rm -f $(P-x11)/.xinitrc $(DEV_NULL);
	ln -s $(P-dotfiles)/.xinitrc $(P-x11)/.xinitrc $(DEV_NULL);

zprofile:
	mkdir -p $(P-zprofile) $(DEV_NULL); 
	rm -f ~/.zprofile $(DEV_NULL);
	ln -s $(P-dotfiles)/profile ~/.zprofile $(DEV_NULL);

xmonad: xmobar xmonadMarkdown
	mkdir -p $(P-xmonad) $(DEV_NULL)
	rm -f $(P-xmonad)/xmonad.hs $(DEV_NULL)
	ln -s $(P-dotfiles)/xmonad.hs $(P-xmonad)/xmonad.hs 

xmobar:
	mkdir -p $(P-xmobar) $(DEV_NULL)
	rm -f $(P-xmobar)/xmobarrc0 $(P-xmobar)/xmobarrc1 $(DEV_NULL)
	ln -s $(P-dotfiles)/xmobarrc0 $(P-xmobar)/xmobarrc0
	ln -s $(P-dotfiles)/xmobarrc1 $(P-xmobar)/xmobarrc1

xmonadMarkdown:
	mkdir -p $(P-xmonad) $(DEV_NULL)
	rm -f $(P-xmonad)/xmonad.md $(DEV_NULL)
	ln -s $(P-dotfiles)/xmonad.md $(P-xmonad)/xmonad.md
