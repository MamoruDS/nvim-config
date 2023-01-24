require("github-theme").setup({
    theme_style = "dark_default",
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    transparent = true
})

{{#if nvim_node_host_prog}}
vim.g.node_host_prog = {{nvim_node_host_prog}}
{{/if}}
{{#if nvim_python3_host_prog}}
vim.g.python3_host_prog = {{nvim_python3_host_prog}}
{{/if}}
{{#if nvim_plugin_copilot_node_host}}
vim.g.copilot_node_command = {{nvim_plugin_copilot_node_host}}
{{/if}}
