const std = @import("std");
const testing = std.testing;

fn parseVariant(b :[]const u8) i32 {
    return b[0];
}

test "parseVariant" {
    var list = std.ArrayList(u8).init(std.testing.allocator);
    try list.append(0b00000001);

    try testing.expect(parseVariant(list.items) == 1);

    list.clearRetainingCapacity();
    try list.append(0b01111111);
    try testing.expect(parseVariant(list.items) == 127);
    list.deinit();
    // try testing.expect(parseVariant(0b1000000000000001) == 128);

}
