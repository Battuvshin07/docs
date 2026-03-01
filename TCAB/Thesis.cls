\NeedsTeXFormat{LaTeX2e}[2023/11/01]
\ProvidesClass{Thesis}[2022/04/12 v0.1 testclass]

\LoadClass{report}
\ProcessOptions

% --- Basic utilities and safer font/encoding defaults ---
\RequirePackage[T1,T2A]{fontenc}   % support for Latin (T1) and Cyrillic (T2A)
\RequirePackage[utf8]{inputenc}    % utf8 input
\RequirePackage{textcomp}          % extra text symbols
\RequirePackage{lmodern}           % vector fonts; well supported for T1/T2A
\RequirePackage{microtype}         % typographic improvements (optional but helpful)

\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
	January\or February\or March\or April\or May\or June\or
	July\or August\or September\or October\or November\or December\fi
	\space \number\year}

% === Packages used in original class ===
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{epstopdf}
\RequirePackage{booktabs}
\RequirePackage{rotating}
\RequirePackage{listings}
\RequirePackage[labelsep=quad,indention=10pt]{caption}
\RequirePackage[subrefformat=parens]{subcaption} % use subcaption once
\RequirePackage[para]{threeparttable}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{algcompatible}
\RequirePackage{float}
\RequirePackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\RequirePackage{siunitx}
\RequirePackage{mathrsfs}
\RequirePackage{blindtext}
\RequirePackage{titlepic}
\RequirePackage[square,numbers,sort&compress]{natbib}
\RequirePackage{acronym}
\RequirePackage{longtable}
\RequirePackage[titles]{tocloft}
\RequirePackage{lscape}
\RequirePackage{adjustbox}

% Hyperref: load near the end of preamble normally; keep safe defaults
\RequirePackage[
pdfpagemode={UseOutlines},
bookmarks=true,bookmarksopen=true,bookmarksopenlevel=0,bookmarksnumbered=true,
hypertexnames=false,
colorlinks=true,linkcolor={black},citecolor={black},urlcolor={black},
pdfstartview={FitV},unicode,breaklinks=true]{hyperref}

% Layout defaults
\setlength{\parindent}{15pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\usepackage{vmargin}
\setmarginsrb{25mm}{20mm}{15mm}{20mm}{20pt}{0.25in}{9pt}{0.3in}
\setstretch{1.5}

% Titles and spacing
\titlespacing{\chapter}{0pt}{-70pt}{1pt}
\titleformat{\chapter}[block]{\bfseries\RaggedRight}{\textsc{\thechapter.}}{0.5em}{}
\titlespacing{\section}{0pt}{0pt}{1pt}
\titleformat{\section}[block]{\bfseries\RaggedRight}{\thesection.}{0.5em}{}
\titlespacing{\subsection}{0pt}{0pt}{1pt}
\titleformat{\subsection}[block]{\bfseries\RaggedRight}{\thesubsection}{0.5em}{}

\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{%
	\refstepcounter{dummy}%
	\addcontentsline{toc}{chapter}{#1}%
}

% Fancy headers/footers
\pagestyle{fancy}
\fancyhf{}%
\renewcommand{\headrulewidth}{2pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead[C]{\textsc{\leftmark}}
\fancyfoot[C]{\normalsize \thepage}%

% Table of contents override (keeps Mongolian titles)
\renewcommand\tableofcontents{%
	\addtotoc{Гарчиг}%
	\btypeout{Table of Contents}%
	\begin{spacing}{1}{%
			\setlength{\parskip}{1pt}%
			\if@twocolumn
			\@restonecoltrue\onecolumn
			\else
			\@restonecolfalse
			\fi
			\chapter*{\contentsname
				\@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
			\@starttoc{toc}%
			\if@restonecol\twocolumn\fi
			\cleardoublepage
	}\end{spacing}%
}

% List of figures/tables combined
\newcommand\listfigname{Зураг болон Хүснэгтийн жагсаалт}
\newcommand{\mlof}{Зураг~lof}
\newcommand\listoffigandtable{%
	\btypeout{Зураг болон Хүснэгтийн жагсаалт}%
	\addtotoc{Зураг болон Хүснэгтийн жагсаалт}%
	\begin{spacing}{1}{%
			\setlength{\parskip}{1pt}%
			\chapter*{\listfigname
				\@mkboth{\MakeUppercase\listfigname}{\MakeUppercase\listfigname}}%
			\@starttoc{lof}%
			\par\null\par
			\@starttoc{lot}%
	}\end{spacing}%
}

% cft customisations (unchanged)
\renewcommand{\cftdotsep}{2}
\renewcommand{\cftfigindent}{0em}
\renewcommand{\cftfignumwidth}{5.5em}
\renewcommand{\cftfigpresnum}{Зураг~}
\renewcommand{\cftfigaftersnum}{.}

\renewcommand{\cfttabindent}{0em}
\renewcommand{\cfttabnumwidth}{6.5em}
\renewcommand{\cfttabpresnum}{Хүснэгт~}
\renewcommand{\cfttabaftersnum}{.}

% Utility commands
\newcommand\listsymbolname{Товчилсон үгсийн жагсаалт}
\newcommand{\fref}[1]{Зураг~\ref{#1}}
\newcommand{\tref}[1]{Хүснэгт~\ref{#1}}

% \DeclareUnicodeCharacter{2460}{}
% \DeclareUnicodeCharacter{2461}{}
% \DeclareUnicodeCharacter{2462}{}
% \DeclareUnicodeCharacter{FF1A}{}

\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\file{\nolinkurl}
\DeclareRobustCommand\env{\textsf}
\DeclareRobustCommand\pkg{\textsf}
\DeclareRobustCommand\cls{\textsf}
\DeclareRobustCommand\symup[1]{{\mathrm{#1}}}%
\DeclareRobustCommand{\BibTeX}{{Bib\kern-0.08em \TeX}}

% End of class
\endinput
