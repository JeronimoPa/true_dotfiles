local function neotree_width_percent(percent)
  return math.floor(vim.o.columns * percent)
end
require("neo-tree").setup({
  window = {
    width = neotree_width_percent(0.20), -- 30%
  },
})
