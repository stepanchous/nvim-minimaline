local M = {}

local function get_process_output(cmd)
    local process = io.popen(cmd)
    local output = process:read("*a")
    process:close()

    return output
end

local function get_arc_branch_impl()
    local branch = vim.fn.system("arc info 2> /dev/null | awk '/^branch:/{print $2}")
    local hash = vim.fn.system("arc info 2> /dev/null | awk '/^hash:/{print $2}'")

    if branch == hash then
        return branch
    else
        return hash
    end
end

local function M.get_arc_branch()
    branch = get_arc_branch_impl()
    return branch ~= "" and "  󰊢  " .. vim.trim(branch) or ""
end

return M
