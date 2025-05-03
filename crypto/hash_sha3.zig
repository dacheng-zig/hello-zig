const std = @import("std");

// compute hash using sha3
pub fn main() !void {
    const text = "hello";
    var sha512: [64]u8 = undefined;
    std.crypto.hash.sha3.Sha3_512.hash(text, &sha512, .{});

    std.debug.print("sha3_512({s}) = {x}\n", .{text, sha512});
}