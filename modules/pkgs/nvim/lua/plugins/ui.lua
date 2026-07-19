-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("gruvbox").setup({
--         contrast = "hard",
--         transparent_mode = true,
--         italic = {
--           strings = true,
--           comments = true,
--           operators = false,
--           folds = true,
--         },
--       })
--
--       vim.cmd("colorscheme gruvbox")
--
--       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end,
--   },
-- }

return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.g.everforest_background = "hard"
      vim.g.everforest_transparent_background = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_italic_comments = 1

      vim.cmd("colorscheme everforest")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
