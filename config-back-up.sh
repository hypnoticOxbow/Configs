set -euxo pipefail
cp ~/.xmonad/xmonad.hs ./
cp ~/.config/nvim/init.vim ./.vimrc
cp ~/.bashrc ./
cp ~/.zshrc ./
cp ~/.Xresources ./
cp ~/.gitconfig ./
cp ~/.compton.conf ./
git add .
git commit -m "Config Backup $(date +%F-%H-%M)"
git push
