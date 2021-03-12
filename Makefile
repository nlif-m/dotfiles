DEV_NULL=2>/dev/null
P-nvim-init=~/.config/nvim/init.vim
P-zshrc=~/.zshrc
P-xinitrc=~/.xinitrc
P-dotfiles=~/code/dotfiles





all: nvim zshrc xinitrc

nvim: 
	mkdir -p ~/.config/nvim $(DEV_NULL); 
	rm $(P-nvim-init) $(DEV_NULL); 
	ln $(P-dotfiles)/init.vim $(P-nvim-init) $(DEV_NULL);

zshrc:
	rm $(P-zshrc) $(DEV_NULL) ; ln $(P-dotfiles)/.zshrc $(P-zshrc) $(DEV_NULL)

xinitrc:
	rm $(P-xinitrc) $(DEV_NULL) ; ln $(P-dotfiles)/.xinitrc $(P-xinitrc) $(DEV_NULL)



