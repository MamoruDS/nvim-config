return function(module_name)
  local default_prefix = "dotfiles"
  local local_prefix = "local"
  require(default_prefix .. "." .. module_name)
  local status, err = pcall(require, local_prefix .. "." .. module_name)
  if not status then
    if not string.find(err, "not found:") then
      vim.notify({
        "Failed to load module: " .. local_prefix .. "." .. module_name .. "\n" .. err,
        vim.log.levels.ERROR,
      })
    end
  end
end
