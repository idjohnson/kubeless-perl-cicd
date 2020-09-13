#!/bin/bash

echo $1 | perl -pe 's/^.*:(.*)}$/\1/s'
