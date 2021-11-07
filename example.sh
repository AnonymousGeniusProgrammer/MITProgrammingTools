echo "Starting program at $(date)" # Date will be subtituted as a built in program

echo "Running program $0 with $# arguments with pid $$"

for file in "$@"; do
    grep foobar "$file" > /dev/null 2> /dev/null
    # When pattern is not found, grep has exist stauts 1
    # We redirect STDOUT and STDERR to a null register since we don't care about them
    if [[ "$?" -ne 0 ]]; then
    echo "File $file does not have any foobar, adding one"
    echo "# foobar" >> "$file"
    fi 
done