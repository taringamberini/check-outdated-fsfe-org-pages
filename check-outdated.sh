#!/bin/bash
#
# check-outdated - is a bash script which checks for outdated fsfe.org pages.
# Read more on https://github.com/taringamberini/check-outdated-fsfe-org-pages
#
# Copyright (C) 2016 Tarin Gamberini <www.taringamberini.com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

OUTDATED_WARNING_TEXT_FRAGMENT="La traduzione di questa pagina potrebbe non essere aggiornata"

# Echoes a blank line if $1 is an empty string.
# $1 a string
function echo_blank() {
if [ -z "$1" ]
then 
    echo
    continue
fi
}

# Echoes the line $1 if it starts with the sharp (#) character.
# $1 a string
function echo_sharp_starting() {
if [[ $1 == \#* ]]
then 
    echo $1
    continue
fi
}

while read line
do
    echo_blank "$line"
    echo_sharp_starting "$line"
    echo Checking $line
    wget -q -O - $line | grep "$OUTDATED_WARNING_TEXT_FRAGMENT"
done

