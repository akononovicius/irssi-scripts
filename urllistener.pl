##
## URLLISTENER plugin
##
## DESCRIPTION:
## This script sends listens for URLs appearing in public and
## private messages and automatically copies them into your
## clipboard.
## URLs are recognized by protocol (http and https are supported)
## as well as by "www." string.
##
## INSTALATION:
## 1.) Put this file into ~/.irssi/scripts
## 2.) run "/load perl" in irssi
## 3.) run "/script load urllistener" in irssi
##
## NOTE:
## Place this file into ~/.irssi/scripts/autorun (instead step 1)
## if you want it to be run each time irssi starts
##

use strict;
use Irssi;
use Irssi::Irc;

use vars qw($VERSION %IRSSI);

$VERSION = "180129";
%IRSSI = (
    authors     => "Aleksejus Kononovicius",
    contact     => "aleksejus.kononovicius\@gmail.com",
    name        => "urllistener",
    description => "puts urls into xclip",
    license     => "GPLv3",
);

sub onMessageUrl {
    my ($server, $data, $nick, $mask) = @_;
    my $d = $data;
    if (($d =~ /(https?\:\/\/.+)/) or ($d =~ /(www\..+)/)) {
        system("echo \"".$1."\" | xclip -selection clipboard");
    }
    return 1;
}

Irssi::signal_add('message public', 'onMessageUrl');
Irssi::signal_add('message private', 'onMessageUrl');

