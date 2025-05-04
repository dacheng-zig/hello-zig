const std = @import("std");

// custom scoped logger
pub fn main() !void {
    const logger = std.log.scoped(.main);
    logger.debug("hello", .{});
    logger.info("hello", .{});
    logger.warn("hello", .{});
    logger.err("hello", .{});
}