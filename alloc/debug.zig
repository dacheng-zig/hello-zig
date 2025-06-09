const std = @import("std");

pub fn main() !void {
    var dbgalloc = std.heap.DebugAllocator(.{}).init;
    defer _ = dbgalloc.deinit();
    const allocator = dbgalloc.allocator();

    const val = try allocator.create(i32);
    defer allocator.destroy(val);

    val.* = 51;
    std.debug.print("pointer: {}\n", .{val});
    std.debug.print("value: {}\n", .{val.*});
}
