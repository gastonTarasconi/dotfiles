return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({})

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = 'Add file to harpoon' })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle harpoon ui' })
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = 'Navigate to harpoon 1 file' })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = 'Navigate to harpoon 2 file' })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = 'Navigate to harpoon 3 file' })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = 'Navigate to harpoon 4 file' })
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = 'Navigate to harpoon 5 file' })
    vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = 'Navigate to harpoon 6 file' })
    vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = 'Navigate to harpoon 7 file' })
    vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = 'Navigate to harpoon 8 file' })
    vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = 'Navigate to harpoon 9 file' })

    -- -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<leader>p", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<leader>n", function() harpoon:list():next() end)
  end
}
