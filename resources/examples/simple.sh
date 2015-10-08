#!/bin/bash

# ARG_POSITIONAL_SINGLE([filename])
# ARG_OPTIONAL_SINGLE([unit],[u],[What unit we accept (b for bytes, k for kilobytes, M for megabytes)],[b])
# ARG_VERSION([echo $0 v0.1])
# ARG_OPTIONAL_BOOLEAN([verbose])
# ARG_HELP([This program tells you size of file that you pass to it in chosen units.])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY ARGBASH v1.1.0 one line above ###
# THE DEFAULTS INITIALIZATION --- POSITIONALS
# THE DEFAULTS INITIALIZATION --- OPTIONALS
_ARG_UNIT="b"
_ARG_VERBOSE=off

# THE PRINT HELP FUNCION
function print_help
{
	echo "This program tells you size of file that you pass to it in chosen units."
	echo "Usage: $0 <filename> [--unit <arg>] [--version] [--(no-)verbose] [--help]"
	echo -e "\t<filename>: "
	echo -e "\t-u,--unit: What unit we accept (b for bytes, k for kilobytes, M for megabytes) (default: '""b""')"
	echo -e "\t-v,--version: Prints version"
	echo -e "\t--verbose,--no-verbose:  (default: '"off"')"
	echo -e "\t-h,--help: Prints help"
}
# THE PARSING ITSELF
while test $# -gt 0
do
	_key="$1"
	case "$_key" in
		-u|--unit)
			test $# -lt 2 && { echo "Missing value for the positional argument." >&2; exit 1; }
			_ARG_UNIT="$2"
			shift
			;;
		-v|--version)
			echo $0 v0.1
			exit 0
			;;
		--no-verbose|--verbose)
			_ARG_VERBOSE="on"
			test "${1:0:5}" = "--no-" && _ARG_VERBOSE="off"
			;;
		-h|--help)
			print_help
			exit 0
			;;
		*)
		    	POSITIONALS+=("$1")
			;;
	esac
	shift
done

POSITIONAL_NAMES=('_ARG_FILENAME' )
test ${#POSITIONALS[@]} -lt 1 && { ( echo "FATAL ERROR: Not enough positional arguments."; print_help ) >&2; exit 1; }
test ${#POSITIONALS[@]} -gt 1 && { ( echo "FATAL ERROR: There were spurious positional arguments --- we expect at most 1."; print_help ) >&2; exit 1; }
for (( ii = 0; ii <  ${#POSITIONALS[@]}; ii++))
do
	eval "${POSITIONAL_NAMES[$ii]}=\"${POSITIONALS[$ii]}\""
done
# OTHER STUFF GENERATED BY Argbash


### END OF CODE GENERATED BY Argbash ### ])
# [ <-- needed because of Argbash

# opening escape square bracket:

# ARG_HELP  <-- Unlike one above, his one does not disappear, it is behind the escape bracket.

# Now we take the parsed data and assign them no nice-looking variable names,
# sometimes after a basic validation
VERBOSE=$_ARG_VERBOSE
UNIT=$_ARG_UNIT

test -f $_ARG_FILENAME || { echo "Filename $_ARG_FILENAME doesn't seem to belong to a file"; exit 1; }
FILENAME="$_ARG_FILENAME"

if [ $VERBOSE = on ]
then
	_b="bytes (B)"
	_kb="kilobytes (kB)"
	_mb="megabytes (MB)"
else
	_b="B"
	_kb="kB"
	_mb="MB"
fi

SIZE_BYTES=$(wc -c "$FILENAME" | cut -f 1 -d ' ')

test "$UNIT" = b && echo $SIZE_BYTES $_b && exit 0

SIZE_KILOBYTES=$(expr $SIZE_BYTES / 1024)
test "$UNIT" = k && echo $SIZE_KILOBYTES $_kb && exit 0

SIZE_MEGABYTES=$(expr $SIZE_KILOBYTES / 1024)
test "$UNIT" = M && echo $SIZE_MEGABYTES $_mb && exit 0

test "$VERBOSE" = on && echo "The unit '$UNIT' is not supported!"
exit 1

# closing escape square bracket:
# ] <-- needed because of Argbash