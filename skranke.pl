# Pinger
#
#
# What is this?
#
# Install this script to your irssi, and it will notify you using the command
# beep once someone writes a given keyword.
#
# 'beep' can trigger a computer sound by installing package beep
# or be alias'ed to any command you want to be performed when that keyword
# occurs in the chat.
# 
#
# Usage   
#
# Anyone in the same channel as the one who runs this script may
# write "skranke: something" without quotes. The machine running
# the script will then run 'beep'
#
# Write "skranke version" without quotes to tell what version it is.
#
# skranke can be replaced with any other word, by changing $KEYWORD
#

use strict;
use vars qw($VERSION %IRSSI $KEYWORD);

use Irssi qw(command_bind signal_add);
$VERSION = '0.1';
$KEYWORD = 'skranke';

%IRSSI = (
    authors     => 'Tomas Fagerbekk',
    contact     => 'tomas@webutvikling.org',
    name        => 'Ping',
    description => 'Get your irssi to tell you when someone wants hold of you',
    license     => 'MIT',
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
    if (!/^$KEYWORD/i) { return 0; }

    if (/^$KEYWORD::/i) {
        my $answer = "I pinged ".$KEYWORD;
        $server->command('msg '.$target.' '.$nick.': '.$answer);
        system("beep");
        return 0;
    } elsif (/^$KEYWORD version$/i){
        $server->command('msg '.$target.' My version is: '.$VERSION);
        return 0;
    } 
    }

signal_add("message public", "public_question");
signal_add("message own_public", "own_question");
