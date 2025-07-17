local directory = io.popen('dir "toConvert" /b')

print("What file extension would you like to convert to? (e.g : jpg, png, cur, txt, py)\n")
local target_Ext = io.read()
print()

local _, b = pcall(function()
    for file in directory:lines() do
    if file  == "hi.txt" then goto continue end

    local base = file:match("^(.*)%.([^%.]+)$")

    if base then
        local new_file = base .. "." .. target_Ext

        os.rename("toConvert\\" .. file, "toConvert\\" .. new_file)

        print("Converted " .. file .. " to " .. new_file .. "!\n\n")
    end

    ::continue::
    end
end)

if b then print(b) end