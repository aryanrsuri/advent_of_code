const std = @import("std");
var gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_init.allocator();
const input = @embedFile("./input");
const print = std.debug.print;

fn part01() !u8 {
    var buffer = std.mem.tokenize(u8, input, "\r\n");
    while (buffer.next()) |line| {
        var assignments = std.mem.split(u8, line, ",");
        var asn1 = assignments.first();
        var asn2 = assignments.next().?;
        print("{s}\n", .{asn1});
        print("{s}\n", .{asn2});
    }

    return 0;
}

test "part1" {
    const res = try part01();
    print("{}", .{res});
}
