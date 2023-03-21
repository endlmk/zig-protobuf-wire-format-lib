const std = @import("std");
const testing = std.testing;

fn parseVariant(b :[]const u8) u64 {
    var val : u64 = 0;

    for (b) |byte, i|
    {
        val += @as(u64, (byte & 0b01111111)) << @truncate(u6, 7 * i);
    }

    return val;
}

test "parseVariant" {
    {
        const bytes = [_]u8{0b00000001};
        try testing.expect(parseVariant(&bytes) == 1);
    }
    {
        const bytes = [_]u8{0b01111111};
        try testing.expect(parseVariant(&bytes) == 127);
    }
    {
        const bytes = [_]u8{0b10000000, 0b00000001};
        try testing.expect(parseVariant(&bytes) == 128);
    }
    {
        const bytes = [_]u8{0b10010110, 0b00000001};
        try testing.expect(parseVariant(&bytes) == 150);
    }
    {
        const bytes = [_]u8{0b10000000, 0b00000010};
        try testing.expect(parseVariant(&bytes) == 256);
    }
}
