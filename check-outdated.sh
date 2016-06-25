#!/bin/bash
#
# check-outdated.sh version 1.0
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
#
#
# DESCRIPTION
#
# check-outdated.sh is a bash script that checks for outdated fsfe.org pages.
#
#
# CONFIGURATION
#
# Set the value of the constant OUTDATED_WARNING_TEXT_FRAGMENT with the fragment
# of the text shown in the outdated warning red box of a page translated in your
# language. Because such fragment is searched against the html source code
# choose it directly from the source code of an outdated page. For example it
# might be:
#
# * Italiano
#       OUTDATED_WARNING_TEXT_FRAGMENT="La traduzione di questa pagina potrebbe non essere aggiornata"
# * Deutsch
#       OUTDATED_WARNING_TEXT_FRAGMENT="Diese Seite ist eine Übersetzung"
# * Русский
#       OUTDATED_WARNING_TEXT_FRAGMENT="Перевод этой страницы мог устареть"
# * Slovenščina
#       OUTDATED_WARNING_TEXT_FRAGMENT="This page may be out of date"
#
#
# USAGE
#
# Download from my github repository:
# 
#     $ git clone https://github.com/taringamberini/check-outdated-fsfe-org-pages.git
#     $ cd check-outdated-fsfe-org-pages
# 
# Add to a text file, for example `fsfe-org-urls.txt`, the URL of `fsfe.org` pages
# you want to check, than run:
# 
#     $ ./check-outdated.sh < fsfe-org-urls.txt
# 
#
# DETAILS
#
# check-outdated.sh reads fsf.org page's URL from a txt file. Such file:
#
# * MUST contain a single URL for each line
# * MAY contain empty lines
# * MAY contain lines which start with the sharp (#) character
#
# Example of a fsfe-org-urls.txt content:
#     
#     # Top menu pages
#     https://fsfe.org/about/about.it.html 
#     https://fsfe.org/work.it.html 
#     https://fsfe.org/campaigns/campaigns.it.html 
#     https://fsfe.org/contribute/contribute.it.html
#     https://fsfe.org/press/press.it.html
#     
#     # Other pages
#     https://fsfe.org/about/basics/freesoftware.it.html
#     https://fsfe.org/activities/radiodirective/statement.it.html
#     https://fsfe.org/campaigns/pdfreaders/pdfreaders.it.html
#     https://fsfe.org/contribute/getyourgraphic.it.html
#     https://fsfe.org/contribute/spreadtheword.it.html
#     https://fsfe.org/freesoftware/basics/sourcecode.it.html

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

