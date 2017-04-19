%=====================================================================
% idc_msc.cls
% This class provides some basic tools for typesetting lecture notes,
% homework submissions, and other academic documents.
%=====================================================================

%=====================================================================
% Identification
%=====================================================================
\def\fileversion{1.0}
\def\filedate{2017/04/19}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idc_msc}[\filedate\space Version \fileversion\space by
  Steven Karas]

\RequirePackage{ifthen}

%=====================================================================
% Dependencies
%=====================================================================

% based on a4 article with wider margins
\LoadClass[a4paper]{article}
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}

\RequirePackage[T5]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[iso]{datetime}

\RequirePackage[colorlinks=true,urlcolor=blue,linkcolor=black,citecolor=black]{hyperref}
\RequirePackage{amsfonts,amssymb}
\RequirePackage{mathtools}
\RequirePackage{tabu}
\RequirePackage{listings}

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

% A √ariant of itemize with tighter spacing
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
