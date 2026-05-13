%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 文件: ccu_thesis.cls
% 版本: v6.2 (修复参考文献显示，保留目录与公式优化)
% 创建时间: Wednesday, April 29, 2026
% 创作者: SHUSHU
% --------------------
% 最后修改时间: 
% 修改者: SHUSHU
% ----------------------------------------
% MIT License
% 
% Copyright (c) 2026 SHUSHU
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of
% this software and associated documentation files (the "Software"), to deal in
% the Software without restriction, including without limitation the rights to
% use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
% of the Software, and to permit persons to whom the Software is furnished to do
% so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% ----------------------------------------
% 更改日志:
% 日期       	说明
% -----------	------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ccu_thesis}[2025/01/24 v6.2 CCU Paper Class]

% ============= 1. 基础内核设置 =============
\LoadClass[
    a4paper, zihao=-4, UTF8, oneside, 
    autoindent = true, fontset=fandol 
]{ctexbook}

% ============= 2. 宏包加载 =============
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{tikz} 
\RequirePackage{xstring}
\RequirePackage{tocloft}   
\RequirePackage{titletoc}  
\RequirePackage{hyperref}
\RequirePackage{array} 
\RequirePackage{multirow}
\RequirePackage{makecell} 
\RequirePackage{pifont}
\RequirePackage{caption}
\RequirePackage{subcaption} 
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{appendix}
\RequirePackage{etoolbox}
\RequirePackage[square,numbers,sort&compress]{natbib} % 参考文献核心
\RequirePackage{hypernat}
\RequirePackage{listings}   
\RequirePackage{xcolor}
\RequirePackage{float} 
\RequirePackage{ragged2e} 
\RequirePackage{indentfirst}
\RequirePackage[final]{microtype} 
\RequirePackage{flexisym}
\RequirePackage{breqn} 

% --- 正文页边距 ---
\geometry{
    left=3cm, right=2.5cm, top=2cm, bottom=2.5cm,
    headheight=25pt, headsep=15pt
}

