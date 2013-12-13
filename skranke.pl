# Pinger
#
# What is this?
#
# Install this script on a machine, and it will notify you using the command
# say
# once someone writes a given keyword.
# 
#
# Usage   
#
# Anyone in the same channel as the one who runs this script may
# write "skranke: something" without quotes. The machine running
# this script will then run "say something" in the terminal.
#
# Write "skranke version" without quotes to tell what version it is.
#
# skranke can be replaced with any other word, by changing $KEYWORD
#

use strict;
use vars qw($VERSION %IRSSI $KEYWORD);

use Irssi qw(command_bind signal_add);
use IO::File;
$VERSION = '0.1';
$KEYWORD = 'skranke';

%IRSSI = (
    authors     => 'Tomas Fagerbekk',
    contact     => 'tomas@webutvikling.org',
    name        => 'Pinger',
    description => 'Get your PC to tell you something happened',
    license     => 'GPL',
);

sub own_question {
    my ($server, $msg, $target) = @_;
    question($server, $msg, "", $target);
}

sub public_question {
    my ($server, $msg, $nick, $address, $target) = @_;
    question($server, $msg, $nick.": ", $target);
}

sub question($server, $msg, $nick, $target) {
    my ($server, $msg, $nick, $target) = @_;
    $_ = $msg;
    if (!/^skranke/i) { return 0; }

    if (/^skranke:/i) {
        my $answer = "I pinged skranke";
        $server->command('msg '.$target.' '.$nick.': '.$answer);
        system("say I R C");
        return 0;
    } elsif (/^skranke version$/i){
        $server->command('msg '.$target.' My version is: '.$VERSION);
        return 0;
    } 
    }

signal_add("message public", "public_question");
signal_add("message own_public", "own_question");
