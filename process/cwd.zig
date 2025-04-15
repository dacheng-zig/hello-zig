const std = @import("std");

pub fn main() !void {
    // use stack memory
    var buf: [100]u8 = undefined;
    const cwd = try std.process.getCwd(buf[0..buf.len]);
    std.debug.print("cwd: {s}\n", .{cwd});

    // use gpa allocator, and we need to free the returned memory pointer 'cwd2'
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    const cwd2 = try std.process.getCwdAlloc(allocator);
    defer allocator.free(cwd2);
    std.debug.print("cwd2: {s}\n", .{cwd2});
}
