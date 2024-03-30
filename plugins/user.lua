return {
  { "airblade/vim-rooter", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "tpope/vim-dadbod", ft = { "sql" } },
  { "chrisbra/csv.vim", lazy = false, ft = { "csv" } },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-fugitive", lazy = false },
  { "tpope/vim-rhubarb", lazy = false },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    lazy = false,
  },
  { "mzlogin/vim-markdown-toc", ft = { "md" }, lazy = false },
  { "hashivim/vim-terraform", ft = { "tf", "tfstate" }, lazy = false },
  -- {
  --   "rest-nvim/rest.nvim",
  --   lazy = false,
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   ft = "http",
  --   config = function()
  --     require("rest-nvim").setup {
  --       --- Get the same options from Packer setup
  --     }
  --   end,
  -- },

  -- local
  { "/Users/bob.walker/code/parquet-nvim", dev = true, lazy = false },
}
-- },
-- { "junegunn/vim-easy-align" },
