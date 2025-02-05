# -*- makefile-gmake -*-

CONFIG_PATH = ~/.config
HOST = $(shell uname -n | cut -d. -f1)

LINUX_PACKAGES = herbstluftwm fish openssh gnupg
MACOS_PACKAGES = fish iterm pinentry-mac

LINUX_RULES = herbstluftwm fish openssh gnupg x11
MACOS_RULES = fish iterm openssh gnupg


# mother of all rules
all: $(HOST)


# host rules
sequent: linux dunst firehol fstab

kleisli: 

substructural: macos

subtype: linux


# os rules
linux: $(LINUX_RULES)

macos: $(MACOS_RULES)


# app/config rules
herbstluftwm::
	install -D -m 555 $@/autostart $(CONFIG_PATH)/$@/autostart
	install -D -m 555 $@/general_as $(CONFIG_PATH)/$@/general_as
	install -D -m 555 $@/$(HOST)_as $(CONFIG_PATH)/$@/$(HOST)_as
	install -D -m 444 $@/bg.png $(CONFIG_PATH)/bg.png
.PHONY: herbstluftwm

fish::
	install -D -m 444 $@/config.fish $(CONFIG_PATH)/$@/config.fish
	install -D -m 444 $@/general.fish $(CONFIG_PATH)/$@/general.fish
	install -D -m 444 $@/$(HOST).fish $(CONFIG_PATH)/$@/$(HOST).fish
.PHONY: fish

dunst::
	install -D -m 444 $@/dunstrc $(CONFIG_PATH)/$@/dunstrc
.PHONY: dunst

iterm::
	install -m 644 $@/hushlogin ~/.hushlogin
.PHONY: iterm

x11::
	install -m 555 $@/$(HOST)_xinitrc ~/.xinitrc
.PHONY: x11

openssh:
	install -m 444 $@/$(HOST)_ssh_config ~/.ssh/config
.PHONY: openssh

gnupg:
	install -m 444 $@/$(HOST)_gpg_agent_conf ~/.$@/gpg-agent.conf
.PHONY: gnupg

firehol:
	gpg -d $@/$@_conf.gpg | sudo install -m 444 /dev/stdin /etc/$@/$@.conf
.PHONY: firehol

fstab:
	sudo install -m 644 $@/$(HOST)_fstab /etc/fstab
.PHONY: fstab


# package manager rules
pacman::
	sudo pacman -S $(LINUX_PACKAGES)
.PHONY: pacman

brew::
	brew install $(MACOS_PACKAGES)
.PHONY: brew

