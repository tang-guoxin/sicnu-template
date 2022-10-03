%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% 
%% File Name:           sicnu.cls LaTex 类文件
%% Author:              itanggx@gmail.com / tgx126sicnu@126.com
%% Created On:          2022-09-14 16:36
%% Last Modified By:    tang-guoxin
%% Description:         一个基于 TexLive 的 SICNU 模板, 使用该模板的要求为 TeXLive 版本大于等于 2021-11-15, 编译方式必须为 xelatex
%% Project Adress:      www.github.com/tang-guoxin/sicnu-template
%% Other:               .vscode 文件夹下的 setting.json 文件为 vscode 配置文件, 在里面已经定义了编译方式和步骤, 不能删除
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2021-11-15]
\ProvidesClass{sicnu}[Version == 1.0]
\LoadClass[a4paper, 12pt]{article}

% \def\pgfsysdriver{pgfsys -dvipdfmx.def}


\RequirePackage{tikz}           % 绘图包
\RequirePackage[heading=true]{ctex}
\RequirePackage{xeCJK}
\RequirePackage{xeCJKfntef}     % \CJKunderline, 使得\uline 或 \CJKunderline 下划线能够自动换行
\RequirePackage[sort&compress]{gbt7714}        % 参考文献规则 (GB/T 7714--2005) 查看源码发现, 该包已经内部导入了natbib
\RequirePackage[ruled,vlined,linesnumbered,resetcount,algosection]{algorithm2e} % 必须放到标题相关宏包前面
\RequirePackage{titletoc}       % 控制目录的宏包
\RequirePackage{titlesec}       % 控制标题的宏包
\RequirePackage{fancyhdr}       % 页眉和页脚的相关定义
\RequirePackage{color,xcolor}   % 支持彩色
\RequirePackage{graphicx}       % 处理图片
\RequirePackage{float}          % 浮动体处理
\RequirePackage{tabularx}       % 可伸缩表格
\RequirePackage{multirow}       % 表格可以合并多个row
\RequirePackage{booktabs}       % 表格横的粗线；\specialrule{1pt}{0pt}{0pt}
\RequirePackage{longtable}      % 支持跨页的表格。
\RequirePackage{enumitem}       % 使用enumitem宏包,改变列表项的格式
\RequirePackage{amsmath}        % 公式宏包
\RequirePackage{amssymb}        % 符号宏包
\RequirePackage{amsthm}         % 会和 ntheorem 冲突
\RequirePackage{bm}             % 处理数学公式中的黑斜体的宏包
\RequirePackage{lmodern}        % 数学公式字体
% \RequirePackage[amsmath,thmmarks,hyperref,amsthm]{ntheorem}    % 定理类环境宏包
\RequirePackage[hang]{subfigure}                        % 图形或表格并排排列
\RequirePackage[subfigure]{ccaption}                    % 支持双语标题
\RequirePackage{fontspec}       % 字体设置宏包
\RequirePackage{setspace}       % 精确设置全局行间距
\RequirePackage[normalem]{ulem} % 下划线 uline(这个包的下换线中文无法自动换行)
% \RequirePackage{CJKulem}        % ctex专用下划线 uline
% \RequirePackage{soul}           % \ul 方法
\RequirePackage{geometry}       % 设置页边距
\RequirePackage{multicol}       % 页面分栏
\RequirePackage{ragged2e}       % 对齐方式
\RequirePackage{epstopdf}       % 将 eps 格式转化为 pdf
% \RequirePackage{times}          % Time New Roman
\RequirePackage[T1]{fontenc}    % 英文字体加粗ulem
\RequirePackage{afterpage}      % 空白页管理
\RequirePackage{ifthen}         % \ifthenelse
\RequirePackage{xifthen}        % \ifnum
\RequirePackage{hyperref}       % 超链接
\RequirePackage{bibentry}       % 引入参考文献全文
\RequirePackage{listings}       % 插入代码
\RequirePackage[most]{tcolorbox}% 颜色盒子

% \RequirePackage{algorithm}      % 算法
% \RequirePackage{algorithmic}
% \RequirePackage[nottoc]{tocbibind}
% \RequirePackage[linesnumbered,lined,boxed,commentsnumbered]{algorithm2e}

\usetikzlibrary{fpu}            % 修理不能使用ifthenelse的错误
\usetikzlibrary{math}           % 使用数学程序

