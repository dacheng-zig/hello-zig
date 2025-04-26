const std = @import("std");
const process = std.process;

// macOS: user not found but it does
pub fn main() !void {
    const userInfo = try process.getUserInfo("gdc");
    std.debug.print("uid: {}\ngid: {}\n", .{userInfo.uid, userInfo.gid});
}