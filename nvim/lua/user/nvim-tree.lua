local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local map = vim.api.nvim_set_keymap




local modifiedBufs = function(bufs)
  local t = 0
  for k,v in pairs(bufs) do
      if v.name:match("NvimTree_") == nil then
          t = t + 1
      end
  end
  return t
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
      if #vim.api.nvim_list_wins() == 1 and
      vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
      modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
          vim.cmd "quit"
      end
  end
})


nvim_tree.setup {
  open_on_setup = true,
  hijack_directories = {
    enable = false,
  },
  -- update_to_buf_dir = {
  --   enable = false,
  -- },
  -- disable_netrw = true,
  -- hijack_netrw = true,
  -- open_on_setup = false,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore" },
  },
  -- auto_close = true,
  -- open_on_tab = false,
  -- hijack_cursor = false,
  -- update_cwd = true,
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint =  "",
      info = "",
      warning = "",
      error = ""
    },
  },
  update_focused_file = {
    enable = true,
    -- update_cwd = true,
    ignore_list = {},
  },
  -- system_open = {
  --   cmd = nil,
  --   args = {},
  -- },
  -- filters = {
  --   dotfiles = false,
  --   custom = {},
  -- },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = true,
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-e>",                          action = "edit_in_place" },
        { key = "O",                              action = "edit_no_picker" },
        { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
        { key = "<C-v>",                          action = "vsplit" },
        { key = "<C-x>",                          action = "split" },
        { key = "<C-t>",                          action = "tabnew" },
        { key = "<",                              action = "prev_sibling" },
        { key = ">",                              action = "next_sibling" },
        { key = "P",                              action = "parent_node" },
        { key = "<BS>",                           action = "close_node" },
        { key = "<C-p>",                          action = "preview" },
        { key = "K",                              action = "first_sibling" },
        { key = "J",                              action = "last_sibling" },
        { key = "I",                              action = "toggle_git_ignored" },
        { key = "H",                              action = "toggle_dotfiles" },
        { key = "U",                              action = "toggle_custom" },
        { key = "R",                              action = "refresh" },
        { key = "a",                              action = "create" },
        { key = "d",                              action = "remove" },
        { key = "D",                              action = "trash" },
        { key = "r",                              action = "rename" },
        { key = "<C-r>",                          action = "full_rename" },
        { key = "x",                              action = "cut" },
        { key = "c",                              action = "copy" },
        { key = "p",                              action = "paste" },
        { key = "y",                              action = "copy_name" },
        { key = "Y",                              action = "copy_path" },
        { key = "gy",                             action = "copy_absolute_path" },
        { key = "[e",                             action = "prev_diag_item" },
        { key = "[c",                             action = "prev_git_item" },
        { key = "]e",                             action = "next_diag_item" },
        { key = "]c",                             action = "next_git_item" },
        { key = "-",                              action = "dir_up" },
        { key = "s",                              action = "system_open" },
        { key = "f",                              action = "live_filter" },
        { key = "F",                              action = "clear_live_filter" },
        { key = "q",                              action = "close" },
        { key = "W",                              action = "collapse_all" },
        { key = "E",                              action = "expand_all" },
        { key = "S",                              action = "search_node" },
        { key = ".",                              action = "run_file_command" },
        { key = "<C-k>",                          action = "toggle_file_info" },
        { key = "g?",                             action = "toggle_help" },
        { key = "m",                              action = "toggle_mark" },
        { key = "bmv",                            action = "bulk_move" },
      }
    },
    number = false,
    relativenumber = false,
  },
}
