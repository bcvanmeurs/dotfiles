return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["a"] = {
            "add",
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
        },
      },
    },
  },
}
