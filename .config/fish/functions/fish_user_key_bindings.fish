function fish_user_key_bindings
    fish_default_key_bindings
    # \ex means Alt-X
    bind \ed 'tmux_go dotfiles'
    bind \es 'tmux_go scripts'
    bind \eo 'tmux_go obsidian'
    bind \em 'tmux_go misc'
    bind \ea tmux_go_5
end
