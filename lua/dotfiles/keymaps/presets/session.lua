local M = {}

local keyset = vim.keymap.set

function M.setup()
  keyset("n", "<leader>ss", function()
    local status_ok, _ = pcall(vim.cmd, "mksession")
    if not status_ok then
      vim.cmd("mksession!")
    end
    vim.notify("Session saved.")
  end, {
    desc = "session: save",
    silent = true,
  })
  keyset("n", "<leader>sl", function()
    vim.cmd("source Session.vim")
    vim.notify("Session loaded.")
  end, {
    desc = "session: load",
    silent = true,
  })
end

return M
