const std = @import("std");

// compute hash using blake3
pub fn main() !void {
    const text = "hello";
    var blake3: [32]u8 = undefined;
    std.crypto.hash.Blake3.hash(text, &blake3, .{});

    std.debug.print("blake3({s}) = {x}\n", .{text, blake3});
}