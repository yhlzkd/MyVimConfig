# MyVimConfig

这是个人使用的Vim配置文件，主要是为了写Verilog的配置。

## 安装

1. 从 <https://github.com/vim/vim-win32-installer/releases> 下载gVim x64版本并安装;
2. 安装[universal-ctags](https://github.com/universal-ctags/ctags-win32/releases),
[node.js](https://nodejs.org/en/), [iverilog](http://iverilog.icarus.com/), [git](https://git-scm.com/),
并配置环境变量(手动安装比较麻烦，推荐使用[scoop](https://github.com/ScoopInstaller/Scoop)命令行安装比较方便);
3. 将`.vimrc`文件放到`$HOME`目录;
4. 将`vimfiles`文件夹放到`$HOME`目录;
5. 安装`python3`, 并更改`.vimrc`文件中对于python3.dll为python3.dll所在的位置;

    ```vim
    set pythonthreedll=$HOME/AppData/Local/Programs/Python/Python310/python310.dll
    ```

6. 使用`npm`安装`svlangserver`;

    ```cmd
    npm install -g @imc-trading/svlangserver
    ```

7. 打开vim以后输入`:PlugInstall`, 等待插件安装完成。

## 快捷键

**`<leader> : <space>`**

### [LeaderF](https://github.com/Yggdroot/LeaderF) 相关快捷键

按键|功能|注释|
|:---:|:---:|:---:|
|`<leader>lff`|搜索File|同`:LeaderfFile`|
|`<leader>lfb`|搜索Buffer|同`:LeaderfBuffer`|
|`<leader>lft`|搜索Tag|同`:LeaderfTag`|
|`<leader>lfl`|搜索Line|同`:LeaderfLine`|
|`<leader>lfF`|搜索Function|同`:LeaderfFunction`|

### 其他快捷键

|模式|按键|功能|注释|
|:---:|:---:|:---:|:---:|
|normal/visual/insert|`<F3>`|打开/关闭目录树|[NERDTree](https://github.com/preservim/nerdtree)插件功能|
|normal/visual/insert|`<F4>`|打开/关闭Verilog语法检查|[ale](https://github.com/dense-analysis/ale)插件功能|
|normal/visual/insert|`<F5>`|在打开.md文件时该快捷键为markdown预览|此为[markdown-preview.vim](https://github.com/iamcco/markdown-preview.nvim)插件功能|
|normal/visual/insert|`<F6>`|自动生成verilog模块的例化代码|此为[automatic-verilog](https://github.com/HonkW93/automatic-verilog)插件功能，该插件详细使用方法自行查阅文档|
|normal/visual/insert|`<F8>`|打开显示代码结构|tagbar插件功能，需要使用[universal-ctags](https://github.com/universal-ctags/ctags-win32/releases)|
|normal/visual|`ga[letter]`|代码对齐基于[letter]对齐|此为[vim-easy-align](https://github.com/junegunn/vim-easy-align)插件功能，详情参考Github上的插件介绍|
|normal/visual/insert|`<f9>`|打开/关闭缩进显示|此为[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)功能，可以显示文件中的缩进情况|
|insert|`jj`|等同于`<ESC>`|若不习惯这种用法可以在.vimrc文件中取消或修改映射|
|normal/visual|`<leader>utt`|打开文件修改历史树|此为[undotree](https://github.com/mbbill/undotree)插件功能|
|normal/visual|`<leader>sc`|打开/关闭拼写检查||
|normal/visual|`<leader>st`|打开拼写修改联想||
|normal/visual|`<leader>rc`|打开`.vimrc`配置文件||
|normal/visual|`<up><down><left><right>`|调整窗口大小|若不习惯使用`jkhl`移动光标可在`.vimrc`文件中更改或取消按键映射|

## 自动补全

自动补全功能依赖[coc.nvim](https://github.com/neoclide/coc.nvim),使用`tab`向下选择快速补全项，`enter`触发，支持的语言以及配置方法参阅<https://github.com/neoclide/coc.nvim/wiki/Language-servers>

*上述说明并不完整，具体详见`.vimrc`注释内容*
> 插件功能说明使用 `:help [插件命令]`查看  
