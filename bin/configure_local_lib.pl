#!perl

use 5.006;
use strict;
use warnings;

use File::Spec;

use lib File::Spec->catdir( $ENV{HOME}, 'perl5/lib/perl5/' );

my @vars = qw(PERL_MB_OPT PERL_MM_OPT PERL5LIB PATH PERL_LOCAL_LIB_ROOT);

my %old_ENV;
@old_ENV{@vars} = @ENV{@vars};

require local::lib;
local::lib->import;

for my $var (@vars) {
    next if !exists $ENV{$var};
    next if (exists $old_ENV{$var}) && ($old_ENV{$var} eq $ENV{$var});

    print "::set-env name=${var}::$ENV{$var}\n";
    print "Setting env variable ${var} = $ENV{$var}\n";
}

# vim: ts=4 sts=4 sw=4 et: syntax=perl
