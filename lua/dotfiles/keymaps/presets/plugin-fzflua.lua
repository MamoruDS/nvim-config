local M = {}

local utils = require("dotfiles.utils")

local keyset = vim.keymap.set
local opts = { slient = true }

function M.setup()
  if vim.fn.exists(":FzfLua") ~= 0 then
    local fzf_lua = require("fzf-lua")
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
end

return M
