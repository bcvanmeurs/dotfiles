if os.getenv("COLEMAK") == "true" then
  return {
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        window = {
          mappings = {
            ["e"] = "", -- undo mapping
            ["E"] = "toggle_auto_expand_width", -- from e to E
            ["Z"] = "expand_all_nodes", -- not activated by default
          },
        },
      },
    },

    -- Removing mappings with i in visual mode
    {
      "echasnovski/mini.indentscope",
      opts = {
        mappings = {
          -- Textobjects
          object_scope = "hi", -- from ii
        },
      },
    },
    {
      "lewis6991/gitsigns.nvim",
      -- https://www.lazyvim.org/plugins/editor#gitsignsnvim
      opts = {
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- stylua: ignore start
          map({ "o", "x" }, "hh", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk") -- from ih

          -- these stayed the same
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Prev Hunk")
          map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
          map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
          map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
          map("n", "<leader>ghd", gs.diffthis, "Diff This")
          map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        end,
      },
    },
    {
      "echasnovski/mini.ai",
      -- https://www.lazyvim.org/plugins/coding#miniai
      -- TODO: needs some checking, also the inside group name on visual mode for i is still there
      keys = {
        { "a", mode = { "x", "o" } },
        { "h", mode = { "x", "o" } }, -- from i
      },
      event = "VeryLazy",
      dependencies = { "nvim-treesitter-textobjects" },
      opts = function()
        local ai = require("mini.ai")
        return {
          n_lines = 500,
          custom_textobjects = {
            o = ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {}),
            f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
            c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          },
          mappings = {
            -- Main textobject prefixes
            around = "a",
            inside = "h", -- from i

            -- Next/last variants
            around_next = "an",
            inside_next = "hn", -- from in
            around_last = "al",
            inside_last = "hl", -- from il

            -- Move cursor to corresponding edge of `a` textobject
            goto_left = "g[",
            goto_right = "g]",
          },
        }
      end,
      config = function(_, opts)
        require("mini.ai").setup(opts)
        -- register all text objects with which-key
        ---@type table<string, string|table>
        local h = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          f = "Function",
          o = "Block, conditional, loop",
          q = "Quote `, \", '",
          t = "Tag",
        }
        local a = vim.deepcopy(h)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(h)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ n = "Next", l = "Last" }) do
          h[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register({
          mode = { "o", "x" },
          h = h,
          a = a,
        })
      end,
    },
  }
else
  return {}
end
