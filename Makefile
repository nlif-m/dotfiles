DEV_NULL=2>/dev/null
PATH_NVIM_INIT=~/.config/nvim/init.vim
PATH_ZSHRC=~/.zshrc
PATH_XINITRC=~/.xinitrc





all: nvim zshrc xinitrc

nvim: nvim_directory
	rm $(PATH_NVIM_INIT) $(DEV_NULL) ; ln init.vim $(PATH_NVIM_INIT) $(DEV_NULL)

nvim_directory:
	mkdir -p '~/.config/nvim' $(DEV_NULL)

zshrc:
	rm $(PATH_ZSHRC) $(DEV_NULL) ; ln .zshrc $(PATH_ZSHRC) $(DEV_NULL)

xinitrc:
	rm $(PATH_XINITRC) $(DEV_NULL) ; ln .xinitrc $(PATH_XINITRC) $(DEV_NULL)



