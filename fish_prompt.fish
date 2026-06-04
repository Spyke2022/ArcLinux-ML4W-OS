function fish_prompt
    set_color cyan
    echo -n "Silas-CachyOS "
    set_color normal
    echo -n (prompt_pwd)
    set_color normal
    echo -n " ❯ "
end

