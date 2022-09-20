local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<leader>db"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts = { nowait = true } },
    ["<F5>"] = {"<cmd>lua require'dap'.continue()<cr>"},
    ["<F6>"] = {"<cmd>lua require'dap'.terminate()<cr>"},
  },
}

-- more keybinds!

return M
