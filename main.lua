local directory = io.popen("test")

for file in directory:lines() do
    file = file + ".cur"
end