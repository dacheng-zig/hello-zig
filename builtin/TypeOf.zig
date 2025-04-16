const std = @import("std");

pub fn main() void {
    std.debug.print("typeof(1) = {}\n", .{@TypeOf(1)});
    std.debug.print("typeof(1.2) = {}\n", .{@TypeOf(1.2)});

    const x1: u8 = 2;
    std.debug.print("typeof(u8) = {}\n", .{@TypeOf(x1)});

    const x2: []u8 = undefined;
    std.debug.print("typeof([]u8) = {}\n", .{@TypeOf(x2)});

    const x3 = "hello";
    std.debug.print("typeof(string literal) = {}\n", .{@TypeOf(x3)});

    const x4: [4]i32 = .{ 1, 2, 3, 4 };
    std.debug.print("typeof([4]i32) = {}\n", .{@TypeOf(x4)});

    const myStruct: MyStruct = .{ .a = 1 };
    std.debug.print("typeof(MyStruct) = {}\n", .{@TypeOf(myStruct)});

    const myUnion: MyUnion = .{ .a = 1 };
    std.debug.print("typeof(MyUnion) = {}\n", .{@TypeOf(myUnion)});

    const myEnum: MyEnum = .One;
    std.debug.print("typeof(MyEnum) = {}\n", .{@TypeOf(myEnum)});
}

const MyStruct = struct {
    a: u8,
};

const MyUnion = union {
    a: u8,
};

const MyEnum = enum {
    One,
};
