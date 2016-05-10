#!/usr/bin/perl

use DBI;
use DBD::mysql;

my $usr = "karen";
my $pwd = "karen";

my %booksHash;

sub setBooksHash;
sub clean;

##################### Work ##################### 
my $dbh = DBI->connect("dbi:mysql:oam",$usr,$pwd) or die "\nUnable to access mysql\n";
$dbh->{AutoCommit}=0;
setBooksHash;

clean;

exit 0;
#################### Functions #################################

sub setBooksHash { 
 my $file="/home/karen/staging/perl/readXML.pl"; 
 -x $file or return 0;
 
 foreach my $line ( `$file books` ) {
   if ( ($line =~ /^Author Name: (.*)[\s\t]Title: (.*)[\s\t]Series: (.*)\n/ ) ) {
	$booksHash{'author'} = $1;
	$booksHash{'title'} = $2;
	$booksHash{'series'} = $3;
	print "Author: $booksHash{'author'}\n";
	print "Title: $booksHash{'title'}\n";
	print "Series: $booksHash{'series'}\n";
   }



 }

} # end setBooksHash


sub clean { 
 $dbh->disconnect; 
}
