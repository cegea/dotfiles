echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip"
echo "creating fonts folder: ${HOME}/.fonts"
mkdir -p  "$HOME/.fonts"
unzip "Hack.zip" -d "$HOME/.fonts/Hack/"
fc-cache -fv
rm "Hack.zip"
echo "done!"     
