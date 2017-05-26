use strict;
use warnings;
use utf8;
use Test::More;

use Mackerel::ReleaseUtils qw/replace/;

subtest dirglob => sub {
    my @files;
    replace 't/testdata/*/file1' => sub {
        my ($content, $file) = @_;
        push @files, $file;
        $content;
    };
    is_deeply [sort @files], [qw{t/testdata/dir1/file1 t/testdata/dir2/file1}];
};

subtest fileglob => sub {
    my @files;
    replace 't/testdata/dir1/file*' => sub {
        my ($content, $file) = @_;
        push @files, $file;
        $content;
    };
    is_deeply [sort @files], [qw{t/testdata/dir1/file1 t/testdata/dir1/file2}];
};

done_testing;

