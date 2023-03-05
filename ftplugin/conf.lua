-- get correct filetype for `/var/tmp` (`sudo -e`) files
if vim.fn.expand('%:p'):find('^/var/tmp') then   
    -- TODO
    local fname = vim.fn.expand('%:p'):match('^/var/tmp/(.*)%.[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]$')
    if fname ~= nil then
        local ft = vim.filetype.match({ filename = fname })
        if ft ~= nil then
            vim.cmd('set ft=' .. ft)
        end
    end

    local base, ext = vim.fn.expand('%:p'):match('(.*)[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]%.([^.|$]*)$')
    if base ~= nil and ext ~= nil then
        local ft = vim.filetype.match({ filename = base .. '.' .. ext })
        if ft ~= nil then
            vim.cmd('set ft=' .. ft)
        end
    end
end
