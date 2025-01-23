function up
    if not string match -qr '^[0-9]+$' -- $argv[1]
        echo "Incorrect usage. The correct usage is: up <nonnegative_integer>"
        return 1
    end
    if test -z $argv[1]
        set n 1
    else
        set n $argv[1]
    end
    for i in (seq $n)
        cd ..
    end
end

