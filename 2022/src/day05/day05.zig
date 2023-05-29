const std = @import("std");
const file = @embedFile("input");
const pr = std.debug.print;

const crate = struct {
    pos: u8,
    val: u8,
};

const move_set = struct {
    amount: u8,
    crate_from: u8,
    crate_to: u8,
};

fn part01() ![]const u8 {
    const crate_map = try split_n(file, "\n", 9);
    pr("{s}\n", .{crate_map});

    return "done";
}

fn part02() ![]const u8 {
    return "false";
}

test " day 5 " {
    const res = try part01();
    pr("{s}\n", .{res});
}
pub fn split_n(input: []const u8, delim: []const u8, comptime n: usize) ![n][]const u8 {
    var rv: [n][]const u8 = undefined;
    // var lens: [n]usize = undefined;

    var iter = std.mem.split(u8, input, delim);
    var i: usize = 0;
    while (iter.next()) |thing| {
        if (i >= n) {
            break;
        }

        var j: usize = 0;
        while (j < thing.len) {
            pr("{s}", .{[_]u8{thing[i]}});
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

// pub fn next_n(input: []const u8, comptime n: usize) ![n][]const u8 {
//     var res: [n][]const u8 = undefined;
//     var iter = std.mem.split(u8, input, "\n");
//     var i: usize = 0;
//     while (iter.next()) |line| {
//         if (i >= n) {
//             break;
//         } else {
//             res[i] = line;
//             i += 1;
//         }
//     }
//
//     return res;
// }
