const std = @import("std");

pub fn main() void {
    std.debug.print("main thread id: {}\n", .{std.Thread.getCurrentId()});
}
