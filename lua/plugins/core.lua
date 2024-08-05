-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.moonflyTransparent = true
      vim.g.moonflyUnderlineMatchParen = true

      local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "moonfly",
        callback = function()
          vim.api.nvim_set_hl(0, "Visual", { bg = "#2c2c2c" })
          vim.api.nvim_set_hl(0, "LineNr", { bg = "#130618", fg = "#b354c6" })
          vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#1b1629" })

          vim.api.nvim_set_hl(0, "diffAdded", { bg = "#1c2813", fg = "#8cc85f" })
          vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#331111", fg = "#FF5454" })

          vim.api.nvim_set_hl(0, "ConflictMarkerBegin", { bg = "#2f7366" })
          vim.api.nvim_set_hl(0, "ConflictMarkerOurs", { bg = "#1f3631" })
          vim.api.nvim_set_hl(0, "ConflictMarkerTheirs", { bg = "#233547" })
          vim.api.nvim_set_hl(0, "ConflictMarkerEnd", { bg = "#2f628e" })
          vim.api.nvim_set_hl(0, "ConflictMarkerCommonAncestorsHunk", { bg = "#4f3157" })
          vim.api.nvim_set_hl(0, "ConflictMarkerCommonAncestors", { bg = "#754a81" })
          vim.api.nvim_set_hl(0, "ConflictMarkerSeparator", { bg = "#2f628e" })

          vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "#311211", fg = "#FF5454" })
          vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "#312611", fg = "#FFC552" })
          vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "#112431", fg = "#52B6FF" })
          vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "#1A3111", fg = "#83FF52" })
        end,
        group = custom_highlight,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },

  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      table.insert(opts.left, {
        title = "Aerial",
        ft = "aerial",
        pinned = true,
        open = "AerialOpen",
      })
    end,
  },

  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "garymjr/nvim-snippets", enabled = false },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
}
