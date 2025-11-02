---@diagnostic disable: undefined-global
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      vim.lsp.config['luals'] = {
        -- Command and arguments to start the server.
        cmd = { 'lua-language-server' },
        -- Filetypes to automatically attach to.
        filetypes = { 'lua' },
        -- Sets the "workspace" to the directory where any of these files is found.
        -- Files that share a root directory will reuse the LSP server connection.
        -- Nested lists indicate equal priority, see |vim.lsp.Config|.
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
        -- Specific settings to send to the server. The schema is server-defined.
        -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            }
          }
        }
      }
      vim.lsp.enable('luals')

      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
    end,
  },
}
