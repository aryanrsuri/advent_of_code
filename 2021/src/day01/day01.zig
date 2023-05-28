const std = @import("std");
const file = @embedFile("input");

fn d1p1() !u32 {
    var buffer = std.mem.split(u8, file, "\n");
    var count: u32 = 0;
    var i: usize = 0;
    while (i < 1000) : (i += 1) {
        var d = buffer.next().?;
        var p = buffer.next().?;

        var res = @max(d, p);
        if (res == p) count += 1 else continue;
    }
    // std.debug.print("{any}\n", .{try std.fmt.parseUnsigned(u16, tokens.next().?, 10)});
    return count;
}

test " day 1" {
    std.debug.print("answer to part 1 day 1: {}\n", .{try d1p1()});
}

pub fn Result(comptime T: type) type {
    return struct {
        result: T,
        size: usize,
    };
}

pub fn toUnsignedInt(comptime T: type, contents: []const u8) Result(T) {
    if (@typeInfo(T).Int.signedness == .signed)
        @compileError("must supply a signed integer");

    var result: T = 0;
    var characters: usize = 0;

    for (contents, 0..) |char, i| {
        if ('0' <= char and char <= '9') {
            result *= 10;
            result += @as(T, char - '0');
            characters = i;
        } else break;
    }

    return .{ .result = result, .size = characters + 1 };
}
