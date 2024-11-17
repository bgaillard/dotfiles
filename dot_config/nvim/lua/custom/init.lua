vim.cmd "set colorcolumn=120"
vim.wo.relativenumber = true

-- nvim-tree
--
-- set termguicolors to enable highlight groups
--
-- see https://github.com/nvim-tree/nvim-tree.lua
vim.opt.termguicolors = true


-- Spell
--
-- To install missing language package in Neovim do the following.
--     
--     mkdir -p ~/.config/nvim/spell
--     wget https://ftp.nluug.nl/vim/runtime/spell/fr.utf-8.spl -O ~/.config/nvim/spell/fr.utf-8.spl
--
-- WARNING: If you believe spell does not work correctly check that the errors are not generated with a specific LSP
--          plugin with ':Trouble'.
--
-- see https://github.com/neovim/neovim/issues/2102
-- see https://neovim.io/doc/user/spell.html
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spellfile = vim.fn.expand("$HOME/.config/nvim/spell/en.utf-8.add")


-- Do not open Netrw at startup, we only need Netrw for the 'gx' shortcut to still work
--
-- see https://github.com/nvim-tree/nvim-tree.lua/commit/ce2420b9dab282703fb08e72009f0787b1a7b097
-- see https://www.reddit.com/r/vim/comments/3d4cpf/prevent_netrw_or_nerdtree_from_opening_when/
vim.cmd([[autocmd VimEnter * silent! au! FileExplorer *]])


-- Terraform highlight and linting
--
-- see https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])


vim.g.python3_host_prog = "/usr/bin/python"

-- Jinja highlight and linting
--vim.cmd([[autocmd BufRead,BufNewFile *.yaml.j2 set filetype=yaml.ansible]])
--vim.cmd([[autocmd BufRead,BufNewFile *.yml.j2 set filetype=yaml.ansible]])

-- vim.g.clipboard = {
--     name = "mclip",
--     copy = {
--         ["+"] = "mclip",
--         ["*"] = "mclip",
--     },
--     paste = {
--         ["+"] = "mclip -o",
--         ["*"] = "mclip -o",
--     },
--     cache_enabled = 1,
-- }
