const std = @import("std");

pub fn main() !void {
    // x is in the stack, an i32 value
    var x: i32 = undefined;
    // &x is the pointer which points to x
    init(&x, 51);
    std.debug.print("x = {}\n", .{x});
}

fn init(x: *i32, v: i32) void {
    // assign the value `v` to `x`, need to dereference first using `x.*`
    x.* = v;
}
