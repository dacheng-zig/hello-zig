const std = @import("std");

// default scoped logger
pub fn main() !void {
    std.log.debug("hello", .{});
    std.log.info("hello", .{});
    std.log.warn("hello", .{});
    std.log.err("hello", .{});
}