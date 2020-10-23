#!/usr/bin/env bash

## List project components

# Build local index including local defs, and copy

test -d "$(dirname "$3")" || mkdir -p "$(dirname "$3")"

build-ifchange .meta/stat/index/components-local.list
cat .meta/stat/index/components-local.list >"$3"

build-stamp <"$3"
cp "$3" .meta/stat/index/components.list
