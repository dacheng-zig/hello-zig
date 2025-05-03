const std = @import("std");

// compute hash using sha2
pub fn main() !void {
    const text = "hello";
    var sha512: [64]u8 = undefined;
    std.crypto.hash.sha2.Sha512.hash(text, &sha512, .{});

    std.debug.print("sha2_sha512({s}) = {x}\n", .{text, sha512});
}