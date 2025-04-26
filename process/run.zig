const std = @import("std");
const process = std.process;

// run command and get the output from child process
pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const child = try process.Child.run(.{
        .allocator = allocator,
        .argv = &[_][]const u8{ "echo", "hi" },
    });
    defer {
        allocator.free(child.stderr);
        allocator.free(child.stdout);
    }
    std.debug.print("echo: {s}\n", .{child.stdout});
}
