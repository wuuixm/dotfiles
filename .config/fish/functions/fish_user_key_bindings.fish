function fish_user_key_bindings
    # 启用 vi / vim 键位
    fish_vi_key_bindings --no-erase

    # insert 模式下用 jj 退出到 normal（等价 Esc）
    bind -M insert jj 'set fish_bind_mode default; commandline -f backward-char; commandline -f repaint'
    # normal 模式下用 v 用 $EDITOR 编辑整条命令
    bind -M default v edit_command_buffer
end

