if command -q zoxide
    zoxide init --cmd cd fish | source
end

if command -q fzf
    fzf --fish | source
end

if command -q atuin
    # atuin init fish --disable-ctrl-r | source # ctrl-r is for fzf fish history, and I want to keep it that way
end

if command -q starship
    starship init fish | source
end
