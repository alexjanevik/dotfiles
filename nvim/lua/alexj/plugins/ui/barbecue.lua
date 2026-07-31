return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  after = "tokyonight",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function(_, opts)
    require("barbecue").setup(opts)
  end,
}
