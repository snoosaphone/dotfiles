-- 'softrequire' provides a wrapper around the builtin require. If the require has failed in a `local mod = softrequire('m') call, a quick check of
-- 'if mod then' can wrap code dependent upon the require, and fails gracefully
local function softrequire(m)
    local ok, err = pcall(require, m)
    if not ok then return nil, err end
    return err
end

local function execute(type)
    local command_table = {
        run = {
            java = "java %",
            python = "python %",
            rust = "cargo run",
        },
        test = {
            python = "python test",
            rust = "cargo test",
        },
        benchmark = {
            rust = "cargo bench",
        },
    }
    vim.api.nvim_command('write')
    local command = command_table[type][vim.bo.filetype]

    if command ~= nil then
        vim.cmd('FloatermNew --autoclose=0 ' .. command)
    end
end

