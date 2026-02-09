-- ==========================================================================
-- 1. 基础选项 (编辑器行为)
-- ==========================================================================
vim.g.mapleader = " "              -- 空格作为 Leader 键
vim.opt.clipboard = "unnamedplus"  -- 同步剪贴板 (Wayland 下需 wl-clipboard)
vim.opt.number = true              -- 显示行号
vim.opt.relativenumber = true      -- 相对行号
vim.opt.mouse = 'a'                -- 开启鼠标支持
vim.opt.termguicolors = true       -- 开启真彩色
vim.opt.cursorline = true          -- 高亮当前行
vim.opt.expandtab = true           -- 空格代替制表符
vim.opt.shiftwidth = 4             -- 缩进 4 格
vim.opt.ignorecase = true          -- 搜索忽略大小写
vim.opt.smartcase = true           -- 智能大小写

-- 开启 Neovim 内置的高亮和文件类型检测 
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- ==========================================================================
-- 2. 插件管理器 (lazy.nvim 自动引导)
-- ==========================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==========================================================================
-- 3. 插件清单 
-- ==========================================================================
require("lazy").setup({
    -- 【文件夹编辑】像操作文本一样操作文件
    {
        'stevearc/oil.nvim',
        opts = {},
        keys = {
            { "-", "<CMD>Oil<CR>", desc = "打开父级目录" },
        },
    },

    -- 【模糊搜索】基于系统 fzf 的极速引擎
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { "<leader>ff", function() require('fzf-lua').files() end, desc = "搜索文件" },
            { "<leader>fg", function() require('fzf-lua').live_grep() end, desc = "搜索内容" },
            { "<leader>fb", function() require('fzf-lua').buffers() end, desc = "搜索缓冲区" },
        },
    },

    -- 【极简括号补全】
    {
        'echasnovski/mini.pairs',
        version = '*',
        config = function() require('mini.pairs').setup() end
    },

    -- 【色彩方案】
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function() 
            vim.cmd.colorscheme "catppuccin-mocha" 
        end
    },
})

-- ==========================================================================
-- 4. 关键快捷键 
-- ==========================================================================
-- 输入模式下快速按 jj 返回 Normal 模式
vim.keymap.set('i', 'jj', '<Esc>', { desc = "退出插入模式" })
-- 快速保存
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>')
-- 快速退出
vim.keymap.set('n', '<leader>q', '<CMD>q<CR>')