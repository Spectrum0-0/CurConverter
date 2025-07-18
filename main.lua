local dir_sep = package.config:sub(1, 1)
local directory

print()

if dir_sep == "\\" then
    directory = io.popen('dir "toConvert" /b')
else 
    directory = io.popen('ls "toConvert"')
end

print("What file extension would you like to convert to? (e.g : jpg, png, cur, txt, py)\n")
local target_Ext = io.read()
print()

local _, b = pcall(function()
    for file in directory:lines() do
        if file  == "hi.txt" then goto continue end

        local base = file:match("^(.*)%.([^%.]+)$")

    if base then
        local new_file = base .. "." .. target_Ext

        print("Converted " .. file .. " to " .. new_file .. "!")

        os.rename("toConvert" .. dir_sep .. file, "toConvert" .. dir_sep .. new_file)
    end

        ::continue::
    end
end)

if b then print(b) end

print("Finished!")