const std = @import("std");

// compute hash using blake2
pub fn main() !void {
    const text = "hello";
    var blake2: [32]u8 = undefined;
    std.crypto.hash.blake2.Blake2s256.hash(text, &blake2, .{});

    std.debug.print("blake2s256({s}) = {x}\n", .{text, blake2});
}