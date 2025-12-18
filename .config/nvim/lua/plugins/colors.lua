--[[
return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'tokyonight-night'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
]]

--catppuccin
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  opts = {
    transparent_background = false, -- disables setting the background color.
    float = {
      transparent = false,          -- enable transparent floating windows
      solid = false,                -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
    term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false,              -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15,            -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,              -- Force no italic
    no_bold = false,                -- Force no bold
    no_underline = false,           -- Force no underline
    styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" },      -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    color_overrides = {},
    --[[
    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },
    ]]
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = true,
    --[[
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
      ]]
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  --[[
  opts = {
    no_italic = true,
    term_colors = true,
    transparent_background = false,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
    },
    color_overrides = {
      mocha = {
        base = '#000000',
        mantle = '#000000',
        crust = '#000000',
      },
    },
    integrations = {
      telescope = {
        enabled = true,
        style = 'nvchad',
      },
      dropbar = {
        enabled = true,
        color_mode = true,
      },
    },
  },]]
  init = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}

--gruvbox
--[[
return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  },
  init = function()
    vim.cmd.colorscheme 'gruvbox'
  end,
}
]]
