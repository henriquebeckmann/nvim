local ok_mason, mason = pcall(require, "mason")
local ok_mason_lsp_cfg, mason_lsp_cfg = pcall(require, "mason-lspconfig")

if not ok_mason and ok_mason_lsp_cfg then
    return
end

mason.setup()
mason_lsp_cfg.setup()

local navic = require("nvim-navic")


require'lspconfig'.tsserver.setup{
    on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
    end
}

mason_lsp_cfg.setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end
        }
    end
}
