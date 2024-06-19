local function jumpto(filename)
	vim.cmd('e ' .. filename)
end

local function change_extension(patterns)
	local filename = vim.api.nvim_buf_get_name(0)
	for _, p in ipairs(patterns) do
		local k, v = unpack(p)
		if filename:sub(-string.len(k)) ~= k then
			goto continue
		end
		local new = ''
		if type(v) == 'string' then
			v = {v}
		end
		for _, suffix in ipairs(v) do
			new = filename:sub(0, -string.len(k) - 1) .. suffix
			if vim.fn.filereadable(new) ~= 0 then
				jumpto(new)
				return
			end
		end
		if new ~= '' then
			jumpto(new)
			return
		end
		::continue::
	end
end

return {
	setup = function () end,
	change_extension = function (patterns)
		return function()
			return change_extension(patterns)
		end
	end,
}
