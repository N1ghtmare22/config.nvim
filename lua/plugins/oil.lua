return {
   'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
