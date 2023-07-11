return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["e"] = "",
          ["a"] = {
            "add",
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
          ["c"] = {
            "copy",
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
          ["m"] = {
            "move",
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
          ["Z"] = "expand_all_nodes",
          ["E"] = "toggle_auto_expand_width",
        },
      },
    },
  },
}
