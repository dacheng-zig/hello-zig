const std = @import("std");

// read env (snapshot)
// see also: std.os.environ
// see also: std.c.environ
pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer _ = arena.deinit();
    const alloc = arena.allocator();

    try set(alloc);
    try getUser(alloc);
}

// print all env vars.
pub fn set(alloc: std.mem.Allocator) !void {
    var env_map = try std.process.getEnvMap(alloc);
    defer env_map.deinit();

    var it = env_map.iterator();
    while (it.next()) |entry| {
        std.debug.print("{s}={s}\n", .{ entry.key_ptr.*, entry.value_ptr.* });
    }
}

// get env var for USER
pub fn getUser(alloc: std.mem.Allocator) !void {
    var env_map = try std.process.getEnvMap(alloc);
    defer env_map.deinit();

    const user_env = env_map.get("USER") orelse return error.EnvNotSet;
    std.debug.print("\nUSER={s}\n", .{user_env});
}
