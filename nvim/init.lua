-- [[ Set the leader key: <space> ]]
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy_init")

-- Core modules
require('core.options')
require('core.keymaps')
require('core.augroupscommands')
