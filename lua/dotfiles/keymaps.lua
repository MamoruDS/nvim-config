local utils = require("dotfiles.utils")

local keyset = vim.keymap.set
local opts = {
  -- noremap = true,
  silent = true,
  -- expr = true,
  -- replace_keycodes = false,
}

keyset("n", "<leader>;", ":", { noremap = true, silent = false })

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
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.declaration()",
      })
    )
    keyset(
      "n",
      "gd",
      vim.lsp.buf.definition,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.definition()",
      })
    )
    keyset(
      "n",
      "K",
      vim.lsp.buf.hover,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.hover()",
      })
    )
    keyset(
      "n",
      "gi",
      vim.lsp.buf.implementation,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.implementation()",
      })
    )
    keyset(
      "n",
      "<C-k>",
      vim.lsp.buf.signature_help,
      utils.merge_tables(opts, {
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
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.type_definition()",
      })
    )
    keyset(
      "n",
      "<space>rn",
      vim.lsp.buf.rename,
      utils.merge_tables(opts, {
        desc = "()",
      })
    )
    keyset(
      { "n", "v" },
      "<space>ca",
      vim.lsp.buf.code_action,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.code_action()",
      })
    )
    keyset(
      "n",
      "gr",
      vim.lsp.buf.references,
      utils.merge_tables(opts, {
        desc = "vim.lsp.buf.references()",
      })
    )
  end,
})

if vim.fn.exists(":ConformInfo") ~= 0 then
  opts = { silent = true }
  keyset("n", "<leader>tc", "<cmd>ConformInfo<CR>", opts)
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
    utils.merge_tables(opts, {
      desc = "fzf-lua.buffers()",
    })
  )
  keyset(
    "n",
    "<leader>pd",
    fzf_lua.diagnostics_document,
    utils.merge_tables(opts, { desc = "fzf-lua.diagnostics_document()" })
  )
  keyset(
    "n",
    "<leader>pf",
    fzf_lua.files,
    utils.merge_tables(opts, {
      desc = "fzf-lua.files()",
    })
  )
  keyset(
    "n",
    "<leader>pgg",
    fzf_lua.grep,
    utils.merge_tables(opts, {
      desc = "fzf-lua.grep()",
    })
  )
  keyset(
    "n",
    "<leader>pgl",
    fzf_lua.git_commits,
    utils.merge_tables(opts, {
      desc = "fzf-lua.git_commits()",
    })
  )
  keyset(
    "n",
    "<leader>pgs",
    fzf_lua.git_status,
    utils.merge_tables(opts, {
      desc = "fzf-lua.git_status()",
    })
  )
  keyset(
    "n",
    "<leader>ph",
    fzf_lua.highlights,
    utils.merge_tables(opts, {
      desc = "fzf-lua.highlights()",
    })
  )
  keyset(
    "n",
    "<leader>pk",
    fzf_lua.keymaps,
    utils.merge_tables(opts, {
      desc = "fzf-lua.keymaps()",
    })
  )
  keyset(
    "n",
    "<leader>pm",
    fzf_lua.help_tags,
    utils.merge_tables(opts, {
      desc = "fzf-lua.help_tags()",
    })
  )
  -- TODO: noice history
  keyset(
    "n",
    "<leader>pp",
    fzf_lua.commands,
    utils.merge_tables(opts, {
      desc = "fzf-lua.commands()",
    })
  )
  keyset(
    "n",
    "<leader>pq",
    fzf_lua.command_history,
    utils.merge_tables(opts, {
      desc = "fzf-lua.command_history()",
    })
  )
  keyset(
    "n",
    "<leader>pr",
    fzf_lua.registers,
    utils.merge_tables(opts, {
      desc = "fzf-lua.registers()",
    })
  )
  keyset(
    "n",
    "<leader>pt",
    fzf_lua.builtin,
    utils.merge_tables(opts, {
      desc = "fzf-lua.builtin()",
    })
  )
end

if vim.fn.exists(":Telescope") ~= 0 then
  local telescope = require("telescope.builtin")
  local telescope_diagnostic_current = function()
    return telescope.diagnostics({ bufnr = 0 })
  end
  opts = { silent = true }
  keyset(
    "n",
    "<leader>pb",
    telescope.buffers,
    utils.merge_tables(opts, {
      desc = "telescope.buffers()",
    })
  )

  keyset(
    "n",
    "<leader>pd",
    -- telescope.diagnostics,:
    telescope_diagnostic_current,
    utils.merge_tables(opts, { desc = "telescope.diagnostics()" })
  )
  keyset(
    "n",
    "<leader>pf",
    telescope.find_files,
    utils.merge_tables(opts, {
      desc = "telescope.find_files()",
    })
  )
  keyset(
    "n",
    "<leader>pgg",
    telescope.live_grep,
    utils.merge_tables(opts, {
      desc = "telescope.live_grep()",
    })
  )
  keyset(
    "n",
    "<leader>pgl",
    telescope.git_commits,
    utils.merge_tables(opts, {
      desc = "telescope.git_commits()",
    })
  )
  keyset(
    "n",
    "<leader>pgs",
    telescope.git_status,
    utils.merge_tables(opts, {
      desc = "telescope.git_status()",
    })
  )
  keyset(
    "n",
    "<leader>ph",
    telescope.highlights,
    utils.merge_tables(opts, {
      desc = "telescope.highlights()",
    })
  )
  keyset(
    "n",
    "<leader>pk",
    telescope.keymaps,
    utils.merge_tables(opts, {
      desc = "telescope.keymaps()",
    })
  )
  keyset(
    "n",
    "<leader>pm",
    telescope.help_tags,
    utils.merge_tables(opts, {
      desc = "telescope.help_tags()",
    })
  )
  -- TODO: noice history
  keyset(
    "n",
    "<leader>pp",
    telescope.commands,
    utils.merge_tables(opts, {
      desc = "telescope.commands()",
    })
  )
  keyset(
    "n",
    "<leader>pq",
    telescope.command_history,
    utils.merge_tables(opts, {
      desc = "telescope.command_history()",
    })
  )
  keyset(
    "n",
    "<leader>pr",
    telescope.registers,
    utils.merge_tables(opts, {
      desc = "telescope.registers()",
    })
  )
  keyset(
    "n",
    "<leader>pt",
    telescope.builtin,
    utils.merge_tables(opts, {
      desc = "telescope.builtin()",
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
