% LaTeX thesis template.
% Version 1.6
%
% Department of Computer Science IV,
% University of Mannheim,
% Germany
%
% Based on the KOMA script classes.
% Created by Philip Mildner 2013-2015.
% If you have any feedback or if you find errors contact me:
% mildner@informatik.uni-mannheim.de
%
% Changelog:
% 2015-12-17 Version 1.6
%  - Added option for German bibliography style and glossaries
%  - Changed the font family to Linux Libertine
%  - Use separate glossaries for acronyms and generic glossary
%  - Added optional declaration of assignment
%  - Removed unnecessary author details
%  - Minor layout tweaks
%
% 2015-10-13 Version 1.5
%  - Added booktabs package to get nicer tables
%  - Switched to frontmatter, mainmatter, backmatter instead of manual hacks
%  - Switched to (author, year) citation style
%
% 2014-11-12 Version 1.4
%  - Added version info into PDF keywords
%  - Changed the hyperref colors to friendlier tones
%  - Increased paragraph indent
%  - Always open new chapters on the right page in two sided layout
%
% 2014-06-30 Version 1.3
%  - Added type of work to title page
%  - Added checklist to appendix to check for common mistakes
%  - Added tabu package
%  - Moved makeglossaries to document header
%
% 2013-11-05 Version 1.2
%  - Moved header files to separate class file
%  - Author and title are now included in PDF properties and in declaration of honour
% 
% 2013-10-30 Version 1.1
%  - Moved table captions above the table
%  - Decreased page margins
%
% 2013-06-24 Initial version.

% Basic class options
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pi4-thesis}[2015/12/17 PI4 Thesis Template V1.6]

% Option for language selection.
\let\if@langgerman\iffalse
\DeclareOption{german}{\let\if@langgerman\iftrue}

% Pass otions that are not specified above to the base class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}

\ProcessOptions

% Load base class.
\LoadClass[a4paper,
		   toc=listof,
		   toc=bib,
		   12pt,
		   DIV=10
		   ]{scrbook}
		   
% UTF-8 should be supported by all major editors. If this causes problem change it to another
% encoding (e.g., 'latin1').
\RequirePackage[utf8]{inputenc}
%\RequirePackage{setspace}
%\onehalfspacing
% ---------------------------------

