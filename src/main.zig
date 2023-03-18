const std = @import("std");
const testing = std.testing;

export fn parseVariant(b :*std.ArrayList(u8)) i32 {
    return b.items[0];
}

test "parseVariant" {
    var list = std.ArrayList(u8).init(std.testing.allocator);
    try list.append(0b00000001);

    try testing.expect(parseVariant(&list) == 1);

    list.clearRetainingCapacity();
    try list.append(0b01111111);
    try testing.expect(parseVariant(&list) == 127);
    list.deinit();
    // try testing.expect(parseVariant(0b1000000000000001) == 128);

}
