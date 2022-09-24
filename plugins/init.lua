local overrides = require "custom.plugins.overrides"

return {

  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  }, -- enables dashboard

  ["folke/which-key.nvim"] = { disable = false },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        override_style = "round",
        overriden_modules = function()
          return require "custom.plugins.statusline-modules"
        end,
      },
      tabufline = {
        lazyload = false, -- to show tabufline by default
        overriden_modules = function()
          return require "custom.plugins.tabufline-modules"
        end,
      },
    },
  },

  ["p00f/nvim-ts-rainbow"] = {},

  ["hrsh7th/cmp-cmdline"] = { after = "cmp-buffer" },

  ["hrsh7th/nvim-cmp"] = {
    override_options = function()
         require "custom.plugins.cmp"
    end,
  },

  ["simrat39/symbols-outline.nvim"] = {
    config = function ()
      require "custom.plugins.symbols-outline"
    end,
  },

  ["rcarriga/nvim-notify"] = {
    config = function ()
      require "custom.plugins.nvim-notify"
    end
  },

  ["iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
    config = function ()
      require "custom.plugins.markdown-preview"
    end
  },

  ["mfussenegger/nvim-dap"] = {
    config = function ()
      require "custom.plugins.dap-config".setup()
    end
  },
  ["rcarriga/nvim-dap-ui"] = {
    config = function ()
      require "custom.plugins.dap-ui"
    end
  },
  ["theHamsta/nvim-dap-virtual-text"] = {
    config = function ()
      require "custom.plugins.dap-virtual-text"
    end
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  ["Civitasv/cmake-tools.nvim"] = {
    config = function ()
      require "custom.plugins.cmake-tools"
    end
  },

  ["folke/trouble.nvim"] = {
    config = function ()
      require "custom.plugins.trouble"
    end
  },

  ["michaelb/sniprun"] = {
    --run = 'bash ./install.sh',
    config = function ()
      require "custom.plugins.sniprun"
    end
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
