-- cursor color: #61AFEF
local colorscheme = "material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

if colorscheme == "material" then
  require "themes.material"
  --vim.g.material_style = "darker"
  vim.g.material_style = "darker"
  -- oceanic palenight lighter 
  vim.cmd 'colorscheme material'
-- elseif colorscheme == "catppuccin" then
--   require "user.themes.catppuccin"
end
