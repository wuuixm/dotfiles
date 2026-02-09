local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ==========================================
-- 1. 基础外观
-- ==========================================
config.color_scheme = "matugen_theme"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0

-- 设置背景透明度 (0.0 完全透明 - 1.0 完全不透明)
config.window_background_opacity = 0.8
-- 配合透明度，去除毛玻璃效果
-- config.macos_window_background_blur = 20 

-- 去除标签栏
config.enable_tab_bar = false
config.window_decorations = "RESIZE" -- 仅保留调整大小的边框，去掉标题栏

-- ==========================================
-- 2. 性能与显示优化
-- ==========================================
-- config.front_end = "WebGpu" -- 开启最强的渲染性能
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- ==========================================
-- 3. 全键盘操作配置
-- ==========================================
local act = wezterm.action
config.keys = {
  -- 【Vim 模式】进入后可以像在 Vim 里一样 h/j/k/l 移动并 y 复制
  { key = 'Space', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
  
  -- 【快速选择】：按一下，屏幕上所有的路径、哈希、URL 都会显示字母
  -- 只要按对应的字母，内容就会直接存入剪贴板
  { key = 'Enter', mods = 'SHIFT|CTRL', action = act.QuickSelect },

  -- 【快速搜索】直接在终端输出里搜索关键字
  { key = 'f', mods = 'SHIFT|CTRL', action = act.Search { CaseInSensitiveString = "" } },

  -- 【字体缩放】
  { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
}


return config
