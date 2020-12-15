\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mefsdp}[2020/12/08 MEF University Senior Design Project Report Template]

\LoadClass[12pt]{report}

\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{titlepic}
\RequirePackage{listings}
\RequirePackage{indentfirst}
\RequirePackage{titlecaps}
\RequirePackage[T1]{fontenc}
\RequirePackage{ifthen}
\RequirePackage[center,labelfont=bf,labelsep=endash]{caption}
\RequirePackage{natbib}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{tabularx}
\RequirePackage[ddmmyyyy]{datetime}
\RequirePackage[nomain,acronym]{glossaries}

% style for abbreviations
\setacronymstyle{long-short}
\makenoidxglossaries
\setlength{\glsdescwidth}{.8\textwidth}
\renewcommand{\glsnamefont}[1]{\textbf{#1}}



% Font Sizes
% \normalsize	12pt
% \large		14.4pt
% \Large		17.28pt



\newcommand{\settitle}[1]{\def\@projecttitle{#1}}
\newcommand{\setauthors}[1]{\def\@authors{#1}} % be aware of the internal \@author
\newcommand{\setauthorsflat}[1]{\def\@authorsflat{#1}} % be aware of the internal \@author
\newcommand{\setyear}[1]{\def\@projectyear{#1}}
\newcommand{\setdate}[1]{\def\@projectdate{#1}} % dd\mm\yyyy
\newcommand{\setcourseno}[1]{\def\@courseno{#1}}
\newcommand{\setfaculty}[1]{\def\@faculty{#1}}
\newcommand{\setdepartment}[1]{\def\@department{#1}}
\newcommand{\setchair}[1]{\def\@departmentchair{#1}}
\newcommand{\setadvisor}[2]{\def\@advisor{#1}}
\newcommand{\setmemberone}[1]{\def\TAMUCCmemberone{#1}}
\newcommand{\setmembertwo}[1]{\def\TAMUCCmembertwo{#1}}
\newcommand{\setpriordegree}[1]{\def\BSearned{#1}}


% set numbering of sections
\renewcommand\thesection{\arabic{section}.}
\renewcommand\thesubsection{\thesection\arabic{subsection}.}
\renewcommand\thesubsubsection{\thesubsection\arabic{subsubsection}.}

% set header style for listings
\newcommand{\@headerstyle}{\vspace{-3em}\bfseries\centering\large\scshape}
\renewcommand{\contentsname}{\@headerstyle Table of Contents}
\renewcommand{\bibname}{\@headerstyle References}
\renewcommand{\listfigurename}{\@headerstyle List of Figures}
\renewcommand{\listtablename}{\@headerstyle List of Tables}


% enumerate subsubsection
\addtocounter{secnumdepth}{1}
\addtocounter{tocdepth}{1}

\newcommand{\createlists}{
	\tableofcontents
	\listoftables
	\listoffigures
}

% words not be capitalized in title case
\Addlcwords{a, an, by, to, the, of, and, but, for, in, on, is}

% section style break
\newcommand{\@secstylebr}{\newpage\centering\large\bfseries\scshape}

% section style without break
\newcommand{\@secstylenobr}{\centering\large\bfseries\scshape}

% print the authors in tabular formate for automatic centering and alignment
\renewcommand\and{
	\end{tabular}
	\hskip 1em
	\@plus.17fil
	\begin{tabular}[t]{c}
}

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
}

\newcommand{\coverpage}{
	\clearpage
	\thispagestyle{empty}{
	\centering
	\bfseries
		\includegraphics[width=0.3\textwidth]{../figures/mef_logo.png}\\
		\vspace{8em}
		\MakeUppercase{\Large \@projecttitle} \\
		\vspace{6em}
		Senior Design Project \@courseno \\
		\vspace{10em}
		{
			\begin{tabular}[t]{c}
				\@authors
			\end{tabular}
		} \\
		\vfill
		\begin{center}
			\@projectyear
		\end{center}
	}
}

\newcommand{\descriptivetitle}{
	\clearpage
	\thispagestyle{empty}{
	\centering
	\bfseries
	MEF UNIVERSITY \\ \MakeUppercase{\@faculty} \\
	\vspace{1em}
	DEPARTMENT OF \MakeUppercase{\@department} \\
	\vspace{6em}
	\MakeUppercase{\Large \@projecttitle} \\
			\vspace{6em}
	Senior Design Project \@courseno \\
	\vspace{6em}
	{
		\begin{tabular}[t]{c}
			\@authors
		\end{tabular}
	} \\
	\vspace{6em}
	Advisor: \@advisor \\
	\vfill
	\begin{center}
		\@projectyear
	\end{center}
	}
}

\newcommand{\acceptancepage}{
	\clearpage
	\thispagestyle{empty}{
		\centering
		\bfseries
		MEF UNIVERSITY \\ \MakeUppercase{\@faculty} \par
		\vspace{1em}
		DEPARTMENT OF \MakeUppercase{\@department} \par
		\vspace{6em}
	}
	\begin{tabularx}{\textwidth}{l X}
		Project Title &: {\titlecap \@projecttitle} \\
		Student(s) Name &: \@authorsflat \\
		Date &: \@projectdate 
	\end{tabularx}
	\vspace{5em}
	
	I hereby state that the design project prepared by {\titlecap \@authorsflat} has been completed under my supervision. I accept this work as a “Senior Design Project”. 
	\vspace{1em}
	\begin{flushright}
		\@projectdate
		\par
		\@advisor
	\end{flushright}
	\vfill
	
	I hereby state that I have examined this senior design project by {\titlecap \@authorsflat}. This work is acceptable as a “Senior Design Project”.
	\vspace{1em}
	\begin{flushright}
		\@projectdate
		\par
		\@departmentchair
		\par
		Head of the Department of
		\par Computer Engineering
		\par
	\end{flushright}
}

\newcommand{\honestypledge}{
	\clearpage
	\thispagestyle{empty}
	\begin{center}
		\bfseries
		\MakeUppercase{Academic Honesty Pledge}
	\end{center}
	\vspace{3em}
	In keeping with MEF University Student Code of Conduct, I pledge that this work is my own and that I have not received inappropriate assistance in its preparation. I further declare that all resources are explicitly cited. \par\noindent
	\vspace{6em}
	\begin{tabularx}{\textwidth}{X X X}
		NAME & DATE & SIGNATURE\\
		\hline \\
		
	\end{tabularx}
	
}

\newcommand{\listofabbreviations}{
	\clearpage
	\thispagestyle{empty}
	\printnoidxglossary[type=\acronymtype,title=\@headerstyle List of Abbreviations, style=long3col]
}


\newcommand{\makestandards}{
	% it is customary to use roman literals for page numberings before the first section in the template
	\pagenumbering{roman} 
	
	\coverpage
	\descriptivetitle
	\acceptancepage
	\honestypledge
	\makelists
	
	% convert page numbering back to arabic numbers
	\cleardoublepage
	\pagenumbering{arabic}
}

\newcommand{\makelists}{
	\tableofcontents
	\listoffigures
	\listoftables
	\listofabbreviations
}