vim.cmd "set colorcolumn=120"
vim.wo.relativenumber = true

-- nvim-tree
--
-- see https://github.com/nvim-tree/nvim-tree.lua
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
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


-- Terraform highlight and linting
--
-- see https://www.mukeshsharma.dev/2022/02/08/neovim-workflow-for-terraform.html
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

-- Jinja highlight and linting
--vim.cmd([[autocmd BufRead,BufNewFile *.yaml.j2 set filetype=yaml.ansible]])
--vim.cmd([[autocmd BufRead,BufNewFile *.yml.j2 set filetype=yaml.ansible]])
