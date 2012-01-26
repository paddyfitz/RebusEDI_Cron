#!/usr/bin/perl

use strict;
use warnings;

my $edidir="$ENV{'PERL5LIB'}/misc/edi_files/";	# koha
#my $edidir="/tmp/";								# evergreen

my @logfiles=('$edidir/edi_ftp.log','$edidir/edi_quote_error.log');
my $rotate_size=10485760;	# 10MB

my ($sec,$min,$hour,$mday,$mon,$year) = localtime(time);
my $currdate=sprintf "%4d%02d%02d",$year+1900,$mon+1,$mday;

foreach my $file (@logfiles)
{
	my $current_size= -s $file;
	print "$current_size\n";
	if ($current_size>$rotate_size)
	{
		rename($file,$file.".".$currdate);
	}
}