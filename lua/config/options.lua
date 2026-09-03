local opt = vim.opt

-- You have to turn this one on :)
opt.inccommand = "split"

opt.guicursor = ""

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences -----
opt.nu = true
opt.relativenumber = true
opt.cursorline = false
opt.laststatus = 3

opt.clipboard = ""
opt.mouse = "a"

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

-- Keep the completion popup from eating the screen. 
opt.pumheight = 10
opt.pummaxwidth = 40

opt.scrolloff = 8

opt.swapfile = false

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

opt.colorcolumn = "80"

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.more = false

opt.foldmethod = "manual"

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true

opt.showmode = false
