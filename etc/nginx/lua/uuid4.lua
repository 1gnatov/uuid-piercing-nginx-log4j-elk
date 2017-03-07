local uuid4 = {}

function uuid4.getfakeuuid() 
    return math.random(0, 9999999)
end

function uuid4.getuuid()
    local ret = {}

    _rnd = math.random
    _fmt = string.format

    local _y_map = {"8", "9", "a", "b"}
    local _y = _y_map[_rnd(1, 4)]

    ret[1] = _fmt("%08x",  _rnd(0, 4294967295))        -- 2**32 - 1
    ret[1] = _fmt("%08x",  _rnd(0, 4294967295))        -- 2**32 - 1
    ret[2] = _fmt("%04x",  _rnd(0, 65535))             -- 2**16 - 1
    ret[3] = _fmt("4%03x", _rnd(0, 4095))              -- 2**12 - 1
    ret[4] = _fmt("%s%03x", _y, _rnd(0, 4095))         -- 2**12 - 1
    ret[5] = _fmt("%012x", _rnd(0, 281474976710656))   -- 2**48 - 1

    return table.concat(ret, '-')
end

function uuid4.validate()
    if type(bytes) == "string" and bytes:len() == 36 then
        if bytes:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") then
            return bytes
        end
    end
    return nil
end

return uuid4