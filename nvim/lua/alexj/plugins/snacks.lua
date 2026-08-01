return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    --explorer = { enabled = true, replace_netrw = true, trash = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    lazygit = { enabled = true },
  },
  keys = {
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    { "<leader>fr", function() Snacks.picker.recent() end,        desc = "Recent" },
    { "<leader>n",  function() Snacks.picker.notifications() end, desc = "Notification History" },
    {
      "<leader>l",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
  },
}
