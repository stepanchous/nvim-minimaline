local M = {}

local git_source = require('minimaline.git')
local arc_source = require('minimaline.arc')

function M.get_sc_branch()
    git_branch = git_source.get_git_branch()
    arc_branch = arc_source.get_arc_branch()

    if git_branch ~= "" then
        return git_branch
    end

    if arc_branch ~= "" then
        return arc_branch
    end

    return ""
end

return M
