#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

use IO::File;
use strict;
use vars qw($Self);

scenarios(vlt => 1);

sub gen {
    my $filename = shift;

    my $fh = IO::File->new(">$filename");
    # Empty file should not EOFLINE warn
}

top_filename("$Self->{obj_dir}/t_lint_eofline_bad.v");

gen($Self->{top_filename});

lint(
    verilator_flags2 => ["-E -Wall -Wno-DECLFILENAME"],
    expect_filename => $Self->{golden_filename},
    );

ok(1);
1;
