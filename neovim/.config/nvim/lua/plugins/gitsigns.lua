return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "j-barnak/nvim-window",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>hd", gs.diffthis, "Diff This")
      --  FIXME: Awful hack on how to exit windows
      map("n", "<leader>hD",
        function()
          require('nvim-window').pick()
          vim.cmd(':q')
        end
        , "Go back to original window")
    end,
  },
}
