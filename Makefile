DEV_NULL=2>/dev/null
PATH_NVIM_INIT=~/.config/nvim/init.vim
PATH_ZSHRC=~/.zshrc
PATH_XINITRC=~/.xinitrc
P-dotfiles=~/code/dotfiles





all: nvim zshrc xinitrc

nvim: 
	mkdir -p ~/.config/nvim $(DEV_NULL); 
	rm $(PATH_NVIM_INIT) $(DEV_NULL); 
	ln $(P-dotfiles)/init.vim $(PATH_NVIM_INIT) $(DEV_NULL);

zshrc:
	rm $(PATH_ZSHRC) $(DEV_NULL) ; ln $(P-dotfiles)/.zshrc $(PATH_ZSHRC) $(DEV_NULL)

xinitrc:
	rm $(PATH_XINITRC) $(DEV_NULL) ; ln $(P-dotfiles)/.xinitrc $(PATH_XINITRC) $(DEV_NULL)



