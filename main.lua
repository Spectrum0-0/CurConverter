local directory = io.popen('dir "test" /b')

print("What file extension would you like to convert to? (TYPE EXACTLY)")
local target_Ext = io.read()

local _, b = pcall(function()
    for file in directory:lines() do
    if file  == "hi.txt" then goto continue end

    local base = file:match("(.+)%.%w+$")

    if base then
        local new_file = base .. "." .. target_Ext

        print("Converted " .. file .. " to " .. new_file .. "!")

        os.rename("test\\" .. file, "test\\" .. new_file)
    end

    ::continue::
    end
end)


if b then print(b) end