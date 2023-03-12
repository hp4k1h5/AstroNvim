local config = {
  updater = { channel = "stable", auto_reload = true },
  colorscheme = "duskfox",
  header = {
    "                                                     ___",
    "                                                  ,o88888",
    "                                               ,o8888888'",
    '                         ,:o:o:oooo.        ,8O88Pd8888"',
    "                     ,.::.::o:ooooOoOoO. ,oO8O8Pd888'\"",
    '                   ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"',
    '                  , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"',
    '                 , ..:.::o:ooOoOO8O888O8O,COCOO"',
    '                , . ..:.::o:ooOoOOOO8OOOOCOCO"',
    '                 . ..:.::o:ooOoOoOO8O8OCCCC"o',
    '                    . ..:.::o:ooooOoCoCCC"o:o',
    '                    . ..:.::o:o:,cooooCo"oo:o:',
    "                 `   . . ..:.:cocoooo\"'o:o:::'",
    "                 .`   . ..::ccccoc\"'o:o:o:::'",
    "                :.:.    ,c:cccc\"':.:.:.:.:.'",
    "              ..:.:\"'`::::c:\"'..:.:.:.:.:.'",
    "            ...:.'.:.::::\"'    . . . . .'",
    "           .. . ....:.\"' `   .  . . ''",
    "         . . . ....\"'",
    "         .. . .\"'",
    "        .",
  },
  -- Default theme configuration
  default_theme = {
    colors = {
      fg = "#44a0cc",
      bg = "#222222",
    },
    highlights = function(hl)
      local C = require "default_theme.colors"
      hl.Normal = { fg = C.fg, bg = C.bg }
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },
  diagnostics = { virtual_text = true, underline = true },
  lsp = {
    root_dir = function()
    end,
    servers = {
      "pyright",
    },
    ["server-settings"] = {
      zk = {
        picker = "telescope",
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
          },
          auto_attach = { enabled = true, filetypes = { "markdown" } },
        },
      },
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      timeout_ms = 3000,
    },
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
  },
  mappings = {
    n = {
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["gv"] = { ":vs<CR>gd" },
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      ["<leader>rs"] = { ':lua require("neotest").summary.toggle()<CR>', desc = "Neotest summary" },
      ["<leader>ro"] = { ':lua require("neotest").summary.open()<CR>', desc = "Neotest summary open" },
      ["<leader>rc"] = { ':lua require("neotest").summary.close()<CR>', desc = "Neotest summary close" },
      ["<leader>rr"] = { ':lua require("neotest").run.run()<CR>', desc = "Neotest run" },
      ["<leader>rt"] = { ':lua require("neotest").run.stop()<CR>', desc = "Neotest stop" },
      ["<leader>ra"] = { ':lua require("neotest").run.attach()<CR>', desc = "Neotest attach" },
      ["<leader>rp"] = { ':lua require("neotest").output.open()<CR>', desc = "Neotest output" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure plugins
  plugins = {
    init = {
      { "tpope/vim-surround" },
      { "airblade/vim-rooter" },
      { "EdenEast/nightfox.nvim" },
      {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
      },
      { "mzlogin/vim-markdown-toc" },
      { "junegunn/vim-easy-align" },
      {
        "nvim-neotest/neotest",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
          "antoinemadec/FixCursorHold.nvim",
          "nvim-neotest/neotest-python",
        },
      },
    },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      config.sources = {
        null_ls.builtins.diagnostics.mypy.with {},
        null_ls.builtins.diagnostics.shellcheck.with {
          filetypes = { "sh", "bash", "zsh" },
        },
      }
      return config
    end,
    treesitter = {
      highlight = { enable = true, additional_vim_regex_highlighting = true },
      fold = { enable = true },
      rainbow = { enable = true },
    },
    ["mason-lspconfig"] = { ensure_installed = { "sumneko_lua", "pyright" } },
    ["mason-null-ls"] = {
      ensure_installed = {
        "stylua",
        "luacheck",
        "jq",
        "yamllint",
        "shellcheck",
        "black",
        "isort",
        "mypy",
      },
    },
    ["mason-nvim-dap"] = {
      -- ensure_installed = { "python" },
    },
    luasnip = {
      filetype_extend = {
        -- javascript = { "javascriptreact" },
      },
      vscode = {
        paths = {},
      },
    },
    ["nvim-autopairs"] = {
      map_c_h = true,
      map_c_w = true,
      map_bs = true,
    },
    cmp = {
      source_priority = {
        nvim_lsp = 1000,
        luasnip = 750,
        buffer = 500,
        path = 250,
      },
    },
    -- Customize Heirline options
    heirline = {
      -- -- Customize different separators between sections
      -- separators = {
      --   tab = { "", "" },
      -- },
      -- -- Customize colors for each element each element has a `_fg` and a `_bg`
      -- colors = function(colors)
      --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
      --   return colors
      -- end,
      -- -- Customize attributes of highlighting in Heirline components
      -- attributes = {
      --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
      --   git_branch = { bold = true }, -- bold the git branch statusline component
      -- },
      -- -- Customize if icons should be highlighted
      -- icon_highlights = {
      --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
      --   file_icon = {
      --     winbar = false, -- Filetype icon in the winbar inactive windows
      statusline = true, -- Filetype icon in the statusline
      --   },
      -- },
    },
    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
      -- Add bindings which show up as group name
      register = {
        -- first key is the mode, n == normal mode
        n = {
          -- second key is the prefix, <leader> prefixes
          ["<leader>"] = {
            -- third key is the key to bring up next level and its displayed
            -- group name in which-key top level menu
            ["b"] = { name = "Buffer" },
          },
        },
      },
    },
  },
  polish = function()
  end,
}

require("nightfox").setup {
  options = {},
  palettes = {
    duskfox = { comment = "#bbaa77" },
  },
  specs = {
    all = {
      syntax = {
        builtin2 = "#ffffff",
        field = "#cccccc",
        ident = "#00f0b0",
        const = "#7aaaff",
        -- keyword = "#7aaaff",
        variable = "#fe8a9a",
        string = "#ecbb77",
        number = "#ff7700",
      },
    },
  },
}

local _options = {
  opt = {
    relativenumber = false,
    number = true,
    spell = true,
    signcolumn = "auto",
    wrap = true,
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()",
    foldmethod = "expr",
    textwidth = 79,
    formatoptions = "tcrqnj",
    scrolloff = 3,
  },
  g = {
    python3_host_prog = "$HOME/.pyenv/versions/py3nvim/bin/python",
    mapleader = " ",
    -- lsp.formatting.format_on_save must be enabled
    autoformat_enabled = true,
    cmp_enabled = true,
    autopairs_enabled = true,
    diagnostics_enabled = true,
    status_diagnostics_enabled = true,
    icons_enabled = true,
    ui_notifications_enabled = true,
    heirline_bufferline = false,
    rooter_patterns = { ".git", "pyproject.toml", "package.json" },
  },
}

local options = function(local_vim)
  local_vim.opt.whichwrap = vim.opt.whichwrap + "l,h"

  for k, v in pairs(_options) do
    for sk, sv in pairs(v) do
      local_vim[k][sk] = sv
    end
  end

  return local_vim
end

config.options = options
return config
