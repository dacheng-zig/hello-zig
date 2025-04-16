const std = @import("std");

pub fn main() !void {
    // stack buffer
    var buf: [100]u8 = undefined;
    const cwd = try std.process.getCwd(buf[0..buf.len]);
    std.debug.print("cwd: {s}\n", .{cwd});

    // change current work dir to `/tmp` and re-read CWD
    try std.process.changeCurDir("/tmp");
    const cwd2 = try std.process.getCwd(buf[0..buf.len]);
    std.debug.print("cwd2: {s}\n", .{cwd2});
}
