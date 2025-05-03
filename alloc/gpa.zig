const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}).init;
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const val = try allocator.create(i32);
    defer allocator.destroy(val);

    val.* = 51;
    std.debug.print("pointer: {}\n", .{val});
    std.debug.print("value: {}\n", .{val.*});
}