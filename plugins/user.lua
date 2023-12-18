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

  -- local
  { "/Users/bob.walker/code/parquet-nvim", dev = true, lazy = false },
}
-- },
-- { "mzlogin/vim-markdown-toc" },
-- { "junegunn/vim-easy-align" },
