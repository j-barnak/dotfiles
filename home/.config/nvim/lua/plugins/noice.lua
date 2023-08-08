return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    keys = {
      { "<leader>fn", "<cmd>NoiceTelescope<cr>", desc = "Noice" },
      {
        "<C-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<C-f>"
          end
        end,
        desc = "Scroll forward",
        expr = true,
        mode = { "i", "n", "s" },
      },
      {
        "<C-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<C-b>"
          end
        end,
        desc = "Scroll backward",
        expr = true,
        mode = { "i", "n", "s" },
      },
    },
    config = function()
      local cmdline_formats = require("noice.config").defaults().cmdline.format
      for _, format in pairs(cmdline_formats) do
        -- TODO: Set this to false when https://github.com/folke/noice.nvim/pull/558 gets merged.
        format.conceal = true
      end

      require("noice").setup({
        presets = {
          lsp_doc_border = true,
          long_message_to_split = true,
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            auto_open = { enabled = false },
          },
        },
        status = {
          lsp_progress = { event = "lsp", kind = "progress" },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
                { find = "%d fewer lines" },
                { find = "%d more lines" },
              },
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "lsp",
              kind = "progress",
            },
            opts = { skip = true },
          },
        },
        cmdline = {
          format = cmdline_formats,
        },
        format = {
          progress = { align = "left" },
        },
      })
    end,
  },
}
