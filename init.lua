local config = {
  updater = { channel = "stable", auto_reload = true },
  -- colorscheme = "duskfox",
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
    root_dir = function() end,
    servers = {
      "pyright",
    },
    ["server-settings"] = {},
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
      ["gv"] = { ":vs<CR>gd", desc = "Open definition in split" },
      -- ["<leader>rq"] = { "<Plug>RestNvim", desc = "run the request under the cursor" },
      -- ["<leader>rp"] = { "<Plug>RestNvimPreview", desc = "preview the request cURL command" },
      -- ["<leader>rr"] = { "<Plug>RestNvimLast", desc = "re-run last request" },
      -- editing
      ["∆"] = { ":m .+1<CR>==", desc = "swap line below <option-j>" },
      ["˚"] = { ":m .-2<CR>==", desc = "swap line above <option-k>" },
      ["œ"] = { "vap:DB<CR>", desc = "Query the selection", silent = true },
    },
    i = {
      ["œ"] = { "<ESC>vap:DB<CR>", desc = "Query the selection", silent = true },
      ["∆"] = { "<ESC>:m .+1<CR>==gi", desc = "swap line below" },
      ["˚"] = { "<ESC>:m .-2<CR>==gi", desc = "swap line above" },
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      -- ["<leader>rs"] = { ':lua require("neotest").summary.toggle()<CR>', desc = "Neotest summary" },
      -- ["<leader>ro"] = { ':lua require("neotest").summary.open()<CR>', desc = "Neotest summary open" },
      -- ["<leader>rc"] = { ':lua require("neotest").summary.close()<CR>', desc = "Neotest summary close" },
      -- ["<leader>rr"] = { ':lua require("neotest").run.run()<CR>', desc = "Neotest run" },
      -- ["<leader>rt"] = { ':lua require("neotest").run.stop()<CR>', desc = "Neotest stop" },
      -- ["<leader>ra"] = { ':lua require("neotest").run.attach()<CR>', desc = "Neotest attach" },
      -- ["<leader>rp"] = { ':lua require("neotest").output.open()<CR>', desc = "Neotest output" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    v = {
      ["<leader>q"] = { ":DB<CR>", desc = "Query the selection", silent = true },
    },
  },
  -- Configure plugins
  -- plugins = {
  --   init = {
  --     { "airblade/vim-rooter" },
  --     { "EdenEast/nightfox.nvim" },
  --   },
  -- },
  polish = function() end,
}
-- { "mzlogin/vim-markdown-toc" },
--   ["null-ls"] = function(config)
--     local null_ls = require "null-ls"
--     config.sources = {
--       null_ls.builtins.diagnostics.mypy.with {},
--       null_ls.builtins.diagnostics.shellcheck.with {
--         filetypes = { "sh", "bash", "zsh" },
--       },
--     }
--     return config
--   end,
--   ["mason-lspconfig"] = { ensure_installed = { "sumneko_lua", "pyright" } },
--   ["mason-null-ls"] = {
--     ensure_installed = {
--       "stylua",
--       "luacheck",
--       "jq",
--       "yamllint",
--       "shellcheck",
--       "black",
--       "isort",
--       "mypy",
--     },
--   },
--   ["nvim-autopairs"] = {
--     map_c_h = true,
--     map_c_w = true,
--     map_bs = true,
--   },

--   ["mason-nvim-dap"] = {
--     -- ensure_installed = { "python" },
--   },
--   cmp = {
--     source_priority = {
--       nvim_lsp = 1000,
--       luasnip = 750,
--       buffer = 500,
--       path = 250,
--     },
--   },

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
    shortmess = "aoOtI",
    --   shortmess=lnosTOIfitxF
    cmdheight = 2,
  },
  g = {
    python3_host_prog = "python",
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

-- vim.g.db_adapter_postgis = vim.g.db_adapter_postgres
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "mysql", "plsql" },
  callback = function(args)
    -- use db completion
    require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
  end,
})

-- local mygroup = vim.api.nvim_create_augroup("vimrc", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.html",
--   group = mygroup,
--   command = "set shiftwidth=4",
-- })
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "*.html",
--   group = "vimrc", -- equivalent to group=mygroup
--   command = "set expandtab",
-- })

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
