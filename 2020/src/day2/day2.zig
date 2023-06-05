const std = @import("std");
const sort = std.sort.heap;
var stream = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = stream.allocator();
var input = @embedFile("input");

fn part1() !void {
    var buffer = std.mem.tokenize(u8, input, "\n");
    var res: usize = 0;
    while (buffer.next()) |line| {
        var parse = std.mem.tokenizeAny(u8, line, "- :");
        const min = try std.fmt.parseUnsigned(u64, parse.next().?, 10);
        const max = try std.fmt.parseUnsigned(u64, parse.next().?, 10);
        const ch = parse.next();
        const pw = parse.next();
        const count = std.mem.count(u8, pw.?, ch.?);
        if (count >= min and count <= max) {
            res += 1;
        }
    }
    std.debug.print("part one result: {}\n", .{res});
}

fn part2() !void {
    var buffer = std.mem.tokenize(u8, input, "\n");
    var res: usize = 0;
    while (buffer.next()) |line| {
        var parse = std.mem.tokenizeAny(u8, line, "- :");
        const i = try std.fmt.parseUnsigned(u64, parse.next().?, 10);
        const j = try std.fmt.parseUnsigned(u64, parse.next().?, 10);
        const ch = parse.next();
        const pw = parse.next().?;
        var pw_set = [2]u8{ pw[i - 1], pw[j - 1] };
        if (std.mem.count(u8, &pw_set, ch.?) == 1) {
            res += 1;
        }
    }
    std.debug.print("part two result: {}\n", .{res});
}
pub fn split_n(_input: []const u8, delim: []const u8, comptime n: usize) ![n][]const u8 {
    var rv: [n][]const u8 = undefined;
    var iter = std.mem.split(u8, _input, delim);
    var i: usize = 0;
    while (iter.next()) |thing| {
        if (i >= n) {
            break;
        }

        var j: usize = 0;
        while (j < thing.len) {
            j += 1;
        }
        rv[i] = thing;
        i += 1;
    }
    if (i != n) {
        return error.badline;
    }

    return rv;
}

test "2020/day2" {
    _ = try part2();
}
