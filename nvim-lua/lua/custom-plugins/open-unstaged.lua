--
-- Open git unstaged files
--

function OpenUnstaged()
    local unstaged = io.popen("git status --short | awk '{print $2}'")
    local file = unstaged:read('*l')
    while file ~= nil do
        cmd("edit "..file)
        file = unstaged:read('*l')
    end
end

map('n', '<leader>u', ':lua OpenUnstaged()<cr>')
