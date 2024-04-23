return {
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "debugloop/telescope-undo.nvim",
  --   },
  --   config = function()
  --     require("telescope").setup {
  --       -- the rest of your telescope config goes here
  --       extensions = {
  --         undo = {
  --           use_delta = true,
  --           use_custom_command = nil,
  --           side_by_side = true,
  --           diff_context_lines = vim.o.scrolloff,
  --           entry_format = "state #$ID, $STAT, $TIME",
  --           time_format = "%d-%h-%m-%s",
  --           saved_only = false,
  --         },
  --         -- other extensions:
  --         -- file_browser = { ... }
  --       },
  --     }
  --     require("telescope").load_extension "undo"
  --     -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  --   end,
  -- },
  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    opts = {
      selected_browser = "chrome",
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    config = function() require("octo").setup() end,
    lazy = true,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      require("telescope").load_extension "media_files"
      require("telescope").setup {
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg",
          },
        },
      }
    end,
  },
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    ft = { "tf", "hcl" },
    lazy = false,
    config = function() require("telescope").load_extension "terraform_doc" end,
  },
}
