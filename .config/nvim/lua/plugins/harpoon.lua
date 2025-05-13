return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    keys = { '<leader>lh', mode = 'n', desc = '[l]oad [h]arpoon plugin.' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup {}
      -- REQUIRED

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Open harpoon window' })
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = '[a]dd file to harpoon quickfix list.' })
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-LEFT>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-RIGHT>', function()
        harpoon:list():next()
      end)
    end,
  },
}
