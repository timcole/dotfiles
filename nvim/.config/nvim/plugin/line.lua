local custom_ayu_dark = require'lualine.themes.ayu_dark'
custom_ayu_dark.normal.c.bg = '#08090D'
custom_ayu_dark.normal.a.bg = '#161D26'
custom_ayu_dark.normal.a.fg = '#4B5263'
custom_ayu_dark.insert.a.bg = '#60AFEF'
custom_ayu_dark.visual.a.bg = '#C376DB'

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = custom_ayu_dark,
    component_separators = { '', ' '},
    -- section_separators = { '', '' },
    section_separators = { '', '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
          hint = ' 💡 ',
          info = ' 🤟 ',
          warning = ' 💩 ',
          error = ' 🔥 '
        },
        sections = { 'error', 'warn', 'info', 'hint' },
      },
      'progress',
    },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  }
})
