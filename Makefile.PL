# $Id$
use ExtUtils::MakeMaker;

my $tests = do {
	local @ARGV = qw(t/test_manifest);
	my $data = join " ", map {chomp; "t/$_" } <>;
	};
	
WriteMakefile(
    'NAME'		    => 'Apache::iTunes',
	'VERSION'       => '0.06',
	
    'PM'            => {
     	'lib/iTunes.pm'       => '$(INST_LIBDIR)/iTunes.pm',
     	},

	'PREREQ_PM' => {
		'Apache::Constants'   => '0',
		'Apache::FakeRequest' => '0',
		'Apache::Util'        => '0',
		'File::Find::Rule'    => '0',
		'Mac::AppleScript'    => '0',
		'Mac::iTunes'         => '0',
		'Test::More'          => '0',
		'Test::Pod'           => '0',
		'Test::Prereq'        => '0.05',
		'Test::Data'          => '0',
		'Text::Template'      => '0',
		},
		    	
    test   => { TESTS      => $tests },
    depend => { 'Makefile' => 't/test_manifest' },
	);
