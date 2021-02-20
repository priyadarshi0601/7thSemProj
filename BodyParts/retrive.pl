#!"C:\xampp\perl\bin\perl.exe"
print "Content-type: text/html\n\n";

use strict;
use warnings;
use DBI;
use JSON; #if not already installed, just run "cpan JSON"
use CGI;
use Data::Dumper;
use XML::Simple;
my $port = 3377;
#print $cgi->header('application/json;charset=UTF-8');
my $q = new CGI;
my $id = $q->param('r');
my $dbh = DBI->connect("DBI:mysql:monster;localhost;port=$port", "root", "");
my $sth = $dbh->prepare("Select * from parts where ID = '$id'");
my $rows = $sth->execute();
if ($rows >= 1)
{
    my @row;
    while (@row = $sth->fetchrow_array) {  # retrieve one row
        print join(", ", @row), "\n";
}	
}
else
{
	print "Invalid Designname";
}
$sth->finish();