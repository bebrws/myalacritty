# Super helpful zsh / bash functions I wrote
```
    ######### ALACRITTY GOOODNESS ############
    alias -g alacrittycolors='python3 /Users/bbarrows/Library/Python/3.8//lib/python/site-packages/alacritty_colorscheme/cli.py '

    function alaFontSize() {
        cat ~/.config/alacritty/alacritty.yml | jsin --yaml --yamlout --whole "(l.font.size=Number(\"$1\")) && l; " > $HOME/.config/alacritty/alacritty.yml.tmp
        mv $HOME/.config/alacritty/alacritty.yml.tmp $HOME/.config/alacritty/alacritty.yml
    }

    function alaOpacity() {
        cat ~/.config/alacritty/alacritty.yml | jsin --yaml --yamlout --whole "(l.background_opacity=Number(\"$1\")) && l; " > $HOME/.config/alacritty/alacritty.yml.tmp
        mv $HOME/.config/alacritty/alacritty.yml.tmp $HOME/.config/alacritty/alacritty.yml
    }

    function alaColorTheme() {
    alacrittycolors -a ~/.config/alacritty/colors/$(ls  ~/.config/alacritty/colors/ | fzf --preview "python3 /Users/bbarrows/Library/Python/3.8//lib/python/site-packages/alacritty_colorscheme/cli.py -a ~/.config/alacritty/colors/{} && htop")
    }

    function alaResetDark()  {
    cp ~/.config/alacritty/alacritty.yml.dark ~/.config/alacritty/alacritty.yml
    }

    function alaResetLessDark()  {
    cp ~/.config/alacritty/alacritty.yml.lessdark ~/.config/alacritty/alacritty.yml
    }

    function alaResetLight()  {
    cp ~/.config/alacritty/alacritty.yml.light  ~/.config/alacritty/alacritty.yml
    }
```

### Note:

These bash functions rely on my jsin command line project, checkout [jsin](https://github.com/bebrws/jsin)


# Random

pip3 install alacritty-colorscheme

python3 /Users/bbarrows/Library/Python/3.8//lib/python/site-packages/alacritty_colorscheme/cli.py -a base16-nord.yml


alias -g alacrittycolors='python3 /Users/bbarrows/Library/Python/3.8//lib/python/site-packages/alacritty_colorscheme/cli.py '





