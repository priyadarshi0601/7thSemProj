#!"C:\xampp\perl\bin\perl.exe"
print "Content-type: text/html\n\n";

use strict;
use warnings;
use DBI;
use JSON; #if not already installed, just run "cpan JSON"
use CGI;
use Data::Dumper;
use XML::Simple;

my $cgi = CGI->new;
my $port = 3377;
#print $cgi->header('application/json;charset=UTF-8');

my $id = $cgi->param('r');    
#convert  data to JSON
my $id1=decode_json($id);
$id= $id1->{monster}[0]->{design_id}[0];
print $id;
my $xml = XMLout($id1);
print $xml;
my $dbh = DBI->connect("DBI:mysql:mixer;localhost;port=$port", "root", "");
my $sth = $dbh->prepare("Select * from bodyparts where ID = '$id'");
my $rows = $sth->execute();
if ($rows >= 1)
{
	print "Oops! Design No Already Present! Provide a different design no";	
}
else
{
	$sth = $dbh->prepare("INSERT into bodyparts values('$id', '$xml')");
	$sth->execute(); 
	print "XML Data inserted successfully!";
}
$sth->finish();





