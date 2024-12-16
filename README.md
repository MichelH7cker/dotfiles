# dotfiles
my personal dotfiles currently running in Fedora 39.

## Dependecies
- stow

## How to use it 
To use a dotfile from an specific program just run on the root dir:
```bash
stow <program-dir>
```

### Nvim 
For you have to do  
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

After that go to `packer.lua` and do a `:so` following by `:PackerSync`.

## Demonstration
![small-monitor](images/small-monitor.png)
![big-monitor](images/big-monitor.png)
![dual-monitor](images/dual-monitor.png)
![latex](images/latex.png)
