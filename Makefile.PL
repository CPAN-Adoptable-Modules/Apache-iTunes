# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";
	
WriteMakefile(
	'NAME'		    => 'Apache::iTunes',
	'VERSION'       => '0.09',
	'LICENSE'       => 'perl',
	
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
