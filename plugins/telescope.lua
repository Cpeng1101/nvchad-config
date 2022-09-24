local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify "telescope not found!"
  return
end

local previewers = require "telescope.previewers"
local Job = require "plenary.job"
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end,
  }):sync()
end

telescope.setup {
  defalut = {
    buffer_previewer_maker = new_maker,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      -- find_command = { "find", "-type", "f" },
      find_command = { "fd", "-H", "-I" }, -- "-H" search hidden files, "-I" do not respect to gitignore
    },
  },
}
