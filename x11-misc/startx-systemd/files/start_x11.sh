#!/bin/sh

if test -n "$STARTX11"; then
    unset STARTX11
    exec $(which startx)
fi
