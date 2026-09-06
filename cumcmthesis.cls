% =============================================================================
%  cumcmthesis.cls —— 全国大学生数学建模竞赛（CUMCM）论文模板
% -----------------------------------------------------------------------------
%  编译器 : XeLaTeX（强制）
%  字体   : 全部随仓库分发于 fonts/，不依赖系统字体
% =============================================================================

\NeedsTeXFormat{LaTeX2e}[2020/02/02]
\ProvidesClass{cumcmthesis}[2026/01/01 CUMCM Paper Template]

%% -----------------------------------------------------------------------------
%% 文档选项
%%   colorprint  彩色输出（默认且唯一）
%%   notoc       不生成目录
%%   draft       草稿：不加载图片与代码高亮
%% -----------------------------------------------------------------------------}
\newif\if@mcm@toc\@mcm@tocfalse
\newif\if@mcm@draft\@mcm@draftfalse

\DeclareOption{colorprint}{}
\DeclareOption{notoc}{\@mcm@tocfalse}
\DeclareOption{toc}{\@mcm@toctrue}
\DeclareOption{draft}{\@mcm@drafttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{colorprint,notoc}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{article}

%% -----------------------------------------------------------------------------
%% 编译器校验：仅允许 XeLaTeX
%% -----------------------------------------------------------------------------}
\RequirePackage{ifxetex}
\ifxetex\else
  \ClassError{cumcmthesis}{请使用 XeLaTeX 编译，而非 pdflatex/latex。}{%
    请将编译器切换为 XeLaTeX。}
\fi

%% -----------------------------------------------------------------------------
%% 字体注册（fonts/ 目录）
%%   更换字体时：替换 fonts/ 文件 + 修改此处的 Path / UprightFont / BoldFont
%% -----------------------------------------------------------------------------}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}

% 西文正文：Libertinus Serif（Times-like 衬线）
\setmainfont{LibertinusSerif}[
  Path            = fonts/, Extension = .otf,
  UprightFont     = *-Regular, BoldFont   = *-Bold,
  ItalicFont      = *-Italic,  BoldItalicFont = *-BoldItalic
]

% 西文无衬线：Libertinus Sans
\setsansfont{LibertinusSans}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-Regular, BoldFont = *-Bold
]

% 等宽（代码）：TeX Gyre Cursor
\setmonofont{texgyrecursor}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-regular, BoldFont   = *-bold,
  ItalicFont  = *-italic,  BoldItalicFont = *-bolditalic
]

% 中文：ctex(fontset=none) + fontspec 注册 CJK 家族
% （避免 ctex 默认 fontset 触发 "Font undefined" 警告）
\RequirePackage[fontset=none, scheme=plain]{ctex}

\setCJKmainfont{NotoSerifCJKsc}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-Regular, BoldFont = *-Bold,
  ItalicFont = *-Regular % 宋体无 italic，用 regular 兜底
]
\setCJKsansfont{NotoSansCJKsc}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-Regular, BoldFont = *-Bold
]
\setCJKmonofont{NotoSerifCJKsc}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-Regular, ItalicFont = *-Regular
]

% 注册 song / hei 家族，提供 \songti / \heiti 命令别名
\setCJKfamilyfont{song}{NotoSerifCJKsc}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-Regular, BoldFont = *-Bold
]
\setCJKfamilyfont{hei}{NotoSansCJKsc}[
  Path = fonts/, Extension = .otf,
  UprightFont = *-Regular, BoldFont = *-Bold
]
\providecommand{\songti}{}\renewcommand{\songti}{\CJKfamily{song}}
\providecommand{\heiti}{}\renewcommand{\heiti}{\CJKfamily{hei}}

% 数学：Libertinus Math（与 Serif 配套的 OpenType 数学字体）
\setmathfont{LibertinusMath-Regular.otf}[Path = fonts/]

%% -----------------------------------------------------------------------------
%% 页面：A4 + 25mm 边距 + 1.38 行距 + 2em 首行缩进
%% -----------------------------------------------------------------------------}
\RequirePackage[a4paper, top=25mm, bottom=25mm, left=25mm, right=25mm]{geometry}
\renewcommand{\baselinestretch}{1.38}
\setlength{\parindent}{2em}

% tabular 行距与正文一致
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
  {\bgroup\renewcommand{\arraystretch}{1.38}\mcm@oldtabular}%
  {\mcm@endoldtabular\egroup}

\renewcommand\normalsize{%
  \@setfontsize\normalsize{12pt}{14.5pt}%
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}
\normalsize

