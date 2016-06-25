# check-outdated-fsfe-org-pages

`check-outdated.sh` is a bash script that helps me checking if my favourite
translated pages of the fsfe.org web site are outdated.


## Quick Start

    $ git clone https://github.com/taringamberini/check-outdated-fsfe-org-pages.git
    $ cd check-outdated-fsfe-org-pages
    $ ./check-outdated.sh < fsfe-org-urls.txt


## Download

Download `check-outdated.sh` from my github repository:

    $ git clone https://github.com/taringamberini/check-outdated-fsfe-org-pages.git

If you haven't git installed simply
[download `check-outdated.sh`](https://raw.githubusercontent.com/taringamberini/check-outdated-fsfe-org-pages/master/check-outdated.sh)
and save it where you prefer, for example in a directory named
`check-outdated-fsfe-org-pages`.


## Configuration

In the `check-outdated.sh` file set the value of the constant
`OUTDATED_WARNING_TEXT_FRAGMENT` with the fragment of the text shown in the 
outdated warning red box of an outdated page translated in your language.
Because such fragment is searched against the html source code choose it
directly from the source code of an outdated page. For example it might be:

* Italiano
  
      OUTDATED_WARNING_TEXT_FRAGMENT="La traduzione di questa pagina potrebbe non essere aggiornata"

* Deutsch

      OUTDATED_WARNING_TEXT_FRAGMENT="Diese Seite ist eine Übersetzung"

* Русский

      OUTDATED_WARNING_TEXT_FRAGMENT="Перевод этой страницы мог устареть"

* Slovenščina

      OUTDATED_WARNING_TEXT_FRAGMENT="This page may be out of date"


## Usage

Add to the text file `fsfe-org-urls.txt` the URL of `fsfe.org` pages you want to
check. If such file doesn't exists yet create it in the
`check-outdated-fsfe-org-pages` directory.

Then at command line change to the such directory:

    $ cd check-outdated-fsfe-org-pages

and run:

    $ ./check-outdated.sh < fsfe-org-urls.txt


## Details

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

    # Other pages of your interest
    https://fsfe.org/about/basics/freesoftware.it.html
    https://fsfe.org/activities/radiodirective/statement.it.html
    https://fsfe.org/campaigns/pdfreaders/pdfreaders.it.html
    https://fsfe.org/contribute/getyourgraphic.it.html
    https://fsfe.org/contribute/spreadtheword.it.html
    https://fsfe.org/freesoftware/basics/sourcecode.it.html

For each URL it loads the page (you need to be connected to the
Internet) and look for the text configured in the constant
`OUTDATED_WARNING_TEXT_FRAGMENT`: if such text is found the line
which contains it is printed. For example:

    $ ./check-outdated.sh < fsfe-org-urls.txt 
    # Top menu pages
    Checking https://fsfe.org/about/about.it.html
    Checking https://fsfe.org/work.it.html
    Checking https://fsfe.org/campaigns/campaigns.it.html
        La traduzione di questa pagina potrebbe non essere aggiornata rispetto al
    Checking https://fsfe.org/contribute/contribute.it.html
        La traduzione di questa pagina potrebbe non essere aggiornata rispetto al
    Checking https://fsfe.org/press/press.it.html
        La traduzione di questa pagina potrebbe non essere aggiornata rispetto al
    
    # Other pages of your interest
    Checking https://fsfe.org/about/basics/freesoftware.it.html
    Checking https://fsfe.org/acti.it.es/radiodirective/statement.it.html
    Checking https://fsfe.org/campaigns/pdfreaders/pdfreaders.it.html
    Checking https://fsfe.org/contribute/getyourgraphic.it.html
    Checking https://fsfe.org/contribute/spreadtheword.it.html
    Checking https://fsfe.org/freesoftware/basics/sourcecode.it.html

In about 10 seconds I've checked 11 pages and I've discovered that
`campaigns.it.html`, `contribute.it.html`, `press.it.html` are
outdated, and that all the other pages are updated.

