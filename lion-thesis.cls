% A LaTeX document class for preparing a bachelor/master thesis according to
% the specifications of the Leiden Institute of Physics (LION),
% Leiden University, The Netherlands
%
%  Original version written by:
%       Michiel de Dood
%  Updated by:
%       Julian van Doorn
%
%  Please report issues on GitHub:
%       https://github.com/jvdoorn/lion-thesis-template/issues

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lion-thesis}

\typeout{}
\typeout{Leiden Institute of Physics thesis class}
\typeout{}
\typeout{Report issues on GitHub:}
\typeout{https://github.com/jvdoorn/lion-thesis-template/issues}
\typeout{}

% Use the report class as a base.
\PassOptionsToClass{a4paper}{report}
\PassOptionsToClass{fleqn}{report}
\PassOptionsToClass{openright}{report}

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[\@@ptsize]{report}

% Define the line spacing.
\def\baselinestretch{1}

% The calc package allows to specify lengths etc. as an arithmetic expression
\RequirePackage{calc}

% Colored text
\RequirePackage{xcolor}
			% used to be color package, but this gives conflicts with user packages
			% reported by Casper Remeijer June 9, 2016

\definecolor{mygrey}{gray}{0.5}
\definecolor{lionblue}{RGB}{0,43,127} % The official color, thanks to Ferry Besamusca

% Consistent section styling
% \RequirePackage{sectsty}
% \allsectionsfont{\sffamily} % changed 26/03/2014 avoid mixing of fonts

% Chapter styling
\RequirePackage[Lenny]{fncychap} % consider titlesec as alternative
\ChRuleWidth{1pt}

% Enable fancy headers
\RequirePackage{fancyhdr}

% Formatting tools for the title
\RequirePackage{titling}

% 09/07/2014 Redefine the \cleardoublepage command to get completely empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}


% == start : define several variables to be placed on the titlepage
\gdef\@studentid{\color{red}use $\backslash$\texttt{studentid\{\ldots\}} to define}
\gdef\@abstract{\color{red}Please use $\backslash$\texttt{abstract\{\ldots\}} to define an abstract in the document preamble.}
\gdef\@supervisor{\color{red}use $\backslash$\texttt{supervisor\{\ldots\}} to define}
\gdef\@corrector{\color{red}use $\backslash$\texttt{corrector\{\ldots\}} to define}
\gdef\@affiliation{\color{black}Huygens-Kamerlingh Onnes Laboratory, Leiden University}
\gdef\@address{\color{black}P.O. Box 9500, 2300 RA Leiden, The Netherlands}
\gdef\@degree{\color{black}Bachelor of Science}
\gdef\@major{\color{black}Physics}

\def\studentid#1{\gdef\@studentid{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\corrector#1{\gdef\@corrector{#1}}
\gdef\affiliation#1{\gdef\@affiliation{#1}}
\gdef\address#1{\gdef\@address{#1}}
\gdef\degree#1{\gdef\@degree{#1}}
\gdef\major#1{\gdef\@major{#1}}
\gdef\theauthor{\@author}

% Optional cover picture
\def\coverpicture#1{\gdef\@coverpicture{#1}\cover@picturetrue}
% New if construct:             Default condition:
\newif\ifcover@picture          \cover@picturefalse

% Optional dedication added 14-05-2019. Requested by Ruoyan Wang
% use \dedicate to define
\def\dedicate#1{\gdef\@dedicate{#1}\dedicationtrue}
% default option is off
\newif\ifdedication				\dedicationfalse

% == start : title page using titling package

% shift the title up a little compared to the standard definition
\setlength{\droptitle}{-4cm}

\pretitle{ % this is inserted before the title.
    \pagestyle{empty}
    \begin{center}
        \color{lionblue}
        \vskip 1em
        \includegraphics[width=2.5cm]{lion-msc-logo.pdf}
        \color{lionblue}
        \noindent\rule{\textwidth}{0.4mm}
        \vskip 0.5em
        \huge
}

\posttitle{
        \noindent\rule{\textwidth}{0.4mm}
        \vfill
        \ifcover@picture
         \@coverpicture
        \fi
        \vfill
        \vskip 1em
    \end{center}

    \begin{center}
        \begin{minipage}[b]{.75\textwidth}
            \color{black}
            \begin{center}
                \normalsize
                \textsc{Thesis} \\ \vskip 0.5em
                submitted in partial fulfillment of the \\
                requirements for the degree of \\ \vskip 0.5em
                \textsc{\@degree} \\
                in \\
                \textsc{\@major} \\ \vskip 0.5em
            \normalsize
            Author :             \hfill {\@author} \\
            Student ID :         \hfill {\@studentid} \\
            Supervisor :         \hfill {\@supervisor} \\
            Second corrector : \hfill {\@corrector}
            \par
            \vskip 1em
            Leiden, The Netherlands, \@date
            \end{center}
        \end{minipage}
    \end{center}
    \cleardoublepage
}

\preauthor{
    \thispagestyle{empty}
    \begin{center}
        \Huge \@title \\
        \vskip 1 em
        \color{black}
        \large \bf
}

\postauthor{
    \end{center}
    \begin{center}
        \normalsize \@affiliation \\ \@address
        \lineskip 0.5em
        \par
    \end{center}
}

\predate{
    \begin{center}
        \normalsize
}

% Changed the alignment of the abstract. The centering is plain ugly
% Following comments of Casper Remeijer

\postdate{
    \end{center}
    \begin{center}
            \vskip 1 em
            \color{black} \large \textbf{Abstract}
    \end{center}
    \vskip 1em
    \normalsize \@abstract
    \vfill
	\ifdedication
		 \clearpage
	     \thispagestyle{empty}
	     \vskip 3em
	     \textit{\@dedicate}
	\fi
}

% Define how footnotes look.
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Remove dots from the table of contents.
\renewcommand{\@dotsep}{10000}

% Define the headers and footers.
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\small \textit{#1}}{}}
\renewcommand{\sectionmark}[1]{\markright{\small \textit{\thesection{} #1}}}

\fancyhf{}
\fancyfoot[CE,CO]{\vskip 5mm \scriptsize{\color{mygrey}\input{version} -- Created \today~-~\currenttime}}
\fancyfoot[RO,LE]{\thepage}
\fancyhead[RO,LE]{\thepage}
\fancyhead[LO]{\rightmark}
\fancyhead[RE]{\leftmark}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
\addtolength{\headheight}{2.5pt}
\fancypagestyle{plain}{%
    \fancyhead{}
    \renewcommand{\footrulewidth}{0pt}
    \renewcommand{\headrulewidth}{0pt}
}
