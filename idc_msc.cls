%=====================================================================
% idc_msc.cls
% This class provides some basic tools for typesetting lecture notes,
% homework submissions, and other academic documents.
%=====================================================================

%=====================================================================
% Identification
%=====================================================================
\def\fileversion{1.1}
\def\filedate{2020/05/15}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idc_msc}[\filedate\space Version \fileversion\space by
  Steven Karas]

\RequirePackage{ifthen}

%=====================================================================
% Dependencies
%=====================================================================

% based on a4 article with wider margins
\LoadClass[a4paper]{article}
% \RequirePackage[top=1.5cm,bottom=1.5cm,left=1.8cm,right=1.8cm]{geometry}
\RequirePackage[top=2cm,bottom=2cm,left=3cm,right=3cm]{geometry}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[iso]{datetime}

\RequirePackage[colorlinks=true,urlcolor=blue,linkcolor=black,citecolor=black,pdfencoding=unicode,unicode]{hyperref}
\RequirePackage{amsfonts,amssymb}
\RequirePackage{mathtools}
\RequirePackage{tabu}
\RequirePackage{listings}
\RequirePackage{accsupp}
\RequirePackage[table]{xcolor}
\RequirePackage{framed}
\RequirePackage{etoolbox}
\RequirePackage{xargs}

\inputencoding{utf8}

%=====================================================================
% Metadata
%=====================================================================

\AtBeginDocument{
  \hypersetup{
    pdfinfo={
      Title={\@title},
      Author={\@author},
    }
  }
}

%=====================================================================
% Options
%=====================================================================

% No options yet

%=====================================================================
% Commands
%=====================================================================

% Prints a footnote without a reference number
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

% Strong emphasis (boldface)
\DeclareTextFontCommand{\strong}{\st}
\DeclareRobustCommand\st{\@nomath\st \ifdim \fontdimen\@ne\font >\z@\stinnershape \else \bfseries \fi}
\def\stinnershape{\mdseries}

% General maths
\newcommand{\underrel}[2]{\mathrel{\mathop{#2}\limits_{#1}}} % e.g. \underrel{x}{explanation}
\newcommand{\T}{{\mathpalette\raiseT\intercal}} % e.g. F^\T
\newcommand{\raiseT}[2]{\setbox0\hbox{$#1{#2}$}\raise\dp0\box0}
\newcommand{\NPclass}{\texorpdfstring{\ensuremath{\mathcal{NP}}}{NP}}
\newcommand{\Pclass}{\texorpdfstring{\ensuremath{\mathcal{P}}}{P}}
\DeclareMathOperator*{\xor}{\oplus}

% Statistics
\newcommand{\mean}[1]{\mkern 1.5mu\overline{\mkern-1.5mu#1\mkern-1.5mu}\mkern 1.5mu}
\DeclareMathOperator*{\Var}{Var}
\DeclareMathOperator*{\Cov}{Cov}
\DeclareMathOperator*{\E}{E}
\DeclareMathOperator*{\loglikely}{\mathcal{L}}

%=====================================================================
% Style changes
%=====================================================================
\pdfstringdefDisableCommands{%
  \def\\{}%
}

% set listings style - copy pasteable text
\lstset{
  frame=L,
  mathescape=true,
  basicstyle=\ttfamily,
  numberstyle=\tiny\noncopynumber,
  columns=flexible,
}

\newcommand{\noncopynumber}[1]{
  \protect
  \BeginAccSupp{method=escape,ActualText={}}
  #1
  \protect
  \EndAccSupp{}
}

% TODO: remove these once I've migrated to regular lists
% A variant of itemize with tighter spacing
\newenvironment{itemize*}%
  {\begin{itemize}%
    \setlength{\itemsep}{0pt}%
    \setlength{\parsep}{0pt}%
    \setlength{\parskip}{0pt}}%
  {\end{itemize}}

% A variant of enumerate with tighter spacing
\newenvironment{enumerate*}%
  {\begin{enumerate}%
    \setlength{\itemsep}{0.5pt}%
    \setlength{\parsep}{0pt}%
    \setlength{\parskip}{0pt}}%
  {\end{enumerate}}

% This package makes changes to the enumerate command which I didn't wrap perfectly for my style changes,
% so it needs to be down here
\RequirePackage{enumitem}
\setlist{noitemsep}

% style block quotes with a vertical bar to their left
\AtBeginEnvironment{quote}{\begin{leftbar}}
\AtEndEnvironment{quote}{\end{leftbar}}

% make those quote vertical bars thinner
\renewenvironmentx{leftbar}[2][1=0.5pt, 2=5pt]{\def\FrameCommand{\vrule width #1 \hspace{#2}}\MakeFramed {\advance\hsize-\width \FrameRestore}}{\endMakeFramed}

% number equations by section number
\renewcommand\theequation{\thesection.\arabic{equation}}
\numberwithin{equation}{section}
