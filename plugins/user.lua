return {
  { "airblade/vim-rooter", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  -- { "tpope/vim-dadbod", ft = { "sql", "plsql", "gcp", "redis" } },
  { "hp4k1h5/vim-dadbod", ft = { "sql", "plsql", "gcp", "redis" } },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "hp4k1h5/vim-dadbod", lazy = true },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "plsql", "redis", "gcp" },
        lazy = true,
        -- init = function() vim.g.db_adapter_postgis = vim.g.db_adapter_postgres end,
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.dbs = {
        der_dev = os.getenv "DER_DATABASE_URL",
        der_stage = os.getenv "DER_STAGE_DATABASE_URL",
        der_prod = os.getenv "DER_PROD_DATABASE_URL",
        --
        fo_dev = os.getenv "FORECASTING_DATABASE_URL",
        fo_stage = os.getenv "FORECASTING_STAGE_DATABASE_URL",
        --
        am_stage = "bigquery://kv-data-ameren-myigp.output_prod",
        teco_stage = "bigquery://kv-de-data-teco-decentralize.output_prod",
      }
    end,
  },
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
