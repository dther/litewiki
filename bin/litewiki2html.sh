#!/bin/sh

# Convert *.wiki.md files into a hyperlinked HTML wiki.
# In short:
#  * Expand shorthand links ('[foo.wiki.bar]')
#    to standard markdown links ('[foo](foo.wiki.bar)')
#  * Convert ".wiki.md" extensions to ".wiki.html"
#  * Compile *.wiki.md files into *.wiki.html files
#  * Recursively do this for each *.wiki.d directory

# Check if $LITEWIKI is defined
[ -z "$LITEWIKI" ] && echo "Please set \$LITEWIKI." && exit 1

# set initial folder & top level output location
currentdir="$LITEWIKI"
outputdir="$LITEWIKI/html"


# Convert all shorthand links in file at $1 to markdown links and
# convert all mentions of .wiki.md to .wiki.html,
# outputting to stdout
expandlinks() {
    sed -e 's/\[\(.*\)\(\.wiki\..*\)\]/[\1](\1\2)/g' -e 's/.wiki.md/.wiki.html/g' "$1"
}

# Recursively convert all files at directory $1 and output them to directory $2.
convertdir() {
    # Make tmp buffers
    # so that i avoid using sed -i and therefore am POSIX compliant
    # Well. Mostly. mktemp is present on almost every *nix system made in the last decade.
    sedbuffer=$(mktemp)

    # Ensure that output directory exists
    [ -e "$2" ] || mkdir "$2"

    for currentfile in "$1"/*; do
        case $currentfile in
            # RECURSE
            *.wiki.d) convertdir "$currentfile" "$2/${currentfile#$1}";;
            # convert *.md
            *.wiki.md) 
                # Strip .md and path to get name of new file
                # TODO: Add an html template for maximum style points.
                newfile=${currentfile%.md}
                newfile=${newfile#$1}
                expandlinks "$currentfile" > "$sedbuffer"
                markdown -f del "$sedbuffer" > "$2/$newfile.html"
            ;;
            # Prevent symlink loops...
            $2) ;;
            # just make a symbolic link and hope it works
            *) ln -fs "$currentfile" "$2" ;;
        esac
    done

    # clean up
    rm -rf "$sedbuffer"
}

convertdir "$currentdir" "$outputdir"
