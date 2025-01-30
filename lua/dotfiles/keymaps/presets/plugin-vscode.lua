local M = {}

local keyset = vim.keymap.set

function M.setup()
  if vim.g.vscode then
    -- TODO:
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
end

return M
