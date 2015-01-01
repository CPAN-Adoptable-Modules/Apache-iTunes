# $Id$
use ExtUtils::MakeMaker;

require 5.006;

	
WriteMakefile(
	'NAME'		    => 'Apache::iTunes',
	'ABSTRACT'      => 'control iTunes from mod_perl',

	'VERSION'       => '0.11',
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	
    'PM'            => {
		'lib/iTunes.pm'       => '$(INST_LIBDIR)/iTunes.pm',
		},

	'PREREQ_PM' => {
		'Apache::Constants'   => '0',
		'Apache::FakeRequest' => '0',
		'Apache::Util'        => '0',
		'Mac::iTunes'         => '0',
		'Test::More'          => '0',
		'Text::Template'      => '0',
		},

	'MAN3PODS'  => {
		'lib/iTunes.pm' => '$(INST_MAN3DIR)/Apache::iTunes.3',
		},

	clean => { FILES => '*.bak Apache-*' },

	);