% Title page details
\newcommand{\piivsubject}[1]{\newcommand{\insertsubject}{#1}}
\newcommand{\piivtitle}[1]{\newcommand{\inserttitle}{#1}}
\newcommand{\piivauthor}[1]{\newcommand{\insertauthor}{#1}}
\newcommand{\piivsupervisor}[1]{\newcommand{\insertsupervisor}{#1}}
% ---------------------------------

% Language selection
\if@langgerman
	\RequirePackage[main=ngerman,english]{babel}
	\babeltags{lang-main = ngerman}

	\newcommand{\abstractchap}{\addchap{Zusammenfassung}}
	\newcommand{\declarationofhonorchap}{\chapter{Ehrenwörtliche Erklärung}}
 	\newcommand{\insertsupervisordetails}{Betreuer: \insertsupervisor}
	\newcommand{\insertinstitution}{Lehrstuhl für Praktische Informatik IV\\
	Prof. Dr.-Ing. W. Effelsberg\\
	\vspace{0.25cm}
	Fakultät für Wirtschaftsinformatik\\
	und Wirtschaftsmathematik\\
	\vspace{0.25cm}
	Universität Mannheim}
	\newcommand{\insertauthordetails}{\vspace{0.2cm}
	\insertauthor}

	\newcommand{\insertcitydate}[2]{#1, den #2}
	
	\bibliographystyle{dinat}
\else
	\RequirePackage[main=english,ngerman]{babel}
	\babeltags{lang-main = english}

	\newcommand{\abstractchap}{\addchap{Abstract}}
	\newcommand{\declarationofhonorchap}{\chapter{Declaration of Honour}}
 	\newcommand{\insertsupervisordetails}{Supervisor: \insertsupervisor}
	\newcommand{\insertinstitution}{Department of Computer Science IV\\
	Prof. Dr.-Ing. W. Effelsberg\\
	\vspace{0.25cm}
	School of Business Informatics and Mathematics\\
	University of Mannheim}
	\newcommand{\insertauthordetails}{\vspace{0.2cm}
	\insertauthor}

	\newcommand{\insertcitydate}[2]{#1, #2}
	
	\bibliographystyle{abbrvnat}
\fi

\babeltags{lang-de = ngerman}
\babeltags{lang-en = english}
% ---------------------------------

% Package includes
%
% The following list of packages should provide you a more or less complete basis for your thesis.
% However, it might be required that you change some package options or include new ones. For each
% of the used package a very brief description is given. If you like to know more on a specific
% package I recommend that you read the package documentation at http://www.ctan.org/pkg/ (just
% search for the package name). Of course you also can include more packages if you need them.
%
% Nicer fonts for your document.
\RequirePackage[T1]{fontenc}
\RequirePackage{libertine}
% http://www.khirevich.com/latex/microtype/
\RequirePackage[activate={true,nocompatibility},
				final,
				tracking=true,
				kerning=true,
				spacing=true,
				factor=1100,
				stretch=10,
				shrink=10]{microtype}
\RequirePackage{ellipsis}
% Responsible for the style of bibliography and citations.

% round -> numbers
\RequirePackage[numbers,
				sort&compress]{natbib}
% Brings color to your document.
\RequirePackage[usenames,
				dvipsnames,
				table]{xcolor}
% Better formatting of URLs in the text.
\RequirePackage[hyphens]{url}
% Provides functions for better hyphenation of words.
\RequirePackage{hyphenat}
% Produces clickable links within the PDF file.
\RequirePackage[pdftex,
			unicode=true,
			bookmarks=true,
			hyperfootnotes=false
			]{hyperref}
% A more intelligent reference system
\RequirePackage{cleveref}
% Provides support for including images in your document.
\RequirePackage{graphicx}
% Support for multiple images in one figure environment.
\RequirePackage{subfig}
% More options for tabular envrionments.
\RequirePackage{array}
\RequirePackage{tabu}
\RequirePackage{longtable}
\RequirePackage{booktabs}
% Support for listings (for displaying algorithms, source code, etc.).
\RequirePackage{listings}
% Provides todo notes that help you keep track of what you have to do.
\RequirePackage{todonotes}
% Produces nonsense text. Can be removed as soon as you started writing your own text.
\RequirePackage{blindtext}
% Provides the glossary function.
\RequirePackage[toc,
				acronyms,
				numberedsection=nameref,
				translate=babel]{glossaries}
% Some small improvements for the KOMA script packages.
\RequirePackage{scrhack}
% Allows you to rotate a page correctly in the PDF.
\RequirePackage{pdfpages}
% ---------------------------------

% Language options for specific packages
\if@langgerman
	\renewcommand{\lstlistlistingname}{Auflistungsverzeichnis}
	\renewcommand{\lstlistingname}{Auflistung}
	\renewcommand{\acronymname}{Abkürzungsverzeichnis}
\else
	\renewcommand{\lstlistlistingname}{List of Listings}
	\microtypecontext{spacing=nonfrench}
\fi
% ---------------------------------

% Layout tweaks
%
% Schusterjungen und Hurenkinder verhindern. Siehe deutsches TeX-FAQ (6.1.3)
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000
% ---------------------------------

% Title page
\title{\textnormal{\textsc{\Large \insertsubject}}\\
\vspace{0.4cm}
\inserttitle}
\author{\insertauthordetails}
\publishers{\insertsupervisordetails\\
\vspace{1cm}
\insertinstitution}
% ---------------------------------

% Adaptions for the actual document
\AtBeginDocument
{
\hypersetup{
	pdftitle = {\inserttitle},
	pdfauthor = {\insertauthor},
	pdfsubject = {\insertsubject},
	pdfkeywords = {PI4 Template v1.6},
 	citebordercolor = {.36 .93 0},
 	linkbordercolor = {1 .6 .33},
 	menubordercolor = {1 .6 .33},
 	urlbordercolor = {.39 .82 1},
 	pdfborder = {0 0 .5}
}

\setlength{\parindent}{15pt}

\frontmatter
\maketitle
}
% ---------------------------------
