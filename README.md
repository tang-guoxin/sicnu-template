# SICNU研究生毕业论文模板



```she	
git clone https://github.com/tang-guoxin/sicnu-template.git
```



## 1. 这个模板有什么特点

### 1.1 简洁

- 只需要一行代码`\documentclass{sicnu}`就完成了整个模板的设置

### 1.2 易用

- 模板加入了非常规范的注释，甚至你不需要阅读说明也能开始直接修改

### 1.3 结构清晰

- 将摘要、第一章、第二章、......、以及附录等用不同的文件分离，而不是一股脑的放到一个文件中。

```bash
\sicnu-template
----./vscode					% vscode配置文件夹
----./format					% 学校logo等矢量图文件夹
----./img 						% 存放你自己的矢量图文件夹
----./src 						% LaTex源文件夹, 存放tex文件和bib参考文献数据库
--------./abstract.tex			% 摘要应该写在这里面
--------./acknowledgement.tex	% 致谢
--------./appendix.tex			% 附录
--------./part1.tex				% 第一章
--------./part2.tex				% 第二章
--------./part3.tex				% 第三章
--------./result.tex			% 第四章
--------./ref.bib				% 参考文献数据库
----./main.tex					% 主程序，非vscode用户必须运行这个文件
----./main.pdf					% 生成的pdf文档
----./sicnu.cls					% sicnu模板类文档
```

- 关于参考文献数据库的使用方法，请阅读`main.pdf`文件。这里略去了编译的中间文档。

### 1.4 接口丰富

- 只需要简单的修改参数就可以将模板改为博士论文而不需要修改源代码

### 1.5 布局风格规范

- 模板以浮动体和盒子为基本元素，如果你愿意阅读源代码，你可以很轻松的修改它，就像拼图一样简单



## 2 相比以前的`CTex`模板做了哪些改进

- 封装了超过$40$个包，定义了$29$个新指令，$5$个新环境，$7$个重定义环境，主程序和正文区域非常干净，没有任何一个与论文无关的指令
- 使用多级结构，而不是一个文件写到黑
- 参考文献使用`bib`数据库管理，并支持`(GB/T 7714--2005) `文献引用和书写标准，最重要的是：我们文献是自动排序的，而不是手动
- 优化了论文标题换行逻辑，而不是手动控制每一行的内容
- 支持使用`algorithm`算法环境
- 插入自己的研究成果就和引用参考文献一样简单，在研究成果环境中使用`\bibentry{key}`来插入你的论文信息
- 超链接高亮，便于检查文档和快速跳转，你可以通过`\SetLinkColor[#1]`关闭或者打开它，默认打开。
- 独立的图片、表格和算法清单，而不是混合清单
- 完整的使用说明文档，它应该能解决绝大多数问题



## 3. 我应该如何使用它

- 首先你的电脑必须为`Windows7`以上，其它平台暂时没有适配
- 安装了`TexLive2021`或其它版本，`CTex`无法编译
- 为了保证中文排版的正确性，编译引擎必须为`xelatex`，其它编译方式不一定能成功
- 编辑器可以任意选择，下面是推荐等级：
  - `VSCode`（强力推荐，这个项目已经帮你配置好了`latex`编译步骤，只需要每一次保存就会在后台自动编译）
  - `TexStudio`（专业的`latex`编辑器）
  - `TexWorks`（`TexLive`自带的编辑器）
  - `TexMaker`（使用范围较大的一个编辑器）
  - `notepad++`、`subline text3`等任意文本编辑器
  - `Overleaf`和`ShareLaTex`（在线编辑器，如果你比较懒不想安装的话，并且它们是免费的，尤其是`Overleaf`可以直接从`github`导入模板，但是编译时间不能超过$1$分钟，否则需要开会员......）
  - `Slager`（国产的在线编辑器，需要会员）
  - 禁止使用`WinEdit`，甚至这个编辑器都不支持`utf-8`编码......，强行用它打开大概率会损害文档
- 如果你没有安装`TexLive`，`LaTex`工作室的这个安装教程可以学习：https://www.bilibili.com/video/BV1tg4y1B7f3/?spm_id_from=333.999.0.0
- 更多的知识应该阅读`main.pdf`文档



## 4. 项目维护

- 这个项目将一直维护到作者不再需要发论文谋生为止
- 维护期间每年更新一次，你可以`fork`这个项目创建新的分支或者随时提交`issue`到该项目，一起来解决大家在使用过程中的新需求和`bug`
- 邮箱：itanggx@gmail.com



## 5. 版本信息

- $2022-09-30$：`version-1.0.0`
  - 创建模板

- $2022-11-28$：`version-1.0.1`
  - 使用`\toprule`和`\bottomrule`，`\midrule`以及`\cmidrule(lr)`来产生更美观的表格线以及断点

- **2022.04.30日**：`version-1.1.1`
  - 修改了若干`.cls`设置，这些改动内容为以下item
    - 现在英文标题可以根据长度自动变为两行或三行
    - 缩放了学校logo使其更美观
    - 将目录页添加至目录页
    - 算法，图片以及表格清单从文章末尾调整为放置在目录页后
    - 纠正了非正文页的页码格式bug
    - 允许使用转置表格`sidewaystable`环境
  - 稍微调整了`main.tex`的布局
