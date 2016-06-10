#!/usr/bin/perl

use DBI;
use DBD::mysql;
use Data::Dumper;


my $usr = "karen";
my $pwd = "karen";

my @books;

sub insertHashBooks;
sub setBooksHash;
sub clean;

my $dbh = DBI->connect("dbi:mysql:oam",$usr,$pwd) or die "\nUnable to access mysql\n";
$dbh->{AutoCommit}=0;

my $titleQuery = $dbh->prepare("select count(*) from books where fname=?
 and lname=? and title=? " ) or die "\nTitleQuery failed " . DBI->errstr. "\n";
 $titleQuery->bind_param(1, $_[0]); 
 $titleQuery->bind_param(1, $_[1]); 
 $titleQuery->bind_param(1, $_[2]); 

my $insertBook =  $dbh->prepare('insert into books (fname, lname, title, series) values
  (?, ?, ?, ?) ')or die "\ninsertQuery failed " . DBI->errstr. "\n";
 $insertBook->bind_param(1, $_[0]);
 $insertBook->bind_param(1, $_[1]);
 $insertBook->bind_param(1, $_[2]);
 $insertBook->bind_param(1, $_[3]);


##################### Work ##################### 
setBooksHash;
insertHashBooks;

clean;

exit 0;
#################### Functions #################################

sub setBooksHash { 
 my $file="/home/karen/staging/perl/readXML.pl"; 
 -x $file or return 0;

 foreach my $line ( `$file books` ) {
   if ( ($line =~ /^Author Name: (.*)[\s\t]Title: (.*)[\s\t]Series: (.*)\n/ ) ) {
	my @a = split(/[\s]+/, $1);
	my %booksHash;
	if ( @a > 2 ) {
		$booksHash{'author_fname'} = $a[0];
		$booksHash{'author_fname'} .= " ";
		$booksHash{'author_fname'} .= $a[1];
		$booksHash{'author_lname'} = $a[-1];
	} else {
		$booksHash{'author_fname'} = $a[0];
		$booksHash{'author_lname'} = $a[1];
        }
	$booksHash{'title'} = $2;
	$booksHash{'series'} = $3;
	push(@books, \%booksHash);
   }

 }

} # end setBooksHash

sub insertHashBooks {
 foreach $row ( @books ) {
	$fn = $row->{'author_fname'};
	$ln = $row->{'author_lname'};
	$t = $row->{'title'};
	$s = $row->{'series'};

	$peh = $titleQuery->execute($fn, $ln, $t);
	$peh = $titleQuery->fetchrow();
	print "\nNumber of rows found is $peh\n";
	if ( $peh <= 0 ) { 
		$insertBook->execute($fn,$ln,$t,$s);
 	}
 }

} # insertHashBooks


sub clean {
 $dbh->commit(); 
 $titleQuery->finish;
 $insertBook->finish;
 $dbh->disconnect; 
}
