require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'onedark',
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

require('lualine').hide({
  place = {'statusline', 'tabline', 'winbar'},
  unhide = false,
})
