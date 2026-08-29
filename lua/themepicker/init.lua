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
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local schemes = vim.fn.getcompletion("", "color")
	local before = vim.g.colors_name

	pickers.new({}, {
		prompt_title = "Colorschemes",
		finder = finders.new_table({ results = schemes }),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(bufnr, map)
			local preview = function()
				local entry = action_state.get_selected_entry()
				if entry then
					pcall(vim.cmd.colorscheme, entry[1])
				end
			end

			map("i", "<C-n>", function()
				actions.move_selection_next(bufnr)
				preview()
			end)
			map("i", "<C-p>", function()
				actions.move_selection_previous(bufnr)
				preview()
			end)
			map("n", "j", function()
				actions.move_selection_next(bufnr)
				preview()
			end)
			map("n", "k", function()
				actions.move_selection_previous(bufnr)
				preview()
			end)

			actions.select_default:replace(function()
				actions.close(bufnr)
				local entry = action_state.get_selected_entry()
				if entry then
					vim.cmd.colorscheme(entry[1])
					save(entry[1])
				end
			end)

			actions.close:enhance({
				post = function()
					if not action_state.get_selected_entry() then
						pcall(vim.cmd.colorscheme, before)
					end
				end,
			})

			return true
		end,
	}):find()
end

return M
