const std = @import("std");

// compute hash using md5
pub fn main() !void {
    const text = "hello";
    var md5: [16]u8 = undefined;
    std.crypto.hash.Md5.hash(text, &md5, .{});

    std.debug.print("md5({s}) = {x}\n", .{ text, md5 });
}
