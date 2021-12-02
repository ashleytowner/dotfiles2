function GetLineNum()
    return vim.api.nvim_win_get_cursor(0)[1]
end

function GetColNum()
    return vim.api.nvim_win_get_cursor(0)[2]
end

function GetCurrentLine()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local ln = cursor[1]
    local col = cursor[2]
    local line = vim.api.nvim_buf_get_lines(0, ( ln - 1 ), (ln), false)[1]
    return line
end

function GetCurrentChar()
    local col = GetColNum()
    return GetCurrentLine():sub(col+1, col+1)
end

--- @returns the value bounded by an upper and lower limit
function Bound(min, max, val)
    if val > max then
        return { max, val - max }
    elseif val < min then
        return { min, min - val }
    end
    return { val, 0 }
end
--
--- Determins if a value is within a range
function IsWithinRange(min, max, val)
    return val <= max and val >= min
end

function TokeniseLine(line, token)
    local tokenList = {}
    local tokenLength = string.len(token)
    for i = 1, string.len(line), 1 do
        local substr = line:sub(i, i + tokenLength - 1)
        if substr == token then
            table.insert(tokenList, { i, i + tokenLength - 1 })
        end
    end
    return tokenList
end

function FindNextToken(tokenList, position)
    for _, v in pairs(tokenList) do
        if v[1] > position then
            return v
        end
    end
    return false
end

function FindPrevToken(tokenList, position)
    local lastToken = false
    for _, v in pairs(tokenList) do
        if v[2] < position then
            lastToken = v
        end
        if v[1] >= position then
            return lastToken
        end
    end
    return lastToken
end

function IsOnToken(tokenList, position)
    for _, v in pairs(tokenList) do
        if IsWithinRange(v[1], v[2], position) then
            return v
        end
        if v[1] > position then
            return false
        end
    end
    return false
end

function GetObjectRange(line, position, around, startToken, endToken)
    if not endToken then
        endToken = startToken
    end

    local startTokenList = TokeniseLine(line, startToken)
    local endTokenList = TokeniseLine(line, endToken)

    local rangeStart = false
    local rangeEnd = false

    local onStartToken = IsOnToken(startTokenList, position)
    local onEndToken = IsOnToken(endTokenList, position)

    print(onStartToken, onEndToken)
    if onStartToken then
        if startToken == endToken then
            rangeStart = FindPrevToken(startTokenList, position)
            rangeEnd = onStartToken
            if not rangeStart then
                rangeEnd = FindNextToken(startTokenList, position)
                rangeStart = onStartToken
            end
        else
            rangeStart = onStartToken
            rangeEnd = FindNextToken(endTokenList, position)
        end
    elseif onEndToken then
        rangeEnd = onEndToken
        rangeStart = FindPrevToken(startTokenList, position)
    else
        rangeStart = FindPrevToken(startTokenList, position)
        rangeEnd = FindNextToken(endTokenList, position)
    end

    if rangeStart and rangeEnd then
        if around then
            return { rangeStart[1], rangeEnd[2] }
        end
        return { rangeStart[2] + 1, rangeEnd[1] - 1 }
    end
    return false
end

function HighlightRange(range, line)
    if not range then
        return
    end
    local begin = range[1]
    local finish = range[2]
    if not begin or not finish then
        return
    end
    local command = string.format('norm %dGv%d|o%d|', line, begin, finish)
    vim.api.nvim_command(command)
end

function SelectTextObject(startToken, endToken, around)
    local range = GetObjectRange(GetCurrentLine(), GetColNum()+1, around, startToken, endToken)
    HighlightRange(range, GetLineNum())
end
