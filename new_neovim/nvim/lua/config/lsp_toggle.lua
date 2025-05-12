local M = {}
local winid

function M.toggle()
  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_win_close(winid, true)
    winid = nil
    return
  end

  local util = vim.lsp.util
  local orig = util.open_floating_preview

  util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.focusable = false
    local bufnr, w = orig(contents, syntax, opts, ...)
    winid = w
    util.open_floating_preview = orig
    return bufnr, w
  end

  vim.lsp.buf.signature_help({ silent = true })
end

return M
