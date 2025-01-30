local M = {}

local utils = require("dotfiles.utils")

local keyset = vim.keymap.set
local opts = { slient = true }

function M.setup()
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
end

return M
