# MyVimConfig

这是个人使用的Vim配置文件，主要使用coc.nvim作为代码自动补全工具。

## Installation

1. 从 <https://github.com/vim/vim-win32-installer/releases> 下载gVim x64版本并安装;
2. 安装`universal-ctags`, `node.js`, `iverilog` 并配置环境变量;
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

## Usage

|模式|按键|功能|注释|
|:---:|:---:|:---:|:---:|
|noremal|\<F3>|打开/更新目录树|NERDTree插件功能|
|noremal|\<F4>|打开/关闭Verilog语法检查|ALE插件功能|
|noremal|\<F8>|打开显示代码结构|tagbar插件功能，需要使用universal-ctags|
|noremal/visual|ga[letter]|代码对齐基于[letter]对齐|此为EasyAlign插件功能，详情参考Github上的插件介绍|
|normal/visual/insert|\<F6>|自动生成verilog模块的例化代码|此为verilog-automatic插件功能，该插件详细使用方法自行查阅文档|
|insert|jj|等同于\<ESC>||

*上述说明并不完整，具体详见`.vimrc`注释内容*
