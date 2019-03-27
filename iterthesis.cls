	
	\NeedsTeXFormat{LaTeX2e}
	\ProvidesClass{iterthesis}[2017/03/31 ITER Thesis Format]
	\typeout{Document Class `iterthesis' v0.1 <31 March 2017>}
	
	
	%=============================================================================
	% TBD: We need options to switch between Annual Progress Report,
	%      Presynopsis, Synopsis and final thesis, and between different
	%      types of reports. 
	%=============================================================================
	%\DeclareOption{aps}{}
	%\DeclareOption{presynopsis}{}
	%\DeclareOption{synopsis}{}
	%\DeclareOption{thesis}{}
	%\DeclareOption{dissertation}{}
	%\DeclareOption{project}{}
	
	%=============================================================================
	% Pass the options to report class
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
	
	% Defaults ...
	\ProcessOptions
	
	%=============================================================================
	% a4paper: thesis must be printed on a4 size paper. 
	% 12pt:    font size must be 12 pt
	%
	% As iitkthesis class is a simple extension of report class, we simply
	% pass default options to report class.
	% =============================================================================
	\PassOptionsToClass{11pt,a4paper}{report}
	\LoadClass{report}
	
	% Advisor
	\def\@advisorname{Advisor Name}
	\def\@advisordept{DEPARTMENT OF Advisor}
	\newcommand{\setguide}[1]{\def\@advisorname{#1}}
	\newcommand{\setguidedept}[1]{\def\@advisordept{#1}}
	
	
	% and coadvisor? (initialized to empty)
	%\global\let\@coadvisorname\@empty
	%\newcommand{\setcoguide}[1]{\def\@coadvisorname{#1}}
	%\let\coguide\setcoguide %
	%\newcommand{\show@coguide}{\@coadvisorname}
	
	% and exadvisor? (initialized to empty)
	%\global\let\@exadvisorname\@empty
	%\newcommand{\setexguide}[1]{\def\@exadvisorname{#1}}
	%\let\exguide\setexguide %
	%\newcommand{\show@exguide}{\@exadvisorname}
	
	
	
	
	%=============================================================================
	% TITLE PAGE
	%   - define \title{} \author{} \date{}
	%   - The default degree is ``Unknown Degree''
	%     Degree can be changed using the command \iitkdegree{}
	%   - The default department is ``Unknown Department''
	%     The department can be changed using the command \department{}
	%   - The default document type is ``A preliminary report''
	%     The document type can be changed using the command \reporttype{}
	%     There are some short-cuts for \reporttype{}:
	%      * for a PhD thesis, specify \thesis
	%      * for a M.Tech./M.Phil./M.Des./M.S. dissertation, specify \dissertation
	%      * for a DIIT/B.Tech./M.Sc.project report, specify \project
	%      * for a preliminary report, specify \prelim
	%   - once the above are defined, use \maketitle to generate the titlepage
	%=============================================================================
	\newcommand\@thesistitlemedskip{0.25in}
	\newcommand\@thesistitlebigskip{0.6in}
	\newcommand{\rollnum}[1]{\gdef\@rollnum{#1}}
	\newcommand{\iterdegree}[1]{\gdef\@iterdegree{#1}}
	\newcommand{\department}[1]{\gdef\@department{#1}}
	\newcommand{\reporttype}[1]{\gdef\@doctype{#1}}
	\newcommand{\certificatetype}[1]{\gdef\@certificatetype{#1}}
	
	\newcommand{\thesis}{\reporttype{thesis}\certificatetype{Thesis}}
	\newcommand{\dissertation}{\reporttype{dissertation}\certificatetype{Dissertation}}
	\newcommand{\project}{\reporttype{project report}\certificatetype{Report}}
	\newcommand{\prelim}{\reporttype{preliminary report}\certificatetype{Report}}
	
	\gdef\@rollnum{Registration number}    % Default is Unknown 00000000
	\gdef\@iterdegree{Masters of Technology Degree}    % Default is Unknown Degree
	\gdef\@doctype{thesis}  % Default is a preliminary report
	\gdef\@department{Civil Engineering} % Default is Unknown
	
	\renewcommand{\maketitle}{%
	  \begin{titlepage}
	  	\pagenumbering{roman}
	%-----------------------------------------------------------------------------
	% -- The thesis office doesn't like thanks on title page.  Put it in
	% -- the acknowledgments.  This is here so you don't have to change
	% -- your titlepage when converting from report style. -> from Purdue, but I
	%        left it here since it seems compatible with UW-Madison, Eric -
	%    Amey - I also left it here as iitk does not say anything about it.
	%-----------------------------------------------------------------------------
	    \def\thanks##1{\typeout{Warning: `thanks' deleted from thesis titlepage.}}
	    \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
	    \vspace*{0.1in}
	    \addcontentsline{toc}{chapter}{Title Page}
	    \begin{center}
	      \vfill
	      \mbox{}\\
	      {\bf\expandafter\uppercase\expandafter{\Huge\@title}} \\[\@thesistitlemedskip]
	      {\large \textit{A \@doctype\ submitted}} \\
	      {\large in Partial Fulfillment of the Requirements} \\
	      {\large for the Degree of}\\[\@thesistitlemedskip]
	      {\large \@iterdegree} \\\vskip 10px
	      {\large by} \\\vskip 10px
	      {\large \bf \@author \\ \@rollnum} 
	      \\\vskip 10px
	      \textbf{Supervisor:}\\
	       \@advisorname \\
	      \@advisordept \\
	      Institute of Technical Education \& Research,\\
	      Siksha 'O' Anusandhan University, Bhubaneswar, Odisha
	      \vskip 10px
	      \vfill
	      \includegraphics[scale = 0.15]{L1.png}\\[0.25 in]
	      {\large \textit{to the}} \\
	      {\large \MakeUppercase{Department of \@department}} \\%[\@thesistitlemedskip]
	      {\large INSTITUTE OF TECHNICAL EDUCATION AND RESEARCH}\\%[\@thesistitlemedskip]
	%      {\large \@date} \\
	     \begin{center}
	     	\copyright\  \@author,  \monthname,  \the \year, 
	     	All Rights Reserved
	     \end{center}
	      \vfill
	    \end{center}
	  \end{titlepage}
	  \setcounter{footnote}{0}
	  \newpage
	}
	
	%=============================================================================
	% DEDICATION
	%=============================================================================
	% The dedication environment must do the following:
	% - start a new page
	% - center the text vertically
	% - include the text in a center environment
	%=============================================================================
	\def\dedication{
	  \newpage
	  \thispagestyle{empty}    % No page number
	  % \addtocounter{page}{-1}
	  \chapter*{}            % Required for \vfill to work
	  \thispagestyle{empty}    % No page number
	  \null\vfil
	  \begin{center}}
	\def\enddedication{\end{center}\par\vfil\newpage}
	
	%=============================================================================
	% CERTIFICATE SHEET
	% - start a new page. page 
	% - center the text vertically
	%=============================================================================
	\newcommand\@thesiscertificatemedskip{0.2in}
	\newcommand\@thesiscertificatebigskip{0.5in}
	\newcommand{\makecertificate}{
	  \cleardoublepage
	  \thispagestyle{empty}
	  \begin{minipage}[t]{3cm}
	  	\vskip -15px
	  	\flushleft \includegraphics[scale = 0.1]{L1.png}\\[0.25 in]
	  \end{minipage}
       \hfill
	  \begin{minipage}[t]{12cm}
	  	\begin{center}
	  		{\Large\textbf{\textcolor{Orange}{S}IKSHA '\textcolor{Orange}{O}' \textcolor{Orange}{A}NUSANDHAN UNIVERSITY}}\\ {\large\textbf{FACULTY OF ENGINEERING \& TECHNOLOGY\\DEPARTMENT OF CIVIL ENGINEERING}}
	  	\end{center}
	  	 
	  \end{minipage}
	    \begin{center}
	      {\LARGE \bf \underline{Certificate} }\\[\@thesiscertificatebigskip]
	    \end{center}
    \addcontentsline{toc}{chapter}{Certificate}
	    This is to certify that the thesis entitled \textbf {\@title}, submitted by \textbf{\@author}, to Siksha 'O' Anusandhan University Bhubaneswar, is a record of bonafide research work under our
	    supervision and we consider it worthy of consideration for the award of the degree of Master
	    of Technology of the University.\\[\@thesiscertificatebigskip]
	    \begin{flushright}
	    
	    \rule{6cm}{1sp} \\
	    \@advisorname \\
	    \@advisordept \\
	    ITER Bhubaneswar 
	    \end{flushright}
	    \begin{flushleft}
	%    \@date
	 Date:
	    \end{flushleft}
    \newpage
	%\includegraphics[scale = 1]{seal}
	%change ends    
	}
	
		% APPROVAL SHEET
	% - start a new page. page 
	% - center the text vertically
	%=============================================================================
	
	\newcommand{\makeapproval}{
		\cleardoublepage
		\thispagestyle{empty}
		\begin{center}
			{\LARGE \bf APPROVAL SHEET }\\[\@thesiscertificatebigskip]
		\end{center}
		\addcontentsline{toc}{chapter}{Approval Sheet}		
	
	\begin{minipage}[t]{12cm}
		
		\flushright Date:\linebreak
	\end{minipage}

		Certified that the thesis entitled \textbf {\@title}, submitted by \textbf{\@author},to Siksha 'O' Anusandhan University Bhubaneswar, for the award of the degree Master of Technology has been accepted by the external examiners and that the student has successfully defended the thesis in viva- voce examination held today.
		\vskip 70px
	    \begin{flushright}
	    	
	    	(Supervisor)	
	    \end{flushright}	
		\vskip 80px
		\begin{minipage}[t]{8cm}
			\flushleft(External Examiner)
			
		\end{minipage}
		\begin{minipage}[t]{8cm}
			\flushright(Head of Department)			
		\end{minipage}
	
		%\includegraphics[scale = 1]{seal}
		%change ends    
	}


	%=============================================================================
	% Statement of Thesis Preparation
	%=============================================================================
	\newcommand{\makedeclaration}{
		\cleardoublepage
		\thispagestyle{empty}
		\begin{center}
			{\LARGE \bf DECLARATION}\\[\@thesiscertificatebigskip]
		\end{center}
		\addcontentsline{toc}{chapter}{Declaration}
	I certify that:
	\begin{enumerate}
			\item[a.] The work contained in the thesis is original and has been done by myself under the general supervision of my supervisor(s).
			\item[b.] The work has not been submitted to any other Institute for any degree or diploma.
			\item[c.] I have followed the guidelines provided by the Institute in writing the thesis.
			\item[d.] I have conformed to the norms and guidelines given in the Ethical Code of Conduct of the Institute.
			\item [e.] Whenever I have used materials (data, theoretical analysis, and text) from other sources, I have given due credit to them by citing them in the text of the thesis and giving their details in the references.
			\item[f.] Whenever I have quoted written materials from other sources, I have put them under
			quotation marks and given due credit to the sources by citing them and giving required
			details in the references.
			\item[g.] The content of thesis has been checked for plagiarism and passed through.
			\end{enumerate}
		\vspace{1in}
		
		%	\leftskip25 em
			\begin{flushright}
				Signature of the Student
			\end{flushright}
		\newpage
		}
	
	
	
	%=============================================================================
	% ABSTRACT
	%=============================================================================
	% The abstract should begin with two single-spaced lines describing
	% the author and title in a standard format.  After these lines comes
	% the standard abstract.
	%=============================================================================
	\def\abstract{
		\begin{center}
			{\LARGE \bf ABSTRACT}\\[\@thesiscertificatebigskip]
		\end{center}
		\addcontentsline{toc}{chapter}{Abstract}
		\thispagestyle{empty}}
	\def\endabstract{\par\newpage}
	
	%=============================================================================
	% COPYRIGHTPAGE
	% The copyright must do the following:
	% - start a new page with no number
	% - place the copyright text centered at the bottom.
	%=============================================================================
	\def\copyrightpage{
	  \newpage
	  \thispagestyle{empty}    % No page number
	  % \addtocounter{page}{-1}
	  \addcontentsline{toc}{chapter}{Copyright Page}          % Required for \vfill to work
	  
	  \begin{center}
	    \copyright\  \@author\\  \monthname,  \the \year, 
	   All Rights Reserved
	  \end{center}
  \newpage}
	
	
	%=============================================================================
	% GLOSSARY
	%=============================================================================
	% The glossary environment must do the following:
	% - produce the table of contents entry for the glossary
	% - start a new page with GLOSSARY centered two inches from the top
	%=============================================================================
	\def\glossary{
	  \chapter*{Glossary}
	  \addcontentsline{toc}{chapter}{Glossary}}
	\def\endglossary{\par\newpage}
	
	%=============================================================================
	% NOMENCLATURE
	%=============================================================================
	% The nomenclature environment must do the following:
	% - produce the table of contents entry for the nomenclature section
	% - start a new page with NOMENCLATURE centered two inches from the top
	%=============================================================================
	\def\nomenclature{ 
	  \chapter*{Nomenclature}
	  \addcontentsline{toc}{chapter}{Nomenclature}}
	\def\endnomenclature{\par\newpage}
	
	%=============================================================================
	% LIST OF SYMBOLS
	%=============================================================================
	% The list of symbols environment must do the following:
	% - produce the table of contents entry for the list of symbols section
	% - start a new page with LIST OF SYMBOLS centered two inches from the top
	%=============================================================================
	\def\listofsymbols{
	  \chapter*{LIST OF SYMBOLS}
	  \addcontentsline{toc}{chapter}{LIST OF SYMBOLS}}
	\def\endlistofsymbols{\par\newpage}
	
	%=============================================================================
	% VITA
	%=============================================================================
	% The vita environment must do the following:
	% - produce a separator page with the word vita centered
	% - produce the table of contents entry for the vita
	% - start a new page with VITA centered two inches from the top
	%=============================================================================
	\def\vita{
	  \chapter*{Vita}
	  \addcontentsline{toc}{chapter}{Vita}}
	\def\endvita{\par\newpage}
	
	%=============================================================================
	% ACKNOWLEDGMENTS
	%=============================================================================
	% The acknowledgments environment must do the following:
	% - start a new page with ACKNOWLEDGMENTS centered two inches from the top
	%=============================================================================
	\def\acknowledgments{
	  \begin{center}
	  	{\LARGE \bf ACKNOWLEDGMENT}\\[\@thesiscertificatebigskip]
	  \end{center}
	  \addcontentsline{toc}{chapter}{Acknowledgment}
	  \thispagestyle{empty}}
	\def\endacknowledgments{\par\newpage}
	
	%=============================================================================
	% LIST OF FIGURES; LIST OF TABLES
	%  These macros from report.cls have been modified to add entry in the
	%  Contents table
	%=============================================================================
	
	\renewcommand\listoffigures{%
	    \if@twocolumn
	      \@restonecoltrue\onecolumn
	    \else
	      \@restonecolfalse
	    \fi
	    \chapter*{\listfigurename}%
	    \addcontentsline{toc}{chapter}{\listfigurename}%
	      \@mkboth{\MakeUppercase\listfigurename}%
	              {\MakeUppercase\listfigurename}%
	    \@starttoc{lof}%
	    \if@restonecol\twocolumn\fi
	    }
	\renewcommand\listoftables{%
	    \if@twocolumn
	      \@restonecoltrue\onecolumn
	    \else
	      \@restonecolfalse
	    \fi
	    \chapter*{\listtablename}%
	    \addcontentsline{toc}{chapter}{\listtablename}%
	      \@mkboth{%
	          \MakeUppercase\listtablename}%
	         {\MakeUppercase\listtablename}%
	    \@starttoc{lot}%
	    \if@restonecol\twocolumn\fi
	    }
    
	%=============================================================================
	% These commands can be used in the thesis to switch between single
	% and double spacing.  This is needed, for instance, in the abstract.
	%=============================================================================
	
	%=============================================================================
	% Finally set margins per the IITK format
	%=============================================================================
	
	\usepackage[top=25mm, outer=25mm, bottom=25mm, inner=35mm]{geometry}
	 
	% Header/spacing options
	\usepackage{fancyhdr}
	\usepackage{setspace}
	\doublespacing
	
	\fancyhf{}
	\renewcommand{\headrulewidth}{0.3pt} % remove the header rule
	\rhead{\thepage}
	
	\pagestyle{fancy}
		% This is done with the titlesec package
	\usepackage{titlesec}
	\assignpagestyle{\chapter}{empty}
	
	\usepackage{emptypage}
	
	%=============================================================================
	% END FILE
	%=============================================================================