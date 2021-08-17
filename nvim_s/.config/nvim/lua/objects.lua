function getLineNum() 
	return vim.api.nvim_win_get_cursor(0)[1]
end

function getColNum()
	return vim.api.nvim_win_get_cursor(0)[2]
end

function getCurrentLine()
	cursor = vim.api.nvim_win_get_cursor(0)
	ln = cursor[1]
	col = cursor[2]
	line = vim.api.nvim_buf_get_lines(0, ( ln - 1 ), (ln), false)[1]
	return line
end

function getCurrentChar()
	col = getColNum()
	return getCurrentLine():sub(col+1, col+1)
end

function findNextInstance(line, token, begin)
	for i = begin+1, string.len(line), 1 do
		substr = line:sub(i, i + string.len(token) - 1)
		if substr == token then
			return i
		end
	end
	return false
end

function findPrevInstance(line, token, begin)
	for i = begin-1, 0, -1 do
		substr = line:sub(i - string.len(token) + 1, i)
		if substr == token then
			return i - string.len(token) + 1
		end
	end
	return false
end

function getTextObjectRange(first, last)
	if not last then
		last = first
	end

	ln = getLineNum()
	col = getColNum()
	line = getCurrentLine()
	begin = false
	finish = false
	
	if getCurrentChar() == first then
		if first == last then
			begin = findPrevInstance(line, first, col+1)
			finish = col + 1
			if not begin then
				finish = findNextInstance(line, first, col+1)
				begin = col + 1
			end
		else
			begin = col + 1
			finish = findNextInstance(line, last, col+1)
		end
	elseif getCurrentChar() == last then
		finish = col + 1
		begin = findPrevInstance(line, first, col+1)
	else
		begin = findPrevInstance(line, first, col+1)
		finish = findNextInstance(line, last, col+1)
	end

	if begin and finish then
		return {begin, finish, ln}
	else
		return {false, false, ln}
	end

end

function highlightRange(coords, around)
	begin = coords[1]
	finish = coords[2]
	if not begin or not finish then
		return
	end
	line = coords[3]
	if not around then
		begin = begin + 1
		finish = finish - 1
	end
	command = string.format('norm %dGv%d|o%d|', line, begin, finish)
	print('###', command)
	vim.api.nvim_command(command)
end