%% ! 设置超链接
\hypersetup{
    colorlinks  =   true,
    linkcolor   =   blue,
    filecolor   =   magenta,      
    urlcolor    =   cyan,
    citecolor   =   red,
    pdftitle    =   {title},
    pdfpagemode =   FullScreen,
}
\newcommand{\SetLinkColor}[1][1]{%
\newcommand{\colorlinknum}{#1}
\ifnum\colorlinknum = 1%
\hypersetup{
    colorlinks  =   true,
    linkcolor   =   blue,
    filecolor   =   magenta,      
    urlcolor    =   cyan,
    citecolor   =   red,
    pdftitle    =   {title},
    pdfpagemode =   FullScreen,
}
\else
\hypersetup{hidelinks}
\fi
}

%% ! Times New Roman
\setmainfont{Times New Roman}

%% ! 页边距
% \geometry{hmargin=1.25in,vmargin=1in}
\geometry{%
    hmargin = 25mm,
    vmargin = 30mm,
    twoside = true
}

%% ! 行间距为 20 磅
\setlength{\baselineskip}{20pt}

%% ! 获取字段长度
\def\Length#1{{\count0=0 \getlength#1\end \number\count0}}
\def\getlength#1{\ifx#1\end \let\next=\relax
\else\advance\count0 by1 \let\next=\getlength\fi \next}


