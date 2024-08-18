return {
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "garymjr/nvim-snippets", enabled = false },
  { "MeanderingProgrammer/markdown.nvim", enabled = false },
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
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_y = {}
      opts.sections.lualine_z = {
        { "location", padding = { left = 1, right = 1 } },
      }
      local colors = {
        color0 = "#2f163a",

        color1 = "#b06ae3",
        color2 = "#36c692",
        color3 = "#80a0ff",
        color4 = "#e3c78a",
        color5 = "#ff5189",

        color6 = "#1c1c1c",

        color7 = "#9e9e9e",

        color8 = "#c6c6c6",
      }

      opts.options.component_separators = ""
      opts.options.section_separators = ""

      opts.options.theme = {
        normal = {
          a = { fg = colors.color6, bg = colors.color1, gui = "bold" },
          b = { fg = colors.color1, bg = colors.color0 },
          c = { fg = colors.color8, bg = colors.color0 },
        },
        insert = {
          a = { fg = colors.color6, bg = colors.color2, gui = "bold" },
          b = { fg = colors.color2, bg = colors.color0 },
        },
        visual = {
          a = { fg = colors.color6, bg = colors.color3, gui = "bold" },
          b = { fg = colors.color3, bg = colors.color0 },
        },
        command = {
          a = { fg = colors.color6, bg = colors.color4, gui = "bold" },
          b = { fg = colors.color4, bg = colors.color0 },
        },
        replace = {
          a = { fg = colors.color6, bg = colors.color5, gui = "bold" },
          b = { fg = colors.color5, bg = colors.color0 },
        },
        inactive = {
          a = { fg = colors.color7, bg = colors.color0 },
          b = { fg = colors.color7, bg = colors.color0 },
          c = { fg = colors.color7, bg = colors.color0 },
        },
      }

      return opts
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
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = { highlight_whole_line = false },
      },
    },
  },
  {
    "rhysd/conflict-marker.vim",
    init = function()
      vim.g.conflict_marker_highlight_group = ""
      vim.g.conflict_marker_begin = "^<<<<<<< .*$"
      vim.g.conflict_marker_end = "^>>>>>>> .*$"
      vim.g.conflict_marker_common_ancestors = "^||||||| .*$"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        advanced_git_search = {
          diff_plugin = "diffview",
        },
      },
    },
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    keys = {
      {
        "<leader>gc",
        "<cmd>AdvancedGitSearch search_log_content<cr>",
        desc = "Git - search commit by code",
      },
      {
        "<leader>gt",
        "<cmd>AdvancedGitSearch search_log_content_file<cr>",
        desc = "Git - search commits by code (current file)",
      },
      {
        "<leader>gd",
        "<cmd>AdvancedGitSearch diff_commit_file<cr>",
        desc = "Git - diff current file with commit",
      },
      {
        "<leader>gB",
        "<cmd>AdvancedGitSearch diff_branch_file<cr>",
        desc = "Git - diff current file with commit",
      },
      {
        "<leader>gf",
        "<cmd>AdvancedGitSearch changed_on_branch<cr>",
        desc = "Git - forkpoint differences",
      },
      {
        "<leader>gf",
        "<cmd>AdvancedGitSearch checkout_reflog<cr>",
        desc = "Git - reflog checkout",
      },
    },
    config = function()
      require("telescope").load_extension("advanced_git_search")
      vim.keymap.set("n", "<c-g>", function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end)
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
  },
}
