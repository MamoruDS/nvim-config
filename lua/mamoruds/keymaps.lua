local keyset = vim.keymap.set
local opts = {
	-- noremap = true,
	silent = true,
	-- expr = true,
	-- replace_keycodes = false,
}

keyset("n", "<leader>tl", "<cmd>LspInfo<CR>", opts)

-- if vim.fn.exists(":CocInfo") then
-- end

if vim.fn.exists(":ConformInfo") then
	opts = { silent = true }
	keyset("n", "<leader>tc", "<cmd>ConformInfo<CR>", opts)
end

if vim.fn.exists(":Copilot") then
	opts = {
		noremap = true,
		silent = true,
		expr = true,
		replace_keycodes = false,
	}
	keyset("i", "<C-t>", "copilot#Accept('<CR>')", opts)
end

if vim.fn.exists(":FzfLua") then
	opts = { silent = true }
	keyset("n", "<leader>pb", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
	keyset("n", "<leader>pd", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>", opts)
	keyset("n", "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>", opts)
	keyset("n", "<leader>ph", "<cmd>lua require('fzf-lua').highlights()<CR>", opts)
	keyset("n", "<leader>pm", "<cmd>lua require('fzf-lua').help_tags()<CR>", opts)
	-- TODO: history
	-- keyset("n", "<leader>pn", "<cmd>lua <CR>", opts)
	keyset("n", "<leader>pp", "<cmd>lua require('fzf-lua').commands()<CR>", opts)
	keyset("n", "<leader>pq", "<cmd>lua require('fzf-lua').command_history()<CR>", opts)
	keyset("n", "<leader>pr", "<cmd>lua require('fzf-lua').registers()<CR>", opts)
end

if vim.fn.exists(":NvimTreeToggle") then
	opts = { silent = true }
	keyset("n", "<leader>te", "<cmd>NvimTreeToggle<CR>", opts)
end

if vim.fn.exists(":Mason") then
	opts = { silent = true }
	keyset("n", "<leader>tm", "<cmd>Mason<CR>", opts)
end

if vim.fn.exists(":Noice") then
	opts = { silent = true }
	keyset("n", "<leader>tn", "<cmd>Noice history<CR>", opts)
end
