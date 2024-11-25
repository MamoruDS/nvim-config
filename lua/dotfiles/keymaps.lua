local utils = require("dotfiles.utils")

local keyset = vim.keymap.set
local opts = {
  -- noremap = true,
  silent = true,
  -- expr = true,
  -- replace_keycodes = false,
}

keyset("n", "<leader>tl", "<cmd>LspInfo<CR>", opts)

keyset("n", "<space>e", vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float()" })
keyset("n", "<space>q", vim.diagnostic.setloclist, { desc = "vim.diagnostic.setloclist()" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- `:h vim.lsp.*`
    local opts = { buffer = ev.buf }
    keyset(
      "n",
      "gD",
      vim.lsp.buf.declaration,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.declaration()",
      })
    )
    keyset(
      "n",
      "gd",
      vim.lsp.buf.definition,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.definition()",
      })
    )
    keyset(
      "n",
      "K",
      vim.lsp.buf.hover,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.hover()",
      })
    )
    keyset(
      "n",
      "gi",
      vim.lsp.buf.implementation,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.implementation()",
      })
    )
    keyset(
      "n",
      "<C-k>",
      vim.lsp.buf.signature_help,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.signature_help()",
      })
    )
    -- keyset("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    -- keyset("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    -- keyset("n", "<space>wl", function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    keyset(
      "n",
      "<space>D",
      vim.lsp.buf.type_definition,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.type_definition()",
      })
    )
    keyset(
      "n",
      "<space>rn",
      vim.lsp.buf.rename,
      utils.mergeTables(opts, {
        desc = "()",
      })
    )
    keyset(
      { "n", "v" },
      "<space>ca",
      vim.lsp.buf.code_action,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.code_action()",
      })
    )
    keyset(
      "n",
      "gr",
      vim.lsp.buf.references,
      utils.mergeTables(opts, {
        desc = "vim.lsp.buf.references()",
      })
    )
  end,
})

if vim.fn.exists(":ConformInfo") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tc", "<cmd>ConformInfo<CR>", opts)
end

if vim.fn.exists(":Copilot") ~= 0 then
  opts = {
    noremap = true,
    silent = true,
    expr = true,
    replace_keycodes = false,
  }
  keyset("i", "<C-t>", "copilot#Accept('<CR>')", opts)
end

keyset({ "n", "v" }, "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
keyset({ "n", "v" }, "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)

if vim.fn.exists(":FzfLua") ~= 0 then
  local fzf_lua = require("fzf-lua")
  opts = { silent = true }
  keyset(
    "n",
    "<leader>pb",
    fzf_lua.buffers,
    utils.mergeTables(opts, {
      desc = "fzf-lua.buffers()",
    })
  )
  keyset(
    "n",
    "<leader>pd",
    fzf_lua.diagnostics_document,
    utils.mergeTables(opts, { desc = "fzf-lua.diagnostics_document()" })
  )
  keyset(
    "n",
    "<leader>pf",
    fzf_lua.files,
    utils.mergeTables(opts, {
      desc = "fzf-lua.files()",
    })
  )
  keyset(
    "n",
    "<leader>pgg",
    fzf_lua.grep,
    utils.mergeTables(opts, {
      desc = "fzf-lua.grep()",
    })
  )
  keyset(
    "n",
    "<leader>pgl",
    fzf_lua.git_commits,
    utils.mergeTables(opts, {
      desc = "fzf-lua.git_commits()",
    })
  )
  keyset(
    "n",
    "<leader>pgs",
    fzf_lua.git_status,
    utils.mergeTables(opts, {
      desc = "fzf-lua.git_status()",
    })
  )
  keyset(
    "n",
    "<leader>ph",
    fzf_lua.highlights,
    utils.mergeTables(opts, {
      desc = "fzf-lua.highlights()",
    })
  )
  keyset(
    "n",
    "<leader>pk",
    fzf_lua.keymaps,
    utils.mergeTables(opts, {
      desc = "fzf-lua.keymaps()",
    })
  )
  keyset(
    "n",
    "<leader>pm",
    fzf_lua.help_tags,
    utils.mergeTables(opts, {
      desc = "fzf-lua.help_tags()",
    })
  )
  -- TODO: noice history
  keyset(
    "n",
    "<leader>pp",
    fzf_lua.commands,
    utils.mergeTables(opts, {
      desc = "fzf-lua.commands()",
    })
  )
  keyset(
    "n",
    "<leader>pq",
    fzf_lua.command_history,
    utils.mergeTables(opts, {
      desc = "fzf-lua.command_history()",
    })
  )
  keyset(
    "n",
    "<leader>pr",
    fzf_lua.registers,
    utils.mergeTables(opts, {
      desc = "fzf-lua.registers()",
    })
  )
  keyset(
    "n",
    "<leader>pt",
    fzf_lua.builtin,
    utils.mergeTables(opts, {
      desc = "fzf-lua.builtin()",
    })
  )
end

-- if 0 then
--   os.exit(11)
-- end

if vim.fn.exists(":NvimTreeToggle") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>te", "<cmd>NvimTreeToggle<CR>", opts)
end

if vim.fn.exists(":Mason") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tm", "<cmd>Mason<CR>", opts)
end

if vim.fn.exists(":Noice") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tn", "<cmd>Noice history<CR>", opts)
end

if vim.g.vscode then
  -- TODO:
  opts = { silent = true }
  local vscode = require("vscode")
  keyset({ "v" }, "<leader>cy", function()
    vscode.action("editor.action.clipboardCopyAction")
  end)
  keyset({ "n", "x" }, "<leader>tb", function()
    vscode.action("workbench.action.toggleSidebarVisibility")
  end)
  keyset({ "n", "x" }, "<leader>te", function()
    vscode.action("workbench.view.explorer")
  end)
  keyset({ "n", "x" }, "<leader>tm", function()
    vscode.action("workbench.view.extensions")
  end)
  keyset({ "n", "x" }, "<leader>pf", function()
    vscode.action("workbench.action.quickOpen")
  end)
  keyset({ "n", "x" }, "<leader>pp", function()
    vscode.action("workbench.action.showCommands")
  end)
end
