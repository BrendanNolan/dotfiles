# Stop fish from any path shenanigans like reordering the path to put system paths first
set -gx PATH $PATH

if status is-interactive
    set -gx fish_greeting
    set -gx fish_color_command ebde34 # Set the color of text that I type on the command line
    set -gx fifc_editor nvim

    source $__fish_config_dir/alias_abbr.fish
    source $__fish_config_dir/shell_integrations.fish

    if not functions -q fisher
        echo "Installing fisher ..."
        set -l fisher_file (mktemp)
        set -l fisher_url \
            https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
        if curl -sL $fisher_url > $fisher_file
            source $fisher_file && fisher install jorgebucaran/fisher
        end
        if not functions -q fisher
            echo "Failed to install fisher"
        end
        rm -f $fisher_file
    end

    if functions -q fisher
        if not contains gazorby/fifc (fisher list)
            echo "Installing gazorby/fifc ..."
            if not fisher install gazorby/fifc
                echo "Failed to install gazorby/fifc"
            end
        end
    end

    fish_vi_key_bindings

    bind --user -M insert \ck up-or-search
    bind --user -M insert \cj down-or-search
end

