-- Helper Function
local get_relative_line = function(offset)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local target = line + offset
  return vim.api.nvim_buf_get_lines(0, target - 1, target, false)[1]
end

local M = {}

function M.is_template()
  local unpack = table.unpack or unpack

  local line = vim.api.nvim_get_current_line()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  if not (vim.o.filetype == "cpp" or vim.o.filetype == "c") then
    line = line:sub(1, c) .. "<" .. line:sub(c + 1)
    vim.api.nvim_set_current_line(line)
    vim.api.nvim_win_set_cursor(0, { r, c + 1 })
    return
  end

  if vim.fn.match({ line }, "template") == 0 then
    -- c - 1 = 2 chars before the cursor
    line = line:sub(1, c) .. "<>" .. line:sub(c + 1)
    vim.api.nvim_set_current_line(line)
    vim.api.nvim_win_set_cursor(0, { r, c + 1 })
    return
  end

  if vim.fn.match({ line }, "#include") == 0 then
    line = line:sub(1, c) .. "<>" .. line:sub(c + 1)
    if line:sub(c, c) ~= " " then
      line = line:sub(1, c) .. " " .. line:sub(c + 1)
      c = c + 1
    end
    vim.api.nvim_set_current_line(line)
    vim.api.nvim_win_set_cursor(0, { r, c + 1 })
    return
  end
  if vim.fn.match({ line:sub(0, c) }, "cast\\s*$") == 0 then
    -- c - 1 = 2 chars before the cursor
    line = line:sub(1, c) .. "<>" .. line:sub(c + 1)
    vim.api.nvim_set_current_line(line)
    vim.api.nvim_win_set_cursor(0, { r, c + 1 })
    return
  end

  -- c is 1 before the cursor
  line = line:sub(1, c) .. "<" .. line:sub(c + 1)
  vim.api.nvim_set_current_line(line)
  vim.api.nvim_win_set_cursor(0, { r, c + 1 })
  vim.cmd("redraw") -- redraw to add the first <
  -- since we added < the lsp can detect it
  local old_handler = vim.lsp.handlers["textDocument/signatureHelp"]
  vim.lsp.handlers["textDocument/signatureHelp"] = function(_, info)
    if info and info.signatures and info.signatures[1] and info.signatures[1].label then
      local functionsig = info.signatures[1].label
      if vim.fn.match({ functionsig }, "^\\w\\+<") == 0 then
        -- c + 1 is after including the openning pair very shady code lol
        vim.api.nvim_set_current_line(line:sub(0, c + 1) .. ">" .. line:sub(c + 2))
      end
    end
  end
  vim.lsp.buf.signature_help()
  vim.lsp.handlers["textDocument/signatureHelp"] = old_handler
end

function M.struct_or_class()
  local line = get_relative_line(0)
  local previous_line = get_relative_line(-1)

  if vim.fn.match(line, "struct") ~= -1 or vim.fn.match(line, "class") ~= -1 then
    return true
  end

  if vim.fn.match(previous_line, "struct") ~= -1 or vim.fn.match(previous_line, "class") ~= -1 then
    return true
  end

  return false
end

return M