% ============= 3. 字体与字号定义 =============
\setmainfont{Times New Roman} 
\providecommand{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{\CJKfamily{zhkai}}

\newcommand{\sanhao}{\fontsize{16bp}{20bp}\selectfont}       
\newcommand{\xiaosan}{\fontsize{15bp}{20bp}\selectfont}     
\newcommand{\sihao}{\fontsize{14bp}{20bp}\selectfont}       
\newcommand{\xiaosi}{\fontsize{12bp}{20bp}\selectfont}      
\newcommand{\wuhao}{\fontsize{10.5bp}{20bp}\selectfont}   
\newcommand{\xiaowu}{\fontsize{9bp}{20bp}\selectfont}      

% ============= 4. 变量定义 =============
\def \@stunum {} \def \@academy {} \def \@department {} \def \@Class {} \def \@instructor {} 
\def \@entitle {English Title}
\gdef\mytitle{请在主文档设置论文题目}

\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\gdef\mytitle{#1}}

\def \@dateyear {\the\year} \def \@datemonth {\the\month} \def \@dateday {\the\day}
\def \@yearwidth {2.5cm} \def \@monthwidth {1.2cm} \def \@daywidth {1.2cm} 

\newcommand{\studentid}[1]{\def \@stunum {#1}}
\newcommand{\academy}[1]{\def \@academy {#1}}
\newcommand{\department}[1]{\def \@department {#1}}
\newcommand{\Class}[1]{\def \@Class {#1}}
\newcommand{\instructor}[1]{\def \@instructor {#1}}
\newcommand{\entitle}[1]{\def \@entitle {#1}}
\newcommand{\thesistime}[3]{\def \@dateyear{#1} \def \@datemonth{#2} \def \@dateday{#3}}
\newcommand{\ccucovertitlesep}{\hspace{0.85em}}
\newcommand{\ccucovertitleline}[4]{#1\ccucovertitlesep#2\ccucovertitlesep#3\ccucovertitlesep#4}
\newcommand{\ccucovertitle}{
    \begingroup
    \renewcommand{\arraystretch}{1}
    \songti\bfseries\fontsize{42bp}{42bp}\selectfont
    \begin{tabular}{@{}c@{}}
        \ccucovertitleline{长}{春}{大}{学} \\[0.55cm]
        \ccucovertitleline{毕}{业}{论}{文}
    \end{tabular}
    \endgroup
}

% ============= 5. 页面样式与装订线 =============
\newcommand{\makebindingline}{
    \begin{tikzpicture}[remember picture, overlay]
        \draw[dash pattern=on 2pt off 2pt, line width=0.6pt]
            ([xshift=1.63cm, yshift=-3cm]current page.north west) -- ([xshift=1.63cm, yshift=-22cm]current page.north west); 
        \node[fill=white, inner sep=1pt] at ([xshift=1.63cm, yshift=-9cm]current page.north west) {装};
        \node[fill=white, inner sep=1pt] at ([xshift=1.63cm, yshift=-12cm]current page.north west) {订};
        \node[fill=white, inner sep=1pt] at ([xshift=1.63cm, yshift=-15cm]current page.north west) {线};
    \end{tikzpicture}
}

\fancypagestyle{fancy}{
    \fancyhf{}
    \fancyhead[L]{\makebindingline{\bfseries\kaishu\sanhao 长\hspace{0.5em}春\hspace{0.5em}大\hspace{0.5em}学}}
    \fancyhead[R]{{\songti\wuhao \mytitle}}
    \fancyfoot[C]{{\songti\xiaowu \thepage}}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.9pt}
}

\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[L]{\makebindingline{\bfseries\kaishu\sanhao 长\hspace{0.5em}春\hspace{0.5em}大\hspace{0.5em}学}}
    \fancyhead[R]{{\songti\wuhao \mytitle}}
    \fancyfoot[C]{{\songti\xiaowu \thepage}}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.9pt}
}

% ============= 6. 封面渲染 =============
\renewcommand{\maketitle}{
    \newgeometry{left=2cm, right=2.5cm, top=1.27cm, bottom=1cm}
    \begin{titlepage}
        \pagestyle{empty} 
        \begin{flushright} {\heiti\bfseries\wuhao 学号：}\underline{\makebox[3.2cm][c]{\textnormal{\@stunum}}} \end{flushright}
        \vspace{0.1cm} \noindent \hspace{1em} \includegraphics[width=7.45cm, height=2.44cm]{CcuTitle.png} \\
        \vspace{1.0cm} 
        \begin{center}
            \ccucovertitle \\
            \vspace{0.9cm} {\heiti\fontsize{18bp}{20bp}\selectfont \@title} \\
            \vspace{1.4cm}
            {\sihao\songti \renewcommand\arraystretch{1.3} 
                \begin{tabular}{l @{\hspace{1em}} >{\centering\arraybackslash}p{6.89cm}}
                    \makebox[2.12cm][s]{\bfseries 姓\hspace{2em} 名} & {\bfseries\@author} \\ \cline{2-2}
                    \makebox[2.12cm][s]{\bfseries 学\hspace{2em} 院} & \@academy \\ \cline{2-2}
                    \makebox[2.12cm][s]{\bfseries 专\hspace{2em} 业} & \@department \\ \cline{2-2}
                    \makebox[2.12cm][s]{\bfseries 班\hspace{2em} 级} & \@Class \\ \cline{2-2}
                    \makebox[2.12cm][s]{\bfseries 指导教师} & \@instructor \\ \cline{2-2}
                \end{tabular}
            }
        \end{center}
        \begin{tikzpicture}[remember picture, overlay]
            \node[anchor=south east] at ([xshift=-4.2cm, yshift=6cm]current page.south east) {
                {\sihao \begin{tabular}{@{}>{\centering\arraybackslash}p{\@yearwidth}@{}} \textnormal{\@dateyear} \\ \cline{1-1} \end{tabular}{\heiti ~年~}
                \begin{tabular}{@{}>{\centering\arraybackslash}p{\@monthwidth}@{}} \textnormal{\@datemonth} \\ \cline{1-1} \end{tabular}{\heiti ~月~}
                \begin{tabular}{@{}>{\centering\arraybackslash}p{\@daywidth}@{}} \textnormal{\@dateday} \\ \cline{1-1} \end{tabular}{\heiti ~日}}
            };
        \end{tikzpicture}
    \end{titlepage}
    \restoregeometry \pagestyle{fancy}
}

% ============= 7. 目录样式  =============
\renewcommand{\contentsname}{目\hspace{2em}录}
\setcounter{tocdepth}{2}
\hypersetup{ hidelinks, pdfstartview = FitH } 

\newcommand{\CGP@toc@style}{\songti\fontsize{12bp}{20bp}\selectfont}
\newcommand{\CGP@toc@connector}{\titlerule*[4.5pt]{.}} 

\titlecontents{chapter}[3.5em]
    {\vspace{0pt}\CGP@toc@style\bfseries}{\contentslabel{3.5em}}{\hspace*{-3.5em}}
    {{\mdseries\CGP@toc@connector\contentspage}} 

\titlecontents{section}[3.9em]
    {\vspace{0pt}\CGP@toc@style}{\contentslabel{2em}}{\hspace*{-2em}}
    {\CGP@toc@connector\contentspage}

\titlecontents{subsection}[6em]
    {\vspace{0pt}\CGP@toc@style}{\contentslabel{2.5em}}{\hspace*{-2.5em}}
    {\CGP@toc@connector\contentspage}

\renewcommand{\tableofcontents}{
    \clearpage
    \pagenumbering{Roman} 
    \pagestyle{fancy}
    \begin{center} 
        \vspace*{40bp} {\songti\sanhao\bfseries\contentsname} \par\vspace{40bp} 
    \end{center}
    \@starttoc{toc} 
    \clearpage 
    \pagenumbering{arabic} 
    \pagestyle{fancy}
}
\let \makecontents \tableofcontents

% ============= 8. 摘要环境与章节样式 =============
\newenvironment{cnabstract}[1]{
    \def \@cnkeywords {#1}
    \clearpage \pagenumbering{Roman} \pagestyle{fancy}
    \begin{center} \vspace*{10bp} {\songti\bfseries\xiaosan \mytitle} \vspace{10bp} \end{center}
    \noindent {\heiti\bfseries\xiaosi 摘要：}\xiaosi\songti 
}{
    \par\vspace{20bp}
    \noindent {\heiti\bfseries\xiaosi 关键词：}\xiaosi\songti \@cnkeywords
}

\newenvironment{enabstract}[1]{
    \def \@enkeywords {#1}
    \clearpage \pagestyle{fancy}
    \begin{center} \vspace*{10bp} {\bfseries\xiaosan \@entitle} \vspace{10bp} \end{center}
    \noindent {\bfseries\xiaosi Abstract: }\xiaosi\textnormal
}{
    \par\vspace{20bp}
    \noindent {\bfseries\xiaosi Key words: }\xiaosi\textnormal \@enkeywords
}

\newcommand{\unnumberedchapter}[1]{
    \clearpage \phantomsection
    \def\temp@title{#1}
    \IfStrEq{#1}{总结}{\def\temp@title{总\hspace{1em}结}}{}
    \IfStrEq{#1}{致谢}{\def\temp@title{致\hspace{1em}谢}}{}
    \IfStrEq{#1}{附录}{\def\temp@title{附\hspace{1em}录}}{}
    \IfStrEq{#1}{参考文献}{\def\temp@title{参考文献}}{}
    \addcontentsline{toc}{chapter}{\texorpdfstring{\temp@title}{#1}} 
    \begin{center} \vspace*{2bp} {\bfseries\songti\fontsize{15bp}{20pt}\selectfont \temp@title} \vspace{10pt} \end{center}
}

\ctexset{
    chapter = { format = {\centering\bfseries\songti\fontsize{15bp}{20pt}\selectfont}, beforeskip = {0pt}, afterskip = {20bp} },
    section = { format = {\bfseries\songti\fontsize{14bp}{20pt}\selectfont}, beforeskip = {10pt}, afterskip = {10pt}, fixskip = true },
    subsection = { format = {\bfseries\songti\fontsize{12bp}{20pt}\selectfont}, beforeskip = {10pt}, afterskip = {10pt}, fixskip = true }
}

% ============= 9. 图表环境 =============
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

\DeclareCaptionFont{wuhao}{\wuhao\songti}
\captionsetup{font=wuhao, labelsep=quad, justification=centering}
\DeclareCaptionLabelFormat{mysub}{#2)}
\captionsetup[subfigure]{labelformat=mysub, font=wuhao, skip=4pt, labelsep=none}

% \setlength{\intextsep}{20bp} \setlength{\textfloatsep}{20bp}
\newenvironment{generalfig}[3][H]{ \gdef\currfigcaption{#2} \gdef\currfiglabel{#3} \begin{figure}[#1] \centering }{ \caption{\currfigcaption} \label{\currfiglabel} \end{figure} }
\newenvironment{generaltab}[3][H]{ \gdef\currtabcaption{#2} \gdef\currtablabel{#3} \begin{table}[#1] \centering \wuhao \caption{\currtabcaption} \label{\currtablabel} }{ \end{table} }

% ============= 10. 公式样式 =============
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\def\tagform@#1{\maketag@@@{（\ignorespaces#1\unskip\@@italiccorr）}}
\allowdisplaybreaks[4]

% ============= 11. 参考文献 =============
\bibliographystyle{gbt7714-2015} % 设定默认样式
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
\renewcommand{\bibfont}{\wuhao\songti}
\setlength{\bibsep}{0pt}

% 重新定义 bibliography 命令，使其自动处理标题并加入目录
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
    \clearpage
    \unnumberedchapter{参考文献}
    \renewcommand{\bibsection}{} % 告诉 natbib 不要再生成默认标题
    \oldbibliography{#1}
}

% ============= 12. 代码块与附录 =============
\lstset{ backgroundcolor=\color{gray!5}, basicstyle=\ttfamily\small, breaklines=true, frame=single }

\AtBeginEnvironment{appendices}{
    \ctexset{ section={ number = {\arabic{section}}, aftername = {.\hspace{0.5em}}, name = {,}, format = {\bfseries\songti\sihao} } }
    \setcounter{section}{0}
    \renewcommand{\theequation}{A-\arabic{equation}}
    \renewcommand{\thefigure}{A-\arabic{figure}}
    \renewcommand{\thetable}{A-\arabic{table}}
}

% ============= 13. 文档启动设置 =============
\AtBeginDocument{
    \pagestyle{fancy}
    \emergencystretch=2em \hfuzz=2pt               
    \normalsize \setlength{\parindent}{2em} \setlength{\baselineskip}{20pt}   
    \hypersetup{ pdftitle={\texorpdfstring{\mytitle}{毕业设计论文}}, pdfauthor={\@author}, pdfsubject={长春大学毕业设计} }
}

\endinput
