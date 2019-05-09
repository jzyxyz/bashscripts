cd ~/.config/
cp ~/.bashrc .
cp /etc/gnome/defaults.list .
cp -r ~/.fonts .
cp -r ~/system_install.sh .
git add -u 
git commit -m "update"
git push