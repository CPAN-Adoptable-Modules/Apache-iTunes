# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	*ExtUtils::MM_Any::test_via_harness = sub
		{
		my($self, $perl, $tests) = @_;
	
		return qq|\t$perl "-MTest::Manifest" | .
			qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
			qq|'\$(INST_ARCHLIB)')"\n|;
		}
	}
	
WriteMakefile(
	'NAME'		    => 'Apache::iTunes',
	'VERSION'       => '0.07',
	
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
