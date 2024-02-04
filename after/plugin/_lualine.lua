require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 5000,
      tabline = 5000,
      winbar = 5000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        function()
          local unsaved = 0
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_get_option(buf, 'modified') then
              unsaved = unsaved + 1
            end
          end

          if unsaved == 0 then
            return ''
          else
            return '🔴 ' .. unsaved .. ' UNSAVED'
          end
        end,
      },
    },
    lualine_x = {},
    lualine_y = {
      {
        function()
          local modified = vim.bo.modified

          if modified then
            return '🔴'
          else
            return ''
          end
        end,
      },
    },
    lualine_z = { 'mode' }
  },
  winbar = {
  },
  inactive_winbar = {
  },
  extensions = {
  }
}
