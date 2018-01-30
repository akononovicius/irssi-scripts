##
## NOTIFY plugin
##
## DESCRIPTION:
## This script sends notifications via libnotify on each public
## (channel) or private message. Also it notifies about users
## joining, parting the channels you are currently as well as
## quiting IRC.
##
## INSTALATION:
## 1.) Put this file into ~/.irssi/scripts
## 2.) run "/load perl" in irssi
## 3.) run "/script load notify" in irssi
##
## NOTE:
## Place this file into ~/.irssi/scripts/autorun (instead step 1)
## if you want it to be run each time irssi starts
##

use strict;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "180129";
%IRSSI = (
    authors     => 'Aleksejus Kononovicius',
    contact     => 'aleksejus.kononovicius@gmail.com',
    name        => 'notify',
    description => 'Use libnotify to alert about relevant events',
    license     => 'GPLv3',
);

sub sendNotify {
    my ($server, $summary, $message) = @_;
    system("notify-send -- \"".$summary."\" \"".$message."\"");
}
 
sub onMessageNotify {
    my ($server, $msg, $nick, $address) = @_;
    return if (!$server);
    sendNotify($server, "irssi", "&lt;".$nick."&gt; ".$msg);
}

sub onJoinNotify {
    my ($server, $channel, $nick, $address) = @_;
    return if (!$server);
    sendNotify($server, "irssi", $nick." has joined ".$channel);
}

sub onPartNotify {
    my ($server, $channel, $nick, $address, $reason) = @_;
    return if (!$server);
    sendNotify($server, "irssi", $nick." has parted ".$channel);
}

sub onQuitNotify {
    my ($server, $nick, $address, $reason) = @_;
    return if (!$server);
    sendNotify($server, "irssi", $nick." has quit");
}

Irssi::signal_add('message private', 'onMessageNotify');
Irssi::signal_add('message public', 'onMessageNotify');
Irssi::signal_add('message join', 'onJoinNotify');
Irssi::signal_add('message part', 'onPartNotify');
Irssi::signal_add('message quit', 'onQuitNotify');

