if status is-interactive
    set -gx fish_greeting
    set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
    set -gx fifc_editor nvim

    source $__fish_config_dir/alias_abbr.fish
    source $__fish_config_dir/shell_integrations.fish

    if not functions -q fisher
        echo "Installing fisher ..."
        set tmp_file (mktemp)
        if not curl -sL \
            https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
            > tmp_file && source tmp_file && fisher install jorgebucaran/fisher
                rm -f tmp_file
                echo "Could not install fisher, exiting ..." 
                sleep 1
                exit 1
        end
        rm -f tmp_file
    end

    if not contains gazorby/fifc (fisher list)
        echo "Installing gazorby/fifc"
        fisher install gazorby/fifc
    end

    fish_vi_key_bindings

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search
end

