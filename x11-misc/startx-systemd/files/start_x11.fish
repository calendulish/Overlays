#!/bin/fish

if set -q STARTX11
    set -e STARTX11
    eval (which startx)
end
