# $Id$
package Apache::iTunes;
use strict;

use Apache::Constants qw(:common);
use Mac::iTunes;
use Text::Template;

=head1 NAME

Apache::iTunes - control iTunes from mod_perl

=head1 SYNOPSIS

=head1 DESCRIPTION

This is only a proof-of-concept module.

=head1 AUTHOR

brian d foy, E<lt>bdfoy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2002 brian d foy, All rights reserved

=cut

my $Template_file = $ENV{APACHE_ITUNES_HTML};
my $Template      = do { local @ARGV = ($Template_file); local $/; <> };
my $Playlist      = 'Library';
my $Controller    = Mac::iTunes->new()->controller;

sub handler
	{
	my $r = shift;
	
=pod

	my $command      = param('command');
	my $playlist     = param('playlist') || 'Library';
	my $set_playlist = param('set_playlist');
	
	if( $command )
		{
		my %Commands = map { $_, 1 } qw( play stop pause back_track);
		$controller->$command if exists $Commands{$command};
		}
	elsif( $set_playlist )
		{
		$controller->_set_playlist( $set_playlist );
		$playlist = $set_playlist;
		}
=cut
		
	my %var;
		
	$var{base}      = $ENV{APACHE_ITUNES_URL};
	$var{state}     = $Controller->player_state;
	$var{current}   = $Controller->current_track_name;
	$var{playlist}  = $Playlist;
	$var{playlists} = $Controller->get_playlists;
	$var{tracks}    = $Controller->get_track_names_in_playlist( $Playlist );
	
	my $html = Text::Template::fill_in_string( $Template, HASH => \%var );
	
	$r->content_type( 'text/html' );
	$r->send_http_header;
	$r->print( $html );
	return OK;
	}
	
"See why 1984 won't be like 1984";
