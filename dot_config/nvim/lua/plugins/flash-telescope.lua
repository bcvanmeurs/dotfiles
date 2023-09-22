return {
  {
    "folke/flash.nvim",
    opts = {
      -- search = {
      --   mode = function(str)
      --     return "\\<" .. str
      --   end,
      -- },
      -- modes = {
      --   char = {
      --     jump_labels = true,
      --   },
      -- },
    },
  },
  {
    -- add telescope-fzf-native
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        layout_strategy = "flex",
        layout_config = { flip_columns = 200 },
      },
    }
  },
}
