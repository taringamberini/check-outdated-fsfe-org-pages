# check-outdated-fsfe-org-pages

`check-outdated.sh` is a bash script that checks for outdated fsfe.org pages.


## CONFIGURATION

Set the value of the constant `OUTDATED_WARNING_TEXT_FRAGMENT` with the fragment
of the text shown in the outdated warning red box of a page translated in your
language. Because such fragment is searched against the html source code
choose it directly from the source code of an outdated page. For example it
might be:

* Italiano
  
      OUTDATED_WARNING_TEXT_FRAGMENT="La traduzione di questa pagina potrebbe non essere aggiornata"

* Deutsch

      OUTDATED_WARNING_TEXT_FRAGMENT="Diese Seite ist eine Übersetzung"

* Русский

      OUTDATED_WARNING_TEXT_FRAGMENT="Перевод этой страницы мог устареть"

* Slovenščina

      OUTDATED_WARNING_TEXT_FRAGMENT="This page may be out of date"


## USAGE

Download from my github repository:

    $ git clone https://github.com/taringamberini/check-outdated-fsfe-org-pages.git
    $ cd check-outdated-fsfe-org-pages

Add to a text file, for example `fsfe-org-urls.txt`, the URL of `fsfe.org` pages
you want to check, than run:

    $ ./check-outdated.sh < fsfe-org-urls.txt


## DETAILS

`check-outdated.sh` reads fsf.org page's URL from a txt file. Such file:

* MUST contain a single URL for each line
* MAY contain empty lines
* MAY contain lines which start with the sharp (#) character

Example of a `fsfe-org-urls.txt` content:
    
    # Top menu pages
    https://fsfe.org/about/about.it.html 
    https://fsfe.org/about/work.it.html 
    https://fsfe.org/campaigns/campaigns.it.html 
    https://fsfe.org/contribute/contribute.it.html
    https://fsfe.org/press/press.it.html
    
    # Other pages
    https://fsfe.org/about/basics/freesoftware.it.html
    https://fsfe.org/activities/radiodirective/statement.it.html
    https://fsfe.org/campaigns/pdfreaders/pdfreaders.it.html
    https://fsfe.org/contribute/getyourgraphic.it.html
    https://fsfe.org/contribute/spreadtheword.it.html
    https://fsfe.org/freesoftware/basics/sourcecode.it.html

