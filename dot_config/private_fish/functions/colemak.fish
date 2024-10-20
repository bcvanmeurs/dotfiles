function colemak
    set vars_file ~/.config/fish/conf.d/vars.fish

    # Check if the user provided an argument (either "true" or "false")
    if not count $argv >/dev/null
        echo "Usage: colemak true|false"
        return 1
    end

    # Check if the argument is valid (either "true" or "false")
    if test "$argv[1]" != true -a "$argv[1]" != false
        echo "Invalid argument. Use 'true' or 'false'."
        return 1
    end

    # Create the line to search for
    set search_line "set -gx COLEMAK "

    # Construct the new line based on the user's argument
    set replace_line "set -gx COLEMAK $argv[1]"
    set -gx COLEMAK $argv[1]

    # Check if the vars.fish file exists
    if test -f "$vars_file"
        # Replace the COLEMAK line with the new value using quotes around the path
        sed -i "" "s/^$search_line.*/$replace_line/" "$vars_file"
        echo "Updated COLEMAK to $argv[1]"
        return 0
    else
        echo "Error: $vars_file not found."
        return 1
    end
end
