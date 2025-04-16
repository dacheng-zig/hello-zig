const std = @import("std");

pub fn main() void {
    std.process.abort();

    // This line would be ignored by compiler.
    std.debug.print("Hello, world!\n", .{});
}
