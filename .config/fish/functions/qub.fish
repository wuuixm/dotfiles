function qub
    qutebrowser --target window "https://www.bing.com/search?q=$argv&setlang=zh" >/dev/null 2>&1 & disown
end
