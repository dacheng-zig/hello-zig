const std = @import("std");

// arena allocator
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var arena = std.heap.ArenaAllocator.init(gpa.allocator());
    defer _ = arena.deinit();
    var allocator = arena.allocator();

    const val = try allocator.create(i32);
    defer allocator.destroy(val);

    val.* = 51;
    std.debug.print("pointer: {}\n", .{val});
    std.debug.print("value: {}\n", .{val.*});
}