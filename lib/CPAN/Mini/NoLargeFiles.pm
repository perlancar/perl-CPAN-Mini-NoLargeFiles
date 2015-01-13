package CPAN::Mini::NoLargeFiles;

# DATE
# VERSION

use 5.010;
use strict;
use warnings;

use LWP::UserAgent::Patch::FilterMirrorMaxSize
    -size=>($ENV{MAX_FILE_SIZE} // 10*1024*1024), -verbose=>1;

use parent 'CPAN::Mini';

1;

# ABSTRACT: Create a CPAN mirror excluding files that are too large

=for Pod::Coverage ^(.*)$

=head1 SYNOPSIS

By default files larger than 10MB will be skipped:

 % minicpan -c CPAN::Mini::NoLargeFiles ...

To specify size:

 % MAX_FILE_SIZE=20000000 minicpan -c CPAN::Mini::NoLargeFiles ...


=head1 DESCRIPTION

This is a thin wrapper for L<LWP::UserAgent::Patch::FilterMirrorMaxSize>, so
instead of:

 % PERL5OPT="-MLWP::UserAgent::Patch::FilterMirrorMaxSize=-size,10485760,-verbose,1" minicpan ...

you can just do:

 % cpan -c CPAN::Mini::NoLargeFiles ...


=head1 FAQ

=head2 How to mix with other subclasses (e.g. I also want to use CPAN::Mini::LatestDistVersion)

Use the patch directly instead of this subclass (see Description).

=cut
