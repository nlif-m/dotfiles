# PATHs to apps dirs
P-nvim=~/.config/nvim
P-vim=~/.vimrc
P-zsh=~/.config/zsh
P-x11=~/.config/x11
P-xmonad=~/.xmonad
P-xmobar=~/.config/.xmobar
P-zprofile=~/.config/shell
P-local-bin=~/.local/bin
P-gitconfig=~/.gitconfig
P-dotfiles=~/.config/dotfiles
# programs from dotfile/.local/.bin to install to ~/.local/.bin
APP_LIST= remaps passmenu_otp  booksplit tag

DEV_NULL=2>/dev/null



.PHONY: all local bin  nvim vimrc zshrc x11 xprofile xinitrc zprofile xmonad xmobar xmonadMarkdown gitconfig 
all: local config xmonad gitconfig
# Start of local
local: bin

bin: 
	$(foreach app,$(APP_LIST), mkdir -p $(P-local-bin) $(DEV_NULL); rm -f $(P-local-bin)/"$(app)" $(DEV_NULL); ln -s $(P-dotfiles)/.local/bin/"$(app)" $(P-local-bin)/"$(app)";)

# End of local

# Start of config
config: nvim zshrc x11 zprofile

nvim: 
	mkdir -p $(P-nvim) $(DEV_NULL); 
	rm -f $(P-nvim)/init.vim $(DEV_NULL); 
	ln -s $(P-dotfiles)/.config/nvim/init.vim $(P-nvim)/init.vim $(DEV_NULL);

vimrc: 
	mkdir -p $(P-vim) $(DEV_NULL); 
	rm -f $(P-vim)/.vimrc $(DEV_NULL); 
	ln -s $(P-dotfiles)/.vimrc $(P-vim)/.vimrc  $(DEV_NULL);

zshrc:
	mkdir -p $(P-zsh) $(DEV_NULL); 
	rm -f $(P-zsh)/.zshrc $(DEV_NULL); 
	ln -s $(P-dotfiles)/.config/zsh/.zshrc $(P-zsh)/.zshrc $(DEV_NULL);

x11: xinitrc xprofile

xprofile:
	mkdir -p $(P-x11) $(DEV_NULL)
	rm -f $(P-x11)/"$@" $(DEV_NULL)
	ln -s $(P-dotfiles)/.config/x11/"$@" $(P-x11)/"$@" $(DEV_NULL)

xinitrc:
	mkdir -p $(P-x11) $(DEV_NULL); 
	rm -f $(P-x11)/.xinitrc $(DEV_NULL);
	ln -s $(P-dotfiles)/.config/x11/.xinitrc $(P-x11)/.xinitrc $(DEV_NULL);


zprofile:
	mkdir -p $(P-zprofile) $(DEV_NULL); 
	rm -f ~/.zprofile $(DEV_NULL);
	ln -s $(P-dotfiles)/profile ~/.zprofile $(DEV_NULL);
# End of config

# Start of Xmonad
xmonad: xmobar xmonadMarkdown
	mkdir -p $(P-xmonad) $(DEV_NULL)
	rm -f $(P-xmonad)/xmonad.hs $(DEV_NULL)
	ln -s $(P-dotfiles)/.xmonad/xmonad.hs $(P-xmonad)/xmonad.hs 

xmobar:
	mkdir -p $(P-xmobar) $(DEV_NULL)
	rm -f $(P-xmobar)/xmobarrc0 $(P-xmobar)/xmobarrc1 $(DEV_NULL)
	ln -s $(P-dotfiles)/.config/xmobar/xmobarrc0 $(P-xmobar)/xmobarrc0
	ln -s $(P-dotfiles)/.config/xmobar/xmobarrc1 $(P-xmobar)/xmobarrc1

xmonadMarkdown:
	mkdir -p $(P-xmonad) $(DEV_NULL)
	rm -f $(P-xmonad)/xmonad.md $(DEV_NULL)
	ln -s $(P-dotfiles)/.xmonad/xmonad.md $(P-xmonad)/xmonad.md
# End of Xmonad

gitconfig:
	rm -f $(P-gitconfig) $(DEV_NULL)
	ln -s $(P-dotfiles)/.gitconfig $(P-gitconfig)
