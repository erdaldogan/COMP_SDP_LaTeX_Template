\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mefsdp}[2020/12/08 MEF University Senior Design Project Report Template]

\LoadClass[12pt]{report}

\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{titlepic}
\RequirePackage{listings}
%\RequirePackage{titlepic}
\RequirePackage{indentfirst}
\RequirePackage{titlecaps}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifthen}
\RequirePackage{ifnextok}
\RequirePackage[center,labelfont=bf,labelsep=endash]{caption}

%\setlength{\textwidth}{6.5in}
%\setlength{\textheight}{8in}

% Font Sizes
% \normalsize	12pt
% \large		10.95pt
% \Large		17.28pt

\pagenumbering{arabic}

\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\thesection\arabic{subsection}.}
\renewcommand\thesubsubsection{\thesubsection\arabic{subsubsection}.}

% enumerate subsubsection
\addtocounter{secnumdepth}{1}

% words not be capitalized in title case
\Addlcwords{a, an, by, to, the, of, and, but, for, in, on, is}

% section style break
\newcommand{\@secstylebr}{\newpage\centering\large\bfseries\scshape}

% section style without break
\newcommand{\@secstylenobr}{\centering\large\bfseries\scshape}

\renewcommand\section[1][]{
	\ifthenelse{\equal{#1}{nobreak}}
	{\let\@secstyle\@secstylenobr}{\let\@secstyle\@secstylebr}
	\@startsection
	{section}{1}{0mm} % name, level, indent
	{-1\baselineskip} % beforeskip
	{0.5\baselineskip} % afterskip
	{\@secstyle}
}


\renewcommand\subsection{\@startsection
	{subsection}{2}{0mm} % name, level, indent
	{-1\baselineskip} % beforeskip
	{0.5\baselineskip} % afterskip
	{\bfseries \titlecap} % style
}


\renewcommand\subsubsection{\@startsection
	{subsubsection}{3}{0mm} % name, level, indent
	{-1\baselineskip} % beforeskip
	{0.5\baselineskip} % afterskip
	{\bfseries \titlecap} % style
}
	

\newcommand{\createtitle}{%
	\centering
	\includegraphics[width=0.3\textwidth]{../figures/mef_logo.png}
	
}




