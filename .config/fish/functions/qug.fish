function qug
    qutebrowser --target window "https://www.google.com/search?q=$argv&hl=zh-CN" >/dev/null 2>&1 & disown
end
