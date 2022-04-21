function lsofpg
    sudo lsof -P -i -n | grep LISTEN
end
