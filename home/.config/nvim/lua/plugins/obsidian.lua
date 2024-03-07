return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Systems-and-Security",
        path = "/home/jared/Obsidian/Systems-and-Security"
      },
    },
    ui = {
      enable = false
    },
    completion = {
      min_chars = 0,
    },
  },
  config = function(_, opts) 
    require("obsidian").setup(opts)

    vim.keymap.set("n", "gd", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
      end, { noremap = false, expr = true })
    end
}
