local M = {}

local state_file = vim.fn.stdpath("state") .. "/colorscheme"

local function save(name)
	local f = io.open(state_file, "w")
	if f then
		f:write(name)
		f:close()
	end
end

function M.load()
	local f = io.open(state_file, "r")
	if not f then return end
	local name = f:read("*l")
	f:close()
	if name and name ~= "" then
		pcall(vim.cmd.colorscheme, name)
	end
end

function M.pick()
	local ok, MiniPick = pcall(require, "mini.pick")
	if not ok then
		vim.notify("mini.pick not available", vim.log.levels.ERROR)
		return
	end

	local schemes = vim.fn.getcompletion("", "color")

	MiniPick.start({
		source = {
			items = schemes,
			name = "Colorschemes",
			choose = function(item)
				if item then
					vim.schedule(function()
						vim.cmd.colorscheme(item)
						save(item)
					end)
				end
			end,
		},
	})
end

return M
