
# Name:   AOC_2021_DAY8_PART1
# Author: Ort
# Date:   2021/12/08

use 5.028;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

@ARGV = "C:/Users/Ort/Desktop/input.txt" unless @ARGV;

sub shares ($f, $s) {
    grep {$s =~ /$_/} split // => $f;
}

my $part1 = 0;
while (<>) {
    chomp;
    my ($input, $output) = split /\s*\|\s*/;
    my @input  = map {join "" => sort split //} split ' ' => $input;
    my @output = map {join "" => sort split //} split ' ' => $output;

    my @bckt;
    foreach my $i (@input) {
        push @{$bckt [length $i]} => $i;
    }

    my @dig;

    $dig [1] = $bckt [2] [0];
    $dig [4] = $bckt [4] [0];
    $dig [7] = $bckt [3] [0];
    $dig [8] = $bckt [7] [0];

    foreach my $try (@{$bckt [6]}) {
        $dig [shares ($try, $dig [1]) == 1 ? 6
               : shares ($try, $dig [4]) == 3 ? 0
               :                                   9] = $try;
    }

    foreach my $try (@{$bckt [5]}) {
        $dig [shares ($try, $dig [1]) == 2 ? 3
               : shares ($try, $dig [9]) == 5 ? 5
               :                                   2] = $try;
    }

    my %display;
    $display {$dig [$_]} = $_ for keys @dig;

    $part1 += grep {$display {$_} == 1 ||
                     $display {$_} == 4 ||
                     $display {$_} == 7 ||
                     $display {$_} == 8}      @output;
}

say $part1;

__END__