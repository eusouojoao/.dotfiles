MKDIR=mkdir -p
PACMAN=sudo pacman --no-confirm --needed -S
YAY=yay --no-confirm --needed -S

.DEFAULT_GOAL := help
.PHONY: all allinstall install aur yay installdots update backup help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: ## Install the AUR helper, all packages and dotfiles
all: allinstall update backup installdots

pacmancolors: 
	# Make pacman and yay colorful and adds eye candy on the progress bar.
	sudo sed -i "s/^#Color/Color/" /etc/pacman.conf
	sudo sed -i "/^#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
	sudo sed -i "s/^#VerbosePkgLists/VerbosePkgLists/" /etc/pacman.conf

multilib:
	# Enable the multilib repository
	sudo sed -i "/^#\[multilib\]/a Include\ =\ \/etc\/pacman\.d\/mirrorlist" /etc/pacman.conf
	sudo sed -i "s/^#\[multilib\]/\[multilib\]/" /etc/pacman.conf

backup: ## Backup arch linux packages
	$(MKDIR) ${PWD}/archlinux
	pacman -Qnq > ${PWD}/archlinux/pacmanlist
	pacman -Qqem > ${PWD}/archlinux/aurlist

yay:
	# Install the yay AUR helper
	$(PACMAN) git
	git clone https://aur.archlinux.org/yay.git
	pushd yay
	makepkg -si --noconfirm
	popd
	rm -rf yay

install: ## Install arch linux packages using pacman
	$(PACMAN) - < $(PWD)/archlinux/pacmanlist

aur: ## Install arch linux AUR packages using yay
	$(YAY) - < $(PWD)/archlinux/aurlist

update: ## Update arch linux packages and save packages cache 3 generations
	yay -Syu ; paccache -ruk0

installdots: ## Symlink dotfiles
	chmod +x $(PWD)/install.sh $(PWD)/clean.sh
	$(PWD)/clean.sh
	$(PWD)/install.sh

allinstall: yay pacmancolors multilib install aur
