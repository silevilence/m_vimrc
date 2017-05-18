# m_vimrc #

Personal vimrc backup

This is just a backup.

# Plugins #

## Plugin Manager ##

[pathogen](https://github.com/tpope/vim-pathogen)

## Plugins List ##

**Update Time:** 2017-05-18

*note:* Sort by name in initial commit,
maybe sort by name after(may forget to sort after add a plugin).

\+ means the plugin are modified manually.

\* means the plugin are not installed by git.

\! means the plugin need to read 'how to install' first.

* [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)
* \*[authorinfo](https://github.com/dantezhu/authorinfo)
* [bufferhint](https://github.com/bsdelf/bufferhint)
* [calendar.vim](https://github.com/itchyny/calendar.vim)
* [clang-complete](https://github.com/Rip-Rip/clang_complete)
* \*[csExplorer](https://github.com/scwbin/csExplorer)
* [csv.vim](https://github.com/chrisbra/csv.vim)
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [dict.vim](https://github.com/iamcco/dict.vim)
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
* [FastFold](https://github.com/Konfekt/FastFold)
* \![jshint.vim](https://github.com/walm/jshint.vim)
* [lua.vim](https://github.com/vim-scripts/lua.vim)
* \![lushtags](https://github.com/bitc/lushtags)
* \![neco-ghc](https://github.com/eagletmt/neco-ghc)
* \![neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* \!\+[omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim)
* [pydiction](https://github.com/rkulla/pydiction)
* \![rainbow](https://github.com/luochen1990/rainbow)
* [sessionman.vim](https://github.com/vim-scripts/sessionman.vim)
* [ShaderHightLight](http://git.oschina.net/qiuchangjie/ShaderHighLight)
* \*[sw-samuraj-vim-gradle](https://bitbucket.org/sw-samuraj/vim-gradle)
* [syntastic](https://github.com/vim-syntastic/syntastic)
* [tabular](https://github.com/godlygeek/tabular)
* [tagbar](https://github.com/majutsushi/tagbar)
* ~~[TaskList](https://github.com/vim-scripts/TaskList.vim)~~
* [ultisnips](https://github.com/SirVer/ultisnips)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-csharp](https://github.com/OrangeT/vim-csharp)
* ~~[vim-dispatch](https://github.com/tpope/vim-dispatch)~~
* [vim-easygrep](https://github.com/dkprice/vim-easygrep)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* ~~[vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)~~
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* \+[vim-latex](https://github.com/vim-latex/vim-latex)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [vim-misc](https://github.com/xolox/vim-misc)
* [vim-nodejs-complete](https://github.com/myhere/vim-nodejs-complete)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-rooter](https://github.com/airblade/vim-rooter)
* [vim-snippets](https://github.com/honza/vim-snippets)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vimwiki](https://github.com/vimwiki/vimwiki)
* [wmgraphviz.vim](https://github.com/wannesm/wmgraphviz.vim)
* [xmledit](https://github.com/sukima/xmledit)

## Attention ##

### [sw-samuraj-vim-gradle](https://bitbucket.org/sw-samuraj/vim-gradle) ###

Have to clone with hg.
I don't have this so just download the code pack.

### [wmgraphviz.vim](https://github.com/wannesm/wmgraphviz.vim) ###

Commands can't run in windows because of tee and a bug of shellescape.
With some changes I do it now can used normally under windows.
I commit pull request to [wannesm](https://github.com/wannesm) and he just merged it into repo,
so actually there is no edit in the plugin.

### [vim-latex](https://github.com/vim-latex/vim-latex) ###

All changes have been moved to vimrc file.
So no change in code,
just some templates I used.

### [vim-fugitive](https://github.com/tpope/vim-fugitive) ###

With unknown reason it can't works.
for example,
if use Gstatus,
sometimes E484(can't open file),
sometimes a empty file(.git/index err).
Seems all plugin use Temp file([vim-javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)) has this bug,
maybe some errors in vim itself.

### [clang-complete](https://github.com/Rip-Rip/clang_complete) ###

Need to install clang fisrt and set a var to clang lib path.
Not test because didn't write cpp for a long time.

### [omnisharp-vim](https://github.com/OmniSharp/omnisharp-vim) ###

As I use AsyncRun instead of vim-dispatch, add some lines to 'autoload/OmniSharp.vim' to support start server function.
It run async command with vim-dispatch by checking 'Dispatch' command but call dispatch#start() directly,
this just lead to that I can't just add a new command 'Dispatch' linked to AsyncRun to solve the problem.

Add these codes after line 551, in function 'OmniSharp#RunAsyncCommand'.

```vim
  elseif exists(':AsyncRun') == 2
      exec 'noautocmd AsyncRun ' . a:command
```
