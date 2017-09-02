#Custom System builds

PWD = $(shell pwd)

#Desktop
mars: general
	ln $(PWD)/config/i3/mars/i3-config ~/.config/i3/config
	
#Laptop
ceres: general
	ln $(PWD)/config/i3/ceres/i3-config ~/.config/i3/config

general: update clean
	ln $(PWD)/config/Xresources ~/.Xresources
	ln $(PWD)/config/vimrc ~/.vimrc
	ln $(PWD)/config/zshrc ~/.zshrc
	ln $(PWD)/config/bashrc ~/.bashrc
	ln $(PWD)/config/dunstrc ~/.dunstrc
	mkdir -p ~/.config/i3

clean:
	rm -f ~/.Xresources	
	rm -f ~/.vimrc
	rm -f ~/.zshrc
	rm -f ~/.bashrc
	rm -f ~/.config/i3/config	
	rm -f ~/.config/i3blocks.conf
	rm -f ~/.dunstrc


update:
	git pull
