const std = @import("std");
const expect = std.testing.expect;

const MyStruct = struct {
    x: i32
};

test "@hasField" {
    try expect(@hasField(MyStruct, "x"));

    try expect(!@hasField(MyStruct, "y"));
}
