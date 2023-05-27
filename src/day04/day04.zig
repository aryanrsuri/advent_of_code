const std = @import("std");
var gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_init.allocator();
const file = @embedFile("./input");
const print = std.debug.print;

fn part01() !u8 {
    var buffer = std.mem.tokenize(u8, file, "\r\n");
    while (buffer.next()) |line| {
        var buffer_comma = std.mem.tokenize(u8, line, ",");
        while (buffer_comma.next()) |elf| {
            // for (line) |char| {
            var nums = try split_n(elf, "-", 2);
            // var res = try std.fmt.parseInt(u8, nums[0], 10);
            // var res = try std.fmt.parseInt(u8, nums[1], 10);
            print("{s}\n", .{nums});
        }
        // }
        // var assignments = std.mem.split(u8, line, ",");
        // var asn1 = assignments.first();
        // var asn2 = assignments.next().?;
        // print("{s}\n", .{asn1});
        // print("{s}\n", .{asn2});
    }

    return 0;
}
pub fn is_number(char: u8) bool {
    if ('0' <= char and char <= '9') {
        return true;
    }

    return false;
}

test "part1" {
    const res = try part01();
    print("{}\r\n", .{res});
}

pub fn split_n(input: []const u8, delim: []const u8, comptime n: usize) ![n][]const u8 {
    var rv: [n][]const u8 = undefined;

    var iter = std.mem.split(u8, input, delim);
    var i: usize = 0;
    while (iter.next()) |thing| {
        if (i >= n) {
            return error.SplitOverflow;
        }
        rv[i] = thing;
        i += 1;
    }
    if (i != n) {
        return error.SplitUnderflow;
    }
    return rv;
}
