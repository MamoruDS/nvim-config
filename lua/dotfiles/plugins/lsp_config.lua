local M = {}

local lspconfig = require("lspconfig")

local config = require("dotfiles.config").config
local utils = require("dotfiles.utils")

function M.on_attach(client, bufnr)
  if client.server_capabilities.documentHighLightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      pattern = "*",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      pattern = "*",
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

M.lsp_configs = {
  bashls = {
    config = {
      on_attach = M.on_attach,
    },
    setup = lspconfig.bashls.setup,
  },

  biome = {
    config = {
      on_attach = M.on_attach,
      single_file_support = true,
    },
    setup = lspconfig.biome.setup,
  },

  jsonls = {
    config = {
      on_attach = M.on_attach,
    },
    setup = lspconfig.jsonls.setup,
  },

  lua_ls = {
    config = {
      on_attach = M.on_attach,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = { Lua = {} },
    },
    setup = lspconfig.lua_ls.setup,
  },

  nixd = {
    config = {
      on_attach = M.on_attach,
      settings = {
        nixd = {
          nixpkgs = { expr = "import <nixpkgs> { }" },
          options = {
            -- nixos = {
            --   expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.foo.options',
            -- },
            -- home_manager = {
            --   expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."foo@bar".options',
            -- },
          },
        },
      },
    },
    setup = lspconfig.nixd.setup,
  },

  prismals = {
    config = {
      on_attach = M.on_attach,
    },
    setup = lspconfig.prismals.setup,
  },

  pyright = {
    config = {
      on_attach = M.on_attach,
      settings = {
        pyright = {
          autoImportCompletion = true,
          disableTaggedHints = false,
        },
        python = {
          analysis = {
            autoSearchPaths = true,
            -- diagnosticMode = "openFilesOnly",
            typeCheckingMode = "basic",
            useLibraryCodeForTypes = true,
          },
        },
      },
    },
    setup = lspconfig.pyright.setup,
  },

  ruff = {
    config = {
      init_options = {
        settings = {},
      },
      on_attach = M.on_attach,
    },
    setup = lspconfig.ruff.setup,
  },

  taplo = {
    config = {
      on_attach = M.on_attach,
    },
    setup = lspconfig.taplo.setup,
  },

  ts_ls = {
    config = {
      on_attach = M.on_attach,
    },
    setup = lspconfig.ts_ls.setup,
  },
}

  client.setup(client.config)
for name, client in pairs(utils.merge_tables(M.lsp_configs, config.lsp_clients)) do
end