%% -----------------------------------------------------------------------------
%% 常用宏包
%%   注意：不加载 bm（与 unicode-math 冲突），用 \symbf 替代并提供 \bm 别名
%%   注意：不加载 amssymb/amsfonts（符号已被 unicode-math 定义）
%% -----------------------------------------------------------------------------}
\RequirePackage{amsmath}
\providecommand{\bm}[1]{\symbf{#1}}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{subcaption}
\RequirePackage{array, longtable, booktabs, tabularx, multirow, bigstrut, bigdelim}
\RequirePackage{pgfplotstable}                          % CSV → 三线表
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{ulem}
\RequirePackage{calc}
\RequirePackage{amsthm}
\RequirePackage{indentfirst}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}

% draft 模式跳过图片渲染
\if@mcm@draft
  \setkeys{Gin}{draft=true}
\fi

% draft 模式下以空实现替换 listings
\if@mcm@draft
  \providecommand{\lstinputlisting}[2][]{\ClassWarning{cumcmthesis}{draft 模式跳过代码列表}}
  \providecommand{\lstinline}[2][]{#2}
  \providecommand{\lstdefinestyle}[2]{}
  \providecommand{\lstset}[1]{}
\else
  \RequirePackage{listings}
\fi

%% -----------------------------------------------------------------------------
%% 浮动体参数（让图表贴近引用处）
%% -----------------------------------------------------------------------------}
\renewcommand{\textfraction}{0.05}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

% 图片搜索路径
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png,.jpeg}

%% -----------------------------------------------------------------------------
%% 章节标题：一级中文（一、），二级 1.1，三级 1.1.1，统一用黑体加粗
%% -----------------------------------------------------------------------------}
\renewcommand{\thesection}{\chinese{section}、}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\titleformat{\section}{\centering\Large\bfseries\heiti}{\thesection}{1em}{}
\titleformat{\subsection}{\large\bfseries\heiti}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalsize\bfseries\heiti}{\thesubsubsection}{1em}{}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\setcounter{secnumdepth}{3}

%% -----------------------------------------------------------------------------
%% CSV 表格便捷命令
%%   用法：\csvtable{data/xxx.csv}{表标题}{tab:xxx}
%%   要求：CSV 必须 UTF-8 编码，逗号分隔，首行为表头
%% -----------------------------------------------------------------------------}
\pgfplotsset{compat=1.18}
\pgfplotstableset{
  col sep=comma, header=true, string type,
  every head row/.style={before row=\toprule, after row=\midrule},
  every last row/.style={after row=\bottomrule}
}
\newcommand{\csvtable}[3]{%
  \begin{table}[H]
    \centering
    \caption{#2}\label{#3}
    \pgfplotstabletypeset{#1}
  \end{table}%
}

%% -----------------------------------------------------------------------------
%% 页眉页脚：页码居中位于页脚
%% -----------------------------------------------------------------------------}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}
% plain 页式（章节首页）同样在页脚中部显示页码
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

%% -----------------------------------------------------------------------------
%% 图表标题：宋体小四加粗，悬挂缩进
%% -----------------------------------------------------------------------------}
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{format=hang, labelsep=quad, font={song, minusfour, bf}, position=bottom}
\captionsetup[table]{format=hang, labelsep=quad, font={song, minusfour, bf}, position=top}

%% -----------------------------------------------------------------------------
%% 列表全局参数
%% -----------------------------------------------------------------------------}
\setlist{%
  topsep=0.3em, partopsep=0pt, itemsep=0ex plus 0.1ex, parsep=0pt,
  leftmargin=2em, labelsep=0.5em}

%% -----------------------------------------------------------------------------
%% listings 代码样式：TeX Gyre Cursor + 浅灰底 + 边框
%%   关键字深蓝、注释绿、字符串紫、行号灰、浅灰底
%% -----------------------------------------------------------------------------}
\if@mcm@draft\else
  \definecolor{codegreen}{rgb}{0,0.6,0}
  \definecolor{codegray}{rgb}{0.5,0.5,0.5}
  \definecolor{codepurple}{rgb}{0.58,0,0.82}
  \definecolor{backcolour}{rgb}{0.95,0.95,0.92}
  \colorlet{codekw}{NavyBlue}
  \colorlet{codecomment}{codegreen}
  \colorlet{codestring}{codepurple}
  \colorlet{codenumber}{codegray}
  \colorlet{codebg}{backcolour}
  \colorlet{coderule}{red!20!green!20!blue!20}
  \lstdefinestyle{mystyle}{
    backgroundcolor=\color{codebg},
    commentstyle=\color{codecomment},
    keywordstyle=\color{codekw},
    numberstyle=\footnotesize\color{codenumber},
    stringstyle=\color{codestring},
    basicstyle=\ttfamily\small,
    breakatwhitespace=false, breaklines=true,
    captionpos=b, keepspaces=true,
    numbers=left, numbersep=5pt,
    showspaces=false, showstringspaces=false, showtabs=false,
    tabsize=2, frame=single,
    rulesepcolor=\color{coderule}
  }
  \lstset{style=mystyle}
  \lstdefinestyle{Python}{language=Python}
  \lstdefinestyle{Matlab}{language=Matlab}
  \lstdefinestyle{Cpp}{language=C++}