%% ! 定义基本元素
\newlength{\thetitlelength}
% \newcommand{\thetitlelength}{999}
% \renewcommand{\thetitlelength}{\Length{#1}}
\newcommand{\ctitle}{(中文题目)}
\newcommand{\ChineseTitle}[1]{
    \renewcommand{\ctitle}{#1}
    \settowidth{\thetitlelength}{#1}
}

\newcommand{\etitle}{(English Title)}
\newcommand{\EnglishTitle}[1]{\renewcommand{\etitle}{#1}}

\newcommand{\cname}{(中文名)}
\newcommand{\ChineseAuthorName}[1]{\renewcommand{\cname}{#1}}

\newcommand{\ename}{(English Name)}
\newcommand{\EnglishAuthorName}[1]{\renewcommand{\ename}{#1}}

\newcommand{\classf}{O21}
\newcommand{\Classification}[1]{\renewcommand{\classf}{#1}}

\newcommand{\secretl}{公开}
\newcommand{\SecretLevel}[1]{\renewcommand{\secretl}{#1}}

\newcommand{\unitc}{10636}
\newcommand{\UnitCode}[1]{\renewcommand{\unitc}{#1}}

\newcommand{\stunum}{学号}
\newcommand{\StudentNumber}[1]{\renewcommand{\stunum}{#1}}

\newcommand{\cmentorn}{中文导师姓名}
\newcommand{\ChineseSupervisor}[1]{\renewcommand{\cmentorn}{#1}}

\newcommand{\ementorn}{English Supervisor Name}
\newcommand{\EnglishSupervisor}[1]{\renewcommand{\ementorn}{#1}}

\newcommand{\cmajorn}{中文专业}
\newcommand{\ChineseMajorName}[1]{\renewcommand{\cmajorn}{#1}}

\newcommand{\emajorn}{English Major Name}
\newcommand{\EnglishMajorName}[1]{\renewcommand{\emajorn}{#1}}

\newcommand{\researchd}{研究方向}
\newcommand{\ResearchDirection}[1]{\renewcommand{\researchd}{#1}}

\newcommand{\collegen}{所在学院}
\newcommand{\CollegeName}[1]{\renewcommand{\collegen}{#1}}

\newcommand{\submissiondate}{论文提交日期}
\newcommand{\ThesisSubmissionDate}[1]{\renewcommand{\submissiondate}{#1}}

\newcommand{\defensedate}{论文答辩日期}
\newcommand{\ThesisDefenseDate}[1]{\renewcommand{\defensedate}{#1}}

\newcommand{\ekey}{英文关键词}
\newcommand{\EnglishKeyword}[1]{\renewcommand{\ekey}{#1}}

\newcommand{\ckey}{中文关键词}
\newcommand{\ChineseKeyword}[1]{\renewcommand{\ckey}{#1}}

%% ! 增加空白页
\newcommand\NewEmptypPge{
    \null
    \thispagestyle{empty}
    \addtocounter{page}{-1}
    \newpage
}

%% ! 比较两个数的大小
\makeatletter
\newif\if@twonumcmp
\newcommand\EqualityNum[2]
{%
    \ifdim#1pt > #2pt
        \DeclareOption{twonumcmp}{\@twonumcmptrue}
    \else%
        \DeclareOption{twonumcmp}{\@twonumcmpfalse}
    \fi%
}
\makeatother

%% ! 重定义幼圆和仿宋(因为原始的幼圆无法加粗, 使用局部伪粗体)
\let\youyuan\relax
\newCJKfontfamily\newyouyuan{YouYuan}[AutoFakeBold]
\let\fangsong\relax
\newCJKfontfamily\newfangsong{FangSong}[AutoFakeBold]

%% ! 设置章节格式
\ctexset{
    section={                               % 一级标题
        name={,~},
        number={\arabic{section}},          % or \chinese
        format=\heiti\zihao{3},             % 三号黑体
        aftername=\hspace{0pt}
    },
    subsection={                            % 二级标题
        name={,~},
        number={\arabic{section}.\arabic{subsection}},
        format=\heiti\zihao{4},             % 四号黑体
        aftername=\hspace{0pt}
    },
    subsubsection={                         % 三级标题
        name={,~},
        number={\arabic{section}.\arabic{subsection}.\arabic{subsubsection}},
        format=\heiti\zihao{-4},            % 小四号黑体
        aftername=\hspace{0pt}
    }
}

%% ! 定制页眉页脚
\newcommand{\DegreeLevel}{四川师范大学硕士学位论文}
\pagestyle{fancy}
\fancyhf{}
%% ? 页眉设置
\renewcommand{\sectionmark}[1]{\markboth{\thesection~\ #1}{}}
\fancyhead[CE]{{\zihao{-5}\songti \DegreeLevel}}
\fancyhead[CO]{{\zihao{-5}\songti\leftmark}}
%% ? 页脚设置
\fancyfoot[LE,RO]{\thepage}
% \renewcommand{\headrulewidth}{2pt}
% \renewcommand{\footrulewidth}{2pt}

%% ! 定制目录
\titlecontents{section}[0pt]{\addvspace{5pt}\filright}{\contentspush{\thecontentslabel}}{}{\titlerule*[8pt]{.}\contentspage}
\newcommand{\GenerateContents}{%
\renewcommand\contentsname{\hfill \textbf{目\quad 次} \hfill}
\tableofcontents
\cleardoublepage
\pagenumbering{arabic}
}

%% ! 设置参考文献
%% ? 设置国标格式
\bibliographystyle{gbt7714-numerical}
\nobibliography*
\renewcommand\refname{\hfill \textbf{参考文献} \hfill}
%% todo cmd
\newcommand{\SetReference}{%
\addcontentsline{toc}{section}{参考文献}
\bibliography{./src/ref.bib}
\cleardoublepage
}

%% ! 生成扉页
\newcommand{\tknumx}{18}
\newcommand{\maxtitlelength}{18}
%% todo: next
\newcommand{\MakeTitlePage}[1][0]{
%% ? def
\newcommand{\thisparone}{#1}
\ifthenelse{\lengthtest{\thetitlelength > 18em}}{
    \renewcommand{\tknumx}{19}
}{
    \renewcommand{\tknumx}{18}
}
%% todo
\thispagestyle{empty}
\addtocounter{page}{-1}
%% ! 版面信息
\begin{figure}[t]
    % \fbox{
        \begin{minipage}[t]{16em}
            \makebox[4em][s]{分类号：}
            \uline{\makebox[10em][c]{\zihao{5} \classf}}
            \par \vspace*{1em}
            \makebox[4em][s]{密级：}
            \uline{\makebox[10em][c]{\zihao{5} \secretl}}
        \end{minipage}
    % }
    \hspace{\fill}
    % \fbox{
        \begin{minipage}[t]{16em}
            \makebox[5em][s]{单位代码：}
            \uline{\makebox[10em][c]{\unitc}}
            \par \vspace*{1em}
            \makebox[5em][s]{学号：}
            \uline{\makebox[10em][c]{\stunum}}
        \end{minipage}
    % }
\end{figure}

%% ! 大学名称的矢量图文件
\begin{figure}[H]
    \centering
    \includegraphics[scale=1.5]{./format/flage.pdf}
\end{figure}

%% ! "学位论文" 标题
\ifnum\thisparone = 1
\begin{center}
    {{\makebox[40em][c]{{\fontsize{42pt}{\baselineskip}{{{\bfseries\newyouyuan 博\ 士\ 学\ 位\ 论\ 文}}}}}}}
\end{center}
\else
\begin{center}
    {{\makebox[40em][c]{{\fontsize{42pt}{\baselineskip}{{{\bfseries\newyouyuan 硕\ 士\ 学\ 位\ 论\ 文}}}}}}}
\end{center}
\fi

%% ! 加载logo
\begin{figure}[H]
    \centering
    \includegraphics[scale=0.1]{./format/logo.pdf}
\end{figure}
% \vspace*{-1em}
%% ! 中英文题目
\begin{figure}[H]
    \centering
    % \fbox{
    \begin{minipage}[h]{42em}
        \begin{figure}[H]
            % \fbox{
                \begin{minipage}[t]{10em}
                    \begin{figure}[H]
                        \makebox[7em][s]{\fontsize{16pt}{\baselineskip}{中文论文题目：}}
                    \end{figure}
                \end{minipage}
            % }
            % \hfill
            % \hspace{-2em}
            % \fbox{
                \begin{minipage}[t]{30em}
                    \vspace{-0.5em}
                    \begin{figure}[H]
                        \begin{tikzpicture}
                            \tikzmath{
                                function drawtitle(\stringnum){%
                                    if \stringnum > \maxtitlelength then{
                                        {
                                            \draw (0, 0.9) -- (12, 0.9);
                                            \draw (0, 0) -- (12, 0);
                                            \node at(6, 0.8) {\parbox[t][][c]{28em}{\centering\fontsize{16pt}{26pt}\selectfont\bfseries\newfangsong\ctitle}};
                                        };
                                    }else{%
                                        {
                                            \draw (0, 0.9) -- (12, 0.9);
                                            \draw (0, 0) -- (12, 0);
                                            \node at(6, 1.3) {\parbox[t][][c]{28em}{\centering\fontsize{16pt}{26pt}\selectfont\bfseries\newfangsong\ctitle}};
                                        };
                                    };
                                };
                            drawtitle(\tknumx);
                            };
                        \end{tikzpicture}
                    \end{figure}
                    
                \end{minipage}
            % }
        \end{figure}
    \end{minipage}
    % }
    \vspace{1em}
    % \fbox{
    \begin{minipage}[h]{42em}
        \begin{figure}[H]
            % \fbox{
                \begin{minipage}[t]{10em}
                    \begin{figure}[H]
                        \makebox[7em][s]{\fontsize{16pt}{\baselineskip}{英文论文题目：}}
                    \end{figure}
                \end{minipage}
            % }
            % \hfill
            % \hspace{-2em}
            % \fbox{
                \begin{minipage}[t]{30em}
                    \vspace{-0.3em}
                    \begin{figure}[H]
                        \begin{tikzpicture}
                            \draw (0, 0.9) -- (12, 0.9);
                            \draw (0, 0) -- (12, 0);
                            \node at(6, 0.8) {\parbox[t][][c]{28em}{\centering\fontsize{16pt}{26pt}\selectfont\textbf{\etitle}}};
                        \end{tikzpicture}
                    \end{figure}
                \end{minipage}
            % }
        \end{figure}
    \end{minipage}
    % }
\end{figure}
%% ! 个人信息
% \vspace*{-1em}
\begin{figure}[H]
    \centering
    %% * 论文作者
    \makebox[6em][s]{\zihao{4} 论文作者：}\uline{\makebox[17em][c]{\zihao{4} \fangsong \cname}}
    %% * 指导教师
    \par \vspace*{1em}
    \makebox[6em][s]{\zihao{4} 指导教师：}\uline{\makebox[17em][c]{\zihao{4} \cmentorn}}
    %% * 专业名称
    \par \vspace*{1em}
    \makebox[6em][s]{\zihao{4} 专业名称：}\uline{\makebox[17em][c]{\zihao{4} \cmajorn}}
    %% * 研究方向
    \par \vspace*{1em}
    \makebox[6em][s]{\zihao{4} 研究方向：}\uline{\makebox[17em][c]{\zihao{4} \researchd}}
    %% * 所在学院
    \par \vspace*{1em}
    \makebox[6em][s]{\zihao{4} 所在学院：}\uline{\makebox[17em][c]{\zihao{4} \collegen}}
    %% ! 时间信息
    \par \vspace*{1em}
    %% * 论文提交日期
    \makebox[9em][s]{\zihao{4} 论文提交日期：}\uline{\makebox[14em][c]{\zihao{4} \submissiondate}}
    %% * 论文答辩日期
    \par \vspace*{1em}
    \makebox[9em][s]{\zihao{4} 论文答辩日期：}\uline{\makebox[14em][c]{\zihao{4} \defensedate}}
\end{figure}

\clearpage

\NewEmptypPge
%% ! 四川师范大学学位论文独创性声明
\thispagestyle{empty}
\addtocounter{page}{-1}
\vspace*{4em}
\begin{figure}[H]
    \begin{center}
        {\zihao{-3} \newfangsong 四川师范大学学位论文独创性声明}
    \end{center}
    \begin{minipage}[t]{43em}
        \linespread{1.5}\selectfont
        \par \qquad 本人声明：所呈交学位论文{\CJKunderline{《\ctitle》}}，是本人在导师\CJKunderline{\cmentorn}指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文不含任何其他个人或集体已经发表或撰写过的作品或成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本声明的法律结果由本人承担。
        \par \qquad 本人承诺：已提交的学位论文电子版与论文纸本的内容一致。如因不符而引起的学术声誉上的损失由本人自负。
    \end{minipage}
    \vspace*{1em}
    \begin{figure}[H]
        \centering
        % \fbox{
            \begin{minipage}[t]{12em}
                {\zihao{4} \newfangsong {学位论文作者：}}
            \end{minipage}
        % }
        \hfill
        % \fbox{
            \begin{minipage}[t]{16em}
                {\zihao{4} \newfangsong {签字日期：~~~~~~~~年~~~~~月~~~~日}}
            \end{minipage}
        % }
    \end{figure}
\end{figure}
\vspace*{3em}
%% ! 四川师范大学学位论文版权使用授权书
\begin{figure}[H]
    \begin{center}
        {\zihao{3} \newfangsong 四川师范大学学位论文版权使用授权书}
    \end{center}
    \begin{minipage}[t]{43em}
        \linespread{1.5}\selectfont
        \par \qquad 本人同意所撰写学位论文的使用授权遵照学校的管理规定：
        \par \qquad 学校作为申请学位的条件之一，学位论文著作权拥有者须授权所在大学拥有学位论文的部分使用权，即：1）已获学位的研究生必须按学校规定提交印刷版和电子版学位论文，可以将学位论文的全部或部分内容编入有关数据库供检索；2）为教学、科研和学术交流目的，学校可以将公开的学位论文或解密后的学位论文作为资料在图书馆、资料室等场所或在有关网络上供阅读、浏览。
        \par \qquad ~~~~
        \par \qquad 本人授权万方数据电子出版社将本学位论文收录到《中国学位论文全文数据库》，并通过网络向社会公众提供信息服务。同意按相关规定享受相关权益。
        \par \qquad （保密的学位论文在解密后适用本授权书）
    \end{minipage}
    \vspace*{1em}
    \begin{figure}[H]
        {\makebox[14em][l]{学位论文作者签名：}} \hfill {\makebox[14em][l]{导师签名：} }
    \end{figure}
    
    \begin{figure}[H]
        {\makebox[14em][l]{签字日期：~~~~~~~~年~~~~~~~~月~~~~~~~~日}} \hfill {\makebox[14em][l]{签字日期：~~~~~~~~年~~~~~~~~月~~~~~~~~日} }
    \end{figure}
\end{figure}
\clearpage

\NewEmptypPge

}

%% ! 中文摘要环境
\newenvironment{ChineseAbstract}[1][1]{%
% \section*{摘要}
\pagenumbering{Roman}
\markboth{摘要}{}
\addcontentsline{toc}{section}{摘要}
\newcommand{\isanewpagec}{#1}
    \begin{figure}[H]
        \begin{center}
            {\zihao{-2} \ctitle}
        \end{center}
        \vspace*{1em}
        \begin{center}
            {\zihao{-4} \heiti {\cmajorn~~专业}}
        \end{center}
        \begin{figure}[H]
            {\makebox[20em][r]{{\heiti 研究生}~~{\newfangsong\cname}}} \hfill {\makebox[20em][l]{{\heiti 指导教师}~~{\newfangsong\cmentorn}}}
        \end{figure}
    \end{figure}
\begin{quotation}
\setlength{\parindent}{2em}\selectfont
\par {\heiti 摘要：} \noindent
}{%
\par {\heiti 关键词：} \ckey
\end{quotation}
\cleardoublepage
}
%% // 已移除的功能
% \ifnum\isanewpagec = 1
%     \clearpage\NewEmptypPge%
% \else
%     \clearpage%
% \fi

%% ! 英文摘要环境
\newenvironment{EnglishAbstract}[1][0]{
% \section*{ABSTRACT}
\markboth{ABSTRACT}{}
\addcontentsline{toc}{section}{ABSTRACT}
\newcommand{\isanewpagee}{#1}
    \begin{figure}[H]
        \begin{center}
            {\zihao{-2} \etitle}
        \end{center}
        \vspace*{1em}
        \begin{center}
            {\zihao{-4} \textbf{Major:~~\emajorn}}
        \end{center}
        \begin{figure}[H]
            {\makebox[20em][r]{{\textbf{Master:}}~~{\newfangsong\ename}}} \hfill {\makebox[20em][l]{{\textbf{Supervisor:}}~~{\newfangsong\ementorn}}}
        \end{figure}
    \end{figure}
\begin{quotation}
\setlength{\parindent}{2em}\selectfont
\par {\textbf{Abstract:}} \noindent
}{%
\par {\textbf{Keywords:}} \ekey
\end{quotation}
\cleardoublepage
}

%% ! 致谢环境
\newenvironment{MyHeart}{%
\section*{\hfill 致\quad 谢 \hfill}
\markboth{致谢}{}
\addcontentsline{toc}{section}{致谢}
\begin{quotation}
}{%
\end{quotation}
\cleardoublepage
}

%% ! 插入研究成果
\newenvironment{Achievement}{%
\section*{\hfill 在校期间的科研成果 \hfill}
\markboth{在校期间的科研成果}{}
\addcontentsline{toc}{section}{在校期间的科研成果}
\begin{enumerate}
\renewcommand\labelenumi{[\theenumi]}
}{%
\end{enumerate}
\cleardoublepage
}

%% ! 插入附录
\newenvironment{Appendix}{%
\section*{\hfill 附\quad 录 \hfill}\label{sec:appendix}
\markboth{附录}{}
\addcontentsline{toc}{section}{附录}
\begin{quotation}
}{%
\end{quotation}
\cleardoublepage
}

%% ! 设置数学定理, 定义, 推论, 引理, 命题, 性质, 标注, 例子和证明环境
\renewcommand{\proofname}{\indent\bf 证明}
\newtheorem{theorem}{\qquad 定理}[section]
\newtheorem{corollary}{\qquad 推论}[section]
\newtheorem{example}{\qquad 例子}[section]
\newtheorem{lemma}{\qquad 引理}[section]
\newtheorem{proposition}{\hspace{2em} 命题}[section]
\newtheorem{definition}{\hspace{2em} 定义}[section]

%% ! 设置算法
\SetKwRepeat{Do}{do}{while}
\SetKwInOut{KwIn}{输入}
\SetKwInOut{KwOut}{输出}
\renewcommand{\listalgorithmcfname}{算法}
\renewcommand{\algorithmcfname}{算法}
% \renewcommand{\thealgocf}{\thesection.\arabic{algorithm2e}}
% \listofalgorithms
% \listofalgorithmes
% \newcommand{\listofalgorithmes}{\tocfile{\listalgorithmcfname}{loa}}

%% ! 关联章节和公式
\numberwithin{equation}{section}
\numberwithin{figure}{section}
\numberwithin{table}{section}

%% ! 设置表格图片与标题的距离

% \setlength{\abovecaptionskip}{10pt}

\setlength{\belowcaptionskip}{10pt}


\newcommand{\GenerateFTAList}{
    \thispagestyle{empty} 
    \markboth{图表和算法清单}{}
    \listoffigures
    \listoftables
    \listofalgorithms
}
