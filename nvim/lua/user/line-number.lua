function relativeln(target)
  if vim.b.lnstatus == nil then
    vim.b.lnstatus = "number"
  end

  if vim.b.lnstatus ~= "nonumber" then
    if target == "number" then
      vim.o.number = true
      vim.o.relativenumber = false
    else
      vim.o.number = true
      vim.o.relativenumber = true
    end
  else
    vim.o.number = false
  end
end

-- Show relative line number when in command mode and absolute line number in edit mode, except for NvimTree
local _group = vim.api.nvim_create_augroup("LineNumber", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_buf_get_name(0):match("NvimTree_") == nil then
      relativeln("relativenumber")
    end
  end,
  once = true,
  group = _group,
})
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_buf_get_name(0):match("NvimTree_") == nil then
      relativeln("number")
    end
  end,
  once = true,
  group = _group,
})