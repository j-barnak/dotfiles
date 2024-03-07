local if_obsidian_directory = function ()
  local path = vim.api.nvim_buf_get_name(0) 
  
  if vim.fn.match(path, "Obsidian") ~= -1 then
    return true
  end
  
  return false
end

local todays_todo = function ()
   return os.date("%Y-%m-%d") .. ".md"
end

return {
  "backdround/global-note.nvim",
  cond = if_obsidian_directory,
  opts = {
    filename = todays_todo,
    directory = "/home/jared/Obsidian/Systems-and-Security/TODO/",
    title = "TODO",
  },
  keys = {
    { "<leader>t", "<cmd>GlobalNote<cr>" },  
  }
}
