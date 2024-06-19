local M = {}

local function jumpto(filename)
	vim.cmd('e ' .. filename)
end

local function change_extension(patterns)
	local filename = vim.api.nvim_buf_get_name(0)
	for _, p in ipairs(patterns) do
		local k, v, create = p[1], p[2], p['create']

		if filename:sub(-string.len(k)) ~= k then
			goto continue
		end

		local new = filename:sub(0, -string.len(k) - 1) .. v
		if vim.fn.filereadable(new) ~= 0 or create == true then
			jumpto(new)
			return
		end

		::continue::
	end
end

M.setup = function () end
M.change_extension = function (patterns)
	return function()
		return change_extension(patterns)
	end
end

return M
