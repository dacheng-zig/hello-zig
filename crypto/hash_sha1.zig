const std = @import("std");

// compute hash using sha1
pub fn main() !void {
    const text = "hello";
    var sha1: [20]u8 = undefined;
    std.crypto.hash.Sha1.hash(text, &sha1, .{});

    std.debug.print("sha1({s}) = {x}\n", .{text, sha1});
}