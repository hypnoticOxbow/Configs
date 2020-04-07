set -euxo pipefail
cp ~/.xmonad/xmonad.hs ./
cp ~/.xmobarrc ./
cp ~/.gnupg/gpg-agent.conf ./
cp ~/.config/nvim/init.vim ./.vimrc
cp ~/.config/dunst/dunstrc ./
cp ~/.bashrc ./
cp ~/.zshrc ./
cp -r ~/.doom.d/ ./
cp ~/.Xresources ./
cp ~/.gitconfig ./
cp ~/.compton.conf ./
git add .
git commit -m "Config Backup $(date +%F-%H-%M)"
git push
