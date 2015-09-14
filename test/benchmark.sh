#!/bin/bash

rm -rf .sass-cache

echo ' '
echo 'Su Helpers:'
echo '-----------'
time sass --quiet --no-cache ./scss/su/benchmark-helpers.scss > /dev/null
time sass --quiet --no-cache ./scss/su/benchmark-helpers.scss > /dev/null
time sass --quiet --no-cache ./scss/su/benchmark-helpers.scss > /dev/null

echo ' '
echo 'Su Grid API:'
echo '------------'
time sass --quiet --no-cache ./scss/su/benchmark-api.scss > /dev/null
time sass --quiet --no-cache ./scss/su/benchmark-api.scss > /dev/null
time sass --quiet --no-cache ./scss/su/benchmark-api.scss > /dev/null

echo ' '
echo 'Susy Helpers:'
echo '-------------'
time sass --quiet --no-cache ./scss/susy/benchmark-helpers.scss > /dev/null
time sass --quiet --no-cache ./scss/susy/benchmark-helpers.scss > /dev/null
time sass --quiet --no-cache ./scss/susy/benchmark-helpers.scss > /dev/null

echo ' '
echo 'Susy Parser:'
echo '------------'
time sass --quiet --no-cache ./scss/susy/benchmark-parser.scss > /dev/null
time sass --quiet --no-cache ./scss/susy/benchmark-parser.scss > /dev/null
time sass --quiet --no-cache ./scss/susy/benchmark-parser.scss > /dev/null

echo ' '
echo 'Susy Grid API:'
echo '--------------'
time sass --quiet --no-cache ./scss/susy/benchmark-api.scss > /dev/null
time sass --quiet --no-cache ./scss/susy/benchmark-api.scss > /dev/null
time sass --quiet --no-cache ./scss/susy/benchmark-api.scss > /dev/null
