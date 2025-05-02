const std = @import("std");

// compute md5 hash
pub fn main() !void {
    var md5: [16]u8 = undefined;
    const text = "hello";
    std.crypto.hash.Md5.hash(text, &md5, .{});

    std.debug.print("md5({s}) = {x}\n", .{ text, md5 });
}
