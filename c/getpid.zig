const std = @import("std");
const c = std.c;

// pid is Process Identifier, ppid is Parent Process Identifier.
// pid is unique, but pid will be reused after process exit.
// c.getpid() is c function from libc.
pub fn main() void {
    const pid = c.getpid();
    std.debug.print("pid: {}\n", .{pid});

    const ppid = c.getppid();
    std.debug.print("ppid: {}\n", .{ppid});
}
