#!/bin/bash
set -x

# cat the perl_line.sh and pull out the perl statement
cat perl_line.sh | tail -n1 | sed 's/\$1/+ JSON.stringify(event.data) +/' | sed 's/\\/\\\\/g' | sed "s/'/\\\'/g" > t.o
# escape for use in RegExp
ESCAPED_REPLACE=$(printf '%s\n' "`cat t.o`" | sed -e 's/[\/&]/\\&/g')

# cat the base one and sub in our bash
cat function.yaml | sed "s/^\(.*\.execSync.'\).*\(...toString.*\)$/\1$ESCAPED_REPLACE\2/" > function_gen.yaml
