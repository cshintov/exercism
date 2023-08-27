# Turn it into a function
set -e

function get_exercise_name() {
    #command="exercism download --exercise=library-fees --track=elixir"
    command="$@"
    exercise=$(echo "$command" | awk -F'--exercise=' '{print $2}' | awk '{print $1}')
    echo "$exercise"
}


function download_exercise() {
    # Extract the exercise name from the command
    local exercise_name=$(get_exercise_name "$@")

    # Check if the exercise name was extracted successfully
    if [ -z "$exercise_name" ]; then
        echo "Failed to extract exercise name from the command."
        return 1
    fi

    # Replace the exercise and ex_file variables in the .env file
    sed -i ".bak" -E "s/(exercise=).+/\1$exercise_name/" .env

    # ex_file should be the same as exercise, but with dashes replaced by underscores
    sed -i ".bak" -E "s/(ex_file=).+/\1${exercise_name//-/_}/" .env

    #sed -i.bak -E "s/(ex_file=).+/\1$exercise_name/" .env

    # Remove the backup file created by sed
    rm .env.bak

    # Execute the original command
    $@
}

# Usage:
# download_exercise exercism download --exercise=library-fees --track=elixir
#download_exercise $@

# Get the command from the clipboard
download_command=$(pbpaste)
download_exercise "$download_command"
