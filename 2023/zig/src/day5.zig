const std = @import("std");
const mem = std.mem;
const stdout = std.io.getStdOut().writer();

pub fn part1(fp: []const u8) !u8 {
    const raw = @embedFile(fp);
    var buffer = std.mem.tokenizeScalar(u8, raw, '\n');

    while (buffer.next()) |line| {
        stdout.print("{s}\n", .{line});
    }
    return 0;
}

pub fn part2(fp: []const u8) !u8 {
    const raw = @embedFile(fp);
    var buffer = std.mem.tokenizeScalar(u8, raw, '\n');

    while (buffer.next()) |line| {
        stdout.print("{s}\n", .{line});
    }
    return 0;
}

test "part1" {
    stdout.print("result :: {any}\n", .{try part1("day5.input")});
}
test "part2" {
    stdout.print("result :: {any}\n", .{try part2("day5.input")});
}
