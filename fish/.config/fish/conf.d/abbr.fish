# youtube-dl
abbr -a -g yta "yt-dlp -x -f bestaudio/best -o '%(title)s.%(ext)s'"
abbr -a -g ytpo "yt-dlp --embed-subs --sub-langs "en,ru" -f 'best[height<=729]' -o '%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s'"
# Git 
abbr -a -g gis "git status"
abbr -a -g gia "git add"
abbr -a -g gic "git commit -v"
abbr -a -g gid "git diff"
abbr -a -g gil "git log -p"
abbr -a -g gip "git push"
# Various
abbr -a -g sp "sudo pacman"
abbr -a -g p "python"
abbr -a -g startx "startx $HOME/.config/x11/xinitrc.fish"
abbr -a -g se "sudoedit"
abbr -a -g sleep "slock loginctl suspend -i"
