# nmtests -- fork for nlmixr2data

Benchmark tests against nonmem. These aren't tests of speed or performance, but
rather tests comparing different behaviors. The primary interests are things
like dosing events (infusions and bolus), steady state, lag times,
bioavailability, handling time-varying covariates etc..

This was based on the open-source work done by Kyle Baron for the tool
`mrgsolve` https://github.com/mrgsolve/nmtests .

This, however has a few expanded cases:

- All expanded cases have IDs above 100; These test other possible
  errors that rxode2 and other tools may have when running events.
