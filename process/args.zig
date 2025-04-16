const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    // Print each argument
    for (args) |arg| {
        std.debug.print("arg: {s}\n", .{arg});
    }
}
