# Irssi scripts

In this repository I will store irssi scripts I have coded (or modified) to
suit my needs while using irssi.

## Instalation

All plugins are installed in the same manner:
1. Copy the file to ~/.irssi/scripts or ~/.irssi/scripts/autorun
1. If not placed into autorun folder, then you need to run plugins manualy:
    * irssi: `/load perl`
    * irssi: `/script load <filename>`

## Notify script

This script sends notifications via libnotify on each public (channel) or
private message. Also it notifies about users joining, parting the channels you
are currently as well as quiting IRC.

## UrlListener script

This script sends listens for URLs appearing in public and private messages and
automatically copies them into your clipboard. URLs are recognized by protocol
(http and https are supported) as well as by "www." string.
