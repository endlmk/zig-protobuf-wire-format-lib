const std = @import("std");
const testing = std.testing;

export fn parseVariant(b :u8) i32 {
    return b;
}

test "parseVariant" {
    try testing.expect(parseVariant(0b0000001) == 1);
}
