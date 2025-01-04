#! /usr/bin/env perl

use strict;
use warnings;

#use Encode::Detect::Detector;
use File::Slurp;
use utf8;
use YAML::Safe;
#use YAML;

use feature 'say';

sub book_list {
    my ($book_order_file, @sec_list) = @_;
    my @out = ();

    my $book_order = YAML::Safe::LoadFile($book_order_file);
    for my $sec (@sec_list) {
        for my $id (@{$book_order->{$sec}}) {
            push(@out, $id);
        }
    }

    @out;
}

sub color {
    my ($color, $text) = @_;

    if ($::args->{hilite} eq 'ansi-colors') {
        return("ANSI: $text");
    } elsif ($::args->{hilite} eq 'ansi-colors') {
        return("ENSCRIPT $text");
    }
}

sub color_code {
    my ($color) = @_;

    my %ansi = (
        red          => "\e[0;31m",
        green        => "\e[0;32m",
        yellow       => "\e[0;33m",
        blue         => "\e[0;34m",
        bright_red   => "\e[1;31m",
        bright_green => "\e[1;32m",
        on_red       => "\e[1;41m",
        on_green     => "\e[1;42m",
        on_yellow    => "\e[1;43m",
        reset        => "\e[0m",
    );

    my %enscript = (
        red          => '~color{1 0.5 0.5}',
        green        => "~color{0.5 1 0.5}",
        on_red       => '~bgcolor{1 0.5 0.5}',
        on_green     => "~bgcolor{0.5 1 0.5}",
        on_yellow    => "~bgcolor{1 1 0.5}",
        reset        => "~bgcolor{1 1 1}~color{0 0 0}",
    );

    $ansi{header}     = $ansi{yellow};
    $enscript{header} = $enscript{on_yellow};

    if ($::args->{hilite} eq 'none') {
        return('');
    } elsif ($::args->{hilite} eq 'ansi-colors') {
        return $ansi{$color};
    } elsif ($::args->{hilite} eq 'enscript-colors') {
        return $enscript{$color};
    } else {
        die "Unknown --hilite: $::args->{hilite}\n";
    }

    $ansi{$color};
}

sub combined_keys {
    my ($a, $b) = @_;
    my %seen = ();

    for my $key (keys %{$a}) {
        $seen{$key}++;
    }
    for my $key (keys %{$b}) {
        $seen{$key}++;
    }

    sort keys %seen;
}

sub num_to_3digits {
    sprintf("%03d", $_[0]);
}

sub OLD_num_to_tag {
    my ($type, $prefix, $num) = @_;
    $num =~ s/^[vc]:0?// || die "Invalid ${$type}_num: $num\n";

    "$prefix:$num";
}

sub num_to_tag {
    my ($type, $prefix, $num) = @_;
    $num =~ s/^[vc]://;
    $num =~ s/^0+//;

    "$prefix:$num"
}

sub run_in_out {
    my ($input, @cmd) = @_;
    my $out = '';
    my $err = 'HI';
    my $cmd_str = shell_quote(@cmd);

    print STDERR "Running $cmd_str\n";
    run3 (\@cmd, \$input, \$out, \$err)
       || die "Error running `$cmd_str: $?  / $!\n";
    if ($? == 0) {
        #"ERROR: $err\n$?, Stopped ";
    }
    print STDERR "$err\n" if $err;
    return($out);
}

sub write_book_file {
    my ($out_dir, $book, $add_header) = @_;
    my $book_id = $book->{book_id};
    my $out_file = "$out_dir/$book_id.yaml";

    $add_header ||= "";

    my $std_header = "From the Golden Douay Rheims Project\n"
                   . "https://github.com/tomazon/douay-rheims\n";

    #my $yh = YAML::Safe->new->encoding("utf8");

    say "    ". _blue("Writing: $out_file");
    #YAML::DumpFile ($out_file, $book);

    my $yaml = YAML::Dump($book);
    write_file($out_file, {binmode => ':raw'}, "$std_header\n$add_header\n\n$yaml");

    #say $yaml;
    #my $encoding_name = Encode::Detect::Detector::detect($yaml);
    #print $encoding_name; # gb18030
    #$yaml = from_to($encoding_name, 'UTF-8', $yaml);
    #write_file($out_file, {binmode => ':utf8'}, $yaml);
    #write_file($out_file, $yaml);

    #write_file($out_file, {binmode => ':utf8'}, $yaml);
    #$yh->SafeDumpFile($out_file, $book);
    #say $yaml;


    # open (OUT, ">$out_file");
    # binmode(OUT, ":utf8");
    # print OUT $yaml;
    # close OUT;

    #use autodie qw(:all);
    #open my $fh, ">$out_file";
    #print {$fh} "\x{ef}\x{bb}\x{bf}\n";
    #binmode($fh, ":utf8");
    #print {$fh} "\nHi There!\n";
    #print {$fh} $yaml;
    #close $fh;

    $book = {};

    my $string = read_file($out_file, {binmode => ':utf8'});

    binmode STDOUT, ":raw";
    print "$string\n";
}

sub _color   {color_code($_[0]) . $_[1] . color_code('reset')}
sub _red     {_color('red', $_[0])}
sub _green   {_color('green', $_[0])}
sub _yellow  {_color('yellow', $_[0])}
sub _blue    {_color('blue', $_[0])}

sub _on_red     {_color('on_red', $_[0])}
sub _on_yellow  {_color('on_yellow', $_[0])}
sub _header     {_color('header', $_[0])}

1;
