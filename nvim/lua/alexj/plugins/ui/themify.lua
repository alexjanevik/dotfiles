return {
  "lmantw/themify.nvim",

  lazy = false,
  priority = 999,

  config = function()
    require("themify").setup({
      "catppuccin/nvim",
      "olimorris/onedarkpro.nvim",
      "folke/tokyonight.nvim",
      "ellisonleao/gruvbox.nvim",
    })
  end,
}
