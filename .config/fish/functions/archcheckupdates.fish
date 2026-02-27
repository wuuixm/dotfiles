function archcheckupdates
    echo "📦 官方仓库更新："
    set repo_updates (checkupdates 2>/dev/null)

    if test (count $repo_updates) -eq 0
        echo "  ✔ 无更新"
    else
        for pkg in $repo_updates
            echo $pkg
        end
        echo "共 "(count $repo_updates)" 个"
    end

    echo
    echo "🌱 AUR 更新："
    set aur_updates (paru -Qua 2>/dev/null)

    if test (count $aur_updates) -eq 0
        echo "  ✔ 无更新"
    else
        for pkg in $aur_updates
            echo $pkg
        end
        echo "共 "(count $aur_updates)" 个"
    end
end
