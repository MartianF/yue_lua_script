wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"

wrk.headers["Cookie"] = "SPC_EC=crvKNQmP+kLFkC097DL4Aof0YlRuxLfy8CmOKZT7zK4AcsMYBAT1P8fwCDDvod2L6u9EXosq5Ogwm/8Ktxkbl7v8G1jeCe3Xa1SQcsXND0g72JKWpSJCLLRCp0T7uVmp5zxYX+7MXsn4W+rjZMU+3w=="
counter = 1

charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

function randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

request = function()
    userid = math.random(100000, 300000)
    username = randomString(10)
    path = "/gameabr/api/v1/536/932/group/"
    body = "{\"userid\":\""..userid.."\",\"username\":\""..username.."\",\"avatar\":\"\"}"
    return wrk.format(nil,path,nil,body)
end