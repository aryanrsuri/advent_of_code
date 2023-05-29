const std = @import("std");
var gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_init.allocator();
const file = @embedFile("./input");
const print = std.debug.print;

const assigment = struct {
    low: u8,
    high: u8,

    fn parse(input: []const u8) !assigment {
        var nums = try split_n(input, "-", 2);
        return assigment{
            .low = try std.fmt.parseUnsigned(u8, nums[0], 10),
            .high = try std.fmt.parseUnsigned(u8, nums[1], 10),
        };
    }

    fn contain(self: assigment, other: assigment) bool {
        return other.low >= self.low and other.high <= self.high;
    }

    fn overlap(self: assigment, other: assigment) bool {
        return (self.low <= other.low and self.high >= other.low) or (other.low <= self.low and other.high >= self.high);
    }
};
fn part01() !u64 {
    var buffer = std.mem.tokenize(u8, file, "\r\n");
    var count: u64 = 0;
    while (buffer.next()) |line| {
        var buffer_comma = try split_n(line, ",", 2);
        var asn1 = try assigment.parse(buffer_comma[0]);
        var asn2 = try assigment.parse(buffer_comma[1]);

        if (asn1.contain(asn2) or asn2.contain(asn1)) {
            count += 1;
        } else {
            continue;
        }
    }

    return count;
}
fn part02() !u64 {
    var buffer = std.mem.tokenize(u8, file, "\r\n");
    var count: u64 = 0;
    while (buffer.next()) |line| {
        var buffer_comma = try split_n(line, ",", 2);
        var asn1 = try assigment.parse(buffer_comma[0]);
        var asn2 = try assigment.parse(buffer_comma[1]);

        if (asn1.overlap(asn2) or asn2.overlap(asn1)) {
            count += 1;
        } else {
            continue;
        }
    }

    return count;
}
pub fn is_number(char: u8) bool {
    if ('0' <= char and char <= '9') {
        return true;
    }

    return false;
}

test "part1" {
    const res = try part01();
    const res1 = try part02();
    print("{}\r\n", .{res});
    print("{}\r\n", .{res1});
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
