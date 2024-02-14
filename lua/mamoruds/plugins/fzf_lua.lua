local keyset = vim.keymap.set
keyset("n", "<leader>pb", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
keyset("n", "<leader>pd", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>", { silent = true })
keyset("n", "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
keyset("n", "<leader>ph", "<cmd>lua require('fzf-lua').help_tags()<CR>", { silent = true })
keyset("n", "<leader>pp", "<cmd>lua require('fzf-lua').commands()<CR>", { silent = true })
keyset("n", "<leader>pq", "<cmd>lua require('fzf-lua').command_history()<CR>", { silent = true })
