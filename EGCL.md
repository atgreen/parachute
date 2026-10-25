# EGCL support

The `egcl` branch adapts Parachute's process exit operation to `UIOP:QUIT`,
preserving the requested exit status. UIOP is an explicit system dependency.
Other implementation branches remain unchanged.

From this directory, with Parachute's dependencies available to ASDF:

```sh
egcl --no-init --load test/egcl-quit.lisp
```

The regression must exit with status **23**. Before the adapter it instead
signalled `Quit 23` and exited with status 1. The complete library loads before
this check. Tested with EGCL 0.0.10, revision b94618ece; the full Parachute suite
was not run. Tracking: `bliss-wne9.10.2`.

This is a quit-only adapter. Parachute's existing unsupported-platform
`WITH-TIMEOUT` fallback still evaluates its body without enforcing a timeout
on EGCL. This fork does not claim timeout support.
