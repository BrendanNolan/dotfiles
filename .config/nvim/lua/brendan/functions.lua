MasonHasBeenSetUp = false

function SetupMasonIfNotAlreadyDone()
    if MasonHasBeenSetUp then
        return
    end
    require('mason').setup()

    require('mason-lspconfig').setup({
        ensure_installed = {
            'bashls',
            'clangd',
            -- 'jedi_language_server', Not working for some reason
            'lua_ls',
        }
    })

    -- Do not move this to dap.lua - it must run after setting up Mason. --
    require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" }
    })

    MasonHasBeenSetUp = true
end

local get_codelldb_extension_path = function()
    return vim.fn.expand("$MASON/packages/codelldb") .. "/extension/"
end

function GetCodelldbPath()
    local extension_path = get_codelldb_extension_path()
    return extension_path .. "adapter/codelldb"
end

function GetLiblldbPath()
    local extension_path = get_codelldb_extension_path()
    return extension_path .. 'lldb/lib/liblldb.dylib'
end
