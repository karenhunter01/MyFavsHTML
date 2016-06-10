#!/usr/bin/perl

use Getopt::Long;
use Data::Dumper;
use XML::Parser;
use XML::DOM;


sub initialize;
sub readBooks;
sub writeMusic($);
sub usage;

my $doc;
my $xmldir = "/home/karen/staging/xml_config";
my %xmlFile = (
  books => "$xmldir/books.xml",
  music => "$xmldir/music.xml"
);

my %xmlFormat = ( 
	books => {
		my_favorite_books => {
			 books => {
				book=> ["author_first_name", "author_last_name", "title", "series"],				
			},
		},
	},

	music => {
                my_favorite_music => {
                         pod => {
                                song => ["name", "artists", "album"],
                        },
                },
        },

 );
#### End Declarations ############################## 
if ( ($#ARGV + 1) == 0  ||  not defined $xmlFile{$ARGV[0]} ) {
  print "\nError";
  usage;
  exit 1;
}

if  ( !	-r $xmlFile{$ARGV[0]} ) {
  print "\nCreating $xmlFile{$ARGV[0]}\n";
  
  if ( $ARGV[0] eq "music" ) {
   writeMusic( \$xmlFormat{music} ) ;
  }

} else {
	$doc = initialize;
	readBooks if ( $ARGV[0] eq "books" ); 
}

exit 0;
### End Validations ##################################
######################################################
sub usage {
  print "\nUsage: $0 <Valid XML key>\nExamples: ";
  foreach $b (keys %xmlFile) {
	print "\n\t$0 $b";
  }
  print "\n";
}

sub initialize {
 my $parsexml = new XML::Parser(ErrorContext => 3);
 eval { $parsexml->parsefile($xmlFile{$ARGV[0]}) };
 if ( $@ ) {
   (undef, $myerror) = split(/at /, $@);
   print "\nFatal error with $xmlFile{$ARGV[0]} \n$myerror\n";
   exit 3;
 } 

 $parsexml = new XML::DOM::Parser; 
 return $parsexml->parsefile($xmlFile{$ARGV[0]});
} # end initialize

sub readBooks {
 my $booksNodeList = $doc->getElementsByTagName("books");

 for ( my $i = 0; $i < $booksNodeList->getLength; $i++ ) {
	my $node = $booksNodeList->item($i);
	foreach my $book ( $node->getElementsByTagName("book") ) {
		print "Author Name: ";
		print $book->getElementsByTagName("author_first_name")->item(0)->getFirstChild->getNodeValue, " ";
		print $book->getElementsByTagName("author_last_name")->item(0)->getFirstChild->getNodeValue, "\t";

		if ( defined $book->getElementsByTagName("title")->item(0)->getFirstChild ) {
		 print "Title: ";
		 print $book->getElementsByTagName("title")->item(0)->getFirstChild->getNodeValue, "\t";
		}

		if ( defined $book->getElementsByTagName("series")->item(0)->getFirstChild ) {
		 print "Series: ";
		 print $book->getElementsByTagName("series")->item(0)->getFirstChild->getNodeValue, " ";
		}

		print "\n";
    	} ## for each book

 } # end for booksNodeList

 $doc->dispose if $doc;
} # end readBoks


sub writeMusic($) { 
 #my $doc = new XML::DOM::Document;
 my $something = shift;
print $something, "\n";

 if ( ref($something) eq "HASH" ) { 
   my $k = keys(%{$something});
   print  $k, "\n"; 
   writeMusic( %{$something{$k}});
 }
 elsif ( ref($something) eq "ARRAY" ) {
	print @{$something}, "\n";
 } 
		
} # end writeMusic


