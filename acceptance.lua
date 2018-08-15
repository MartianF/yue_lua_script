wrk.method = "POST"
wrk.headers["Content-Type"] = "application/json"

wrk.headers["Cookie"] = "SPC_EC=OaYlvq49yYhOlsFidmpTf0f9IfpsvXrrX92DAz2sc38hjELmXt4CgIiU6N1yugH24Cw0pgzl60mj2wMECvU4Ctu0hyia0f+gLcsito8bE4CSB4452/gF/fv6KBn/GjQuyUNdSZFoIQKm1ilga0mI5A=="
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
	rand = math.random(10001, 99999)
	groupid = "140970203067920153423535478" .. rand
    userid = math.random(100000, 300000)
    username = randomString(10)
    path = "/gameabr/api/v1/536/932/group/"..groupid.."/acceptance/"
    body = "{\"userid\":"..userid..",\"username\":\"..username.."\",\"avatar\":\"\"}"
    return wrk.format(nil,path,nil,body)
end