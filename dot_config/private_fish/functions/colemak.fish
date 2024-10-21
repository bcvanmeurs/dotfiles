function colemak
    set vars_file ~/.config/fish/conf.d/vars.fish

    # Function to display help
    function display_help
        echo "Usage: colemak [option]"
        echo "Options:"
        echo "  -h, --help    Show this help message"
        echo "  t, true       Set COLEMAK to true"
        echo "  f, false      Set COLEMAK to false"
        echo "  (no option)   Toggle the current value of COLEMAK"
    end

    # Function to toggle the current value
    function toggle_value
        if test "$COLEMAK" = true
            set -gx COLEMAK false
        else
            set -gx COLEMAK true
        end
    end

    # Check if the vars.fish file exists
    if not test -f "$vars_file"
        echo "Error: $vars_file not found."
        return 1
    end

    # Check if the user provided an argument
    if not count $argv >/dev/null
        # No argument provided, toggle the current value
        toggle_value
    else
        switch $argv[1]
            case -h --help
                display_help
                return 0
            case t true
                set -gx COLEMAK true
            case f false
                set -gx COLEMAK false
            case '*'
                echo "Invalid argument. Use 't', 'f', 'true', or 'false'."
                return 1
        end
    end

    # Construct the new line and update the file
    set replace_line "set -gx COLEMAK $COLEMAK"
    set -gx COLEMAK $COLEMAK
    sed -i "" "s/^set -gx COLEMAK .*/$replace_line/" "$vars_file"
    echo "Updated COLEMAK to $COLEMAK"
    return 0
end
