cp tmux.conf ~/.tmux.conf
mkdir -p ~/.config/alacritty/
cp * ~/.config/alacritty/


echo """
add

@bebrws:registry=https://npm.pkg.github.com/

to ur .npmrc file and install

npm install -g --save   @bebrws/jsin  

or git clone and install glboally:

http://github.com/bebrws/jsin

OR

wget https://bradbarrows.com/dls/jsin.zip
unzip jsin.zip
mv jsin /usr/local/bin/jsin
"""



echo """

Add these bash or zsh functions


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

function alaResetLight()  {
  cp ~/.config/alacritty/alacritty.yml.light  ~/.config/alacritty/alacritty.yml
}




"""