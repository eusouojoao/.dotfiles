#yy~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~yy
 # GNU Make_________________________________________________________#
 #__________________________________________________________________#
 # Useful documentation:____________________________________________#
 # - https://www.gnu.org/software/make/manual/html_node/index.html__#
 # - https://clarkgrubb.com/makefile-style-guide____________________#
#yy~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~yy
MKDIR := mkdir -p
PACMAN := sudo pacman --noconfirm --needed -S
YAY := yay --noconfirm --needed -S
.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: ## Intended for a new, fresh, install. Installs and sets up everything
all: start newsetup allinstall update backup installdots

.PHONY: start
start:
	# Refreshes the mirrorlist
	sudo timedatectl set-ntp true
	sudo hwclock --systohc
	$(PACMAN) reflector
	sudo reflector -c Portugal,Germany,Spain,England -a 12 --sort rate --save /etc/pacman.d/mirrorlist
	sudo pacman -Syy

.PHONY: pacmancolors
pacmancolors: 
	# Make pacman and yay colorful and adds eye candy to the progress bar.
	sudo sed -i "s/^#Color/Color/" /etc/pacman.conf
	sudo sed -i "/^#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
	sudo sed -i "s/^#VerbosePkgLists/VerbosePkgLists/" /etc/pacman.conf

.PHONY: multilib
multilib:
	# Enable the multilib repository
	sudo sed -i "/^#\[multilib\]/a Include\ =\ \/etc\/pacman\.d\/mirrorlist" /etc/pacman.conf
	sudo sed -i "s/^#\[multilib\]/\[multilib\]/" /etc/pacman.conf

.PHONY: backup
backup: ## Backup arch linux packages
	$(MKDIR) $(PWD)/archlinux/
	pacman -Qnq > $(PWD)/archlinux/pacmanlist
	pacman -Qqem > $(PWD)/archlinux/aurlist

.PHONY: yay
yay:
	# Install the yay AUR helper
	$(PACMAN) git
	git clone https://aur.archlinux.org/yay.git
	pushd $(PWD)/yay/ ; \
	makepkg -si --noconfirm ; \
	popd ; \
	rm -rf $(PWD)/yay/

.PHONY: pac
pac: ## Install arch linux packages using pacman
	$(PACMAN) - < $(PWD)/archlinux/pacmanlist

.PHONY: aur
aur: ## Install arch linux AUR packages using yay
	$(YAY) - < $(PWD)/archlinux/aurlist

.PHONY: update
update: ## Update arch linux packages and save packages cache 3 generations
	yay -Syu ; paccache -ruk0

.PHONY: installdots
installdots: ## Symlink dotfiles
	chmod +x $(PWD)/install.sh
	$(PWD)/install.sh

.PHONY: removedots
removedots: ## Remove dotfiles' symlinks
	chmod +x $(PWD)/clean.sh
	$(PWD)/clean.sh

.PHONY: newsetup
newsetup:
	# Enables services, etc. Only useful on a fresh install
	chmod +x newsetup.sh
	$(PWD)/newsetup.sh

.PHONY: allinstall
allinstall: yay pacmancolors multilib pac aur