\fi

%% -----------------------------------------------------------------------------
%% 定理类环境
%% -----------------------------------------------------------------------------}
\newtheorem{definition}{定义}
\newtheorem{theorem}{定理}
\newtheorem{lemma}{引理}
\newtheorem{corollary}{推论}
\newtheorem{assumption}{假设}
\newtheorem{example}{例}
\newtheorem{solution}{解}

%% -----------------------------------------------------------------------------
%% TikZ 流程图预设（保留彩色填充）
%% -----------------------------------------------------------------------------}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta, positioning}
\colorlet{startstopfill}{red!20}
\colorlet{processfill}{blue!20}
\colorlet{decisionfill}{green!20}
\tikzset{
  startstop/.style={rectangle, rounded corners, minimum width=3cm, minimum height=1cm,
                    text centered, draw=black, fill=startstopfill},
  process/.style={rectangle, minimum width=3.5cm, minimum height=1cm,
                  text centered, draw=black, fill=processfill},
  decision/.style={diamond, aspect=2, minimum width=3.5cm, minimum height=1cm,
                   text centered, draw=black, fill=decisionfill},
  arrow/.style={thick, ->, >=stealth}
}

%% -----------------------------------------------------------------------------
%% 参考文献：natbib super + numbers + sort&compress
%%   样式 gbt7714-numeric.bst 在 bib/ 目录；用 \cite{key} 引用
%% -----------------------------------------------------------------------------}
\RequirePackage[super, numbers, sort&compress]{natbib}

%% -----------------------------------------------------------------------------
%% 超链接与交叉引用（最后加载）
%%   \pdfstringdefDisableCommands 修复 PDF 书签 "Token not allowed" 警告
%% -----------------------------------------------------------------------------}
\RequirePackage{hyperref}
\hypersetup{
  pdfstartview=FitH,
  CJKbookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
  colorlinks=true, linkcolor=NavyBlue, citecolor=Maroon, urlcolor=NavyBlue,
  breaklinks=true
}
\pdfstringdefDisableCommands{%
  \def\cftdotfill{ }%
  \def\leavevmode{}%
  \def\kern#1{}%
}

%% -----------------------------------------------------------------------------
%% 中文标题名称（目录、参考文献、图表等）
%% -----------------------------------------------------------------------------}
\renewcommand\contentsname{目录}
\renewcommand\listfigurename{插图清单}
\renewcommand\listtablename{附表清单}
\renewcommand\refname{参考文献}
\renewcommand\indexname{索引}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\renewcommand\appendixname{附录}
\renewcommand\abstractname{摘要}
\newcommand*\mcm@cap@keywordsname{关键词}

%% -----------------------------------------------------------------------------
%% 摘要关键词存储
%% -----------------------------------------------------------------------------}
\newcommand*\mcm@tokens@keywords{}

%% -----------------------------------------------------------------------------
%% \maketitle：摘要页标题（居中、黑体二号加粗），并把摘要页设为第 1 页
%% -----------------------------------------------------------------------------}
\renewcommand{\maketitle}{%
  \setcounter{page}{1}%
  \begin{center}
    {\heiti\zihao{2}\bfseries \@title\par}
  \end{center}
  \vspace{1em}
}

%% -----------------------------------------------------------------------------
%% quotation / abstract 环境
%%   quotation : 取消左右边距，使摘要文字占满版心
%%   abstract  : 居中"摘要"标题 + quotation 正文（宋体小四，2em 缩进）
%% -----------------------------------------------------------------------------}
\renewenvironment{quotation}
  {\list{}{\listparindent 2em%
     \itemindent \listparindent
     \rightmargin\z@ \leftmargin\z@
     \parsep \z@ \@plus\p@}%
   \item\relax}
  {\endlist}

\renewenvironment{abstract}{%
  \phantomsection
  \addcontentsline{toc}{section}{摘要}
  \begin{center}{\zihao{3}\bfseries \abstractname}\end{center}
  \begin{quotation} \zihao{-4}\songti \setlength{\parindent}{2em}%
}{\end{quotation}}

% \keywords{...} : 输出"关键词：..."后另起一页（让正文从新页开始）
\newcommand\keywords[1]{%
  \renewcommand{\mcm@tokens@keywords}{#1}%
  \par\vskip1ex
  {\noindent\zihao{-4}\bfseries\heiti\mcm@cap@keywordsname：}~{\zihao{-4}\mcm@tokens@keywords}
  \newpage
}

%% -----------------------------------------------------------------------------
%% 参考文献环境（数字标签，GB/T 7714 样式）
%% -----------------------------------------------------------------------------}
\renewenvironment{thebibliography}[1]%
  {\phantomsection
   \addcontentsline{toc}{section}{\refname}%
   \section*{\refname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
     {\settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \widowpenalty4000%
   \sfcode`\.\@m}%
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}

\endinput
