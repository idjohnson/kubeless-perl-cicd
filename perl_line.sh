#!/bin/bash

echo $1 | perl -0777 -pe 's/^.*:(.*)}$/\1/s'
