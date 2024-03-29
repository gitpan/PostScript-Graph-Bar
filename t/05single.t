#!/usr/bin/perl
use strict;
use warnings;
use Test;
BEGIN { plan tests => 5 };
use PostScript::File qw(check_file);
use PostScript::Graph::Style qw(defaults);
use PostScript::Graph::Bar;
ok(1);

my $bar = new PostScript::Graph::Bar(
	file  => {
	    landscape => 1,
	    debug => 2,
	    errors => 1,
	},
	layout => {
	    heavy_color => [0, 0, 0.7],
	    mid_color => [0, 0.5, 1],
	},
	style => {
	    bar => {
		color => [0.8, 0.4, 0],
	    },
	},
	x_axis => {
	    show_lines => 1,
	    offset => 1,
	},
);
ok($bar);

$bar->build_chart("t/single.csv");
ok(1);

my $name = "05single";
$bar->output( $name, "test-results" );
ok(1);
my $file = check_file( "$name.ps", "test-results" );
ok($file);
print STDERR "\nUse 'gv' or similar to visually check output file:\n";
print STDERR "$file\n";

