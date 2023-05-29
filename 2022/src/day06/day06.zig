const std = @import("std");
const file = @embedFile("input");
const print = std.debug.print;
fn d6p1() !usize {
    var buffer = std.mem.window(u8, file, 4, 1);
    var i: usize = 0;
    while (buffer.next()) |line| {
        for (line) |char| {}
    }
    return i;
}

pub fn main() !void {
    const ans = try d6p1();
    print("{}", .{ans});
}
