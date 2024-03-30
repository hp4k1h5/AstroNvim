return {
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
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup {
        -- the rest of your telescope config goes here
        extensions = {
          undo = {
            use_delta = true,
            use_custom_command = nil,
            side_by_side = true,
            diff_context_lines = vim.o.scrolloff,
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "%d-%h-%m-%s",
          },
          -- other extensions:
          -- file_browser = { ... }
        },
      }
      require("telescope").load_extension "undo"
      -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
  },
}
