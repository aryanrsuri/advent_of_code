const std = @import("std");
const puzzle_input = @embedFile("input");

const move_set = enum {
    forward,
    down,
    up,
};

fn d2p1() !i32 {
    var file = @embedFile("input");
    var buffer = std.mem.tokenize(u8, file, "\n");
    var z: i32 = 0;
    var x: i32 = 0;
    while (buffer.next()) |line| {
        if (line.len == 0) {
            break;
        }
        const move = try split_n(line, " ", 2);
        const val = try std.fmt.parseInt(i32, move[1], 10);
        switch (std.meta.stringToEnum(move_set, move[0]).?) {
            .forward => x += val,
            .down => z += val,
            .up => z -= val,
        }
    }
    const res: i32 = z * x;
    return res;
}

fn d2p2() !i32 {
    var file = @embedFile("input");
    var buffer = std.mem.tokenize(u8, file, "\n");
    var z: i32 = 0;
    var x: i32 = 0;
    var theta: i32 = 0;
    while (buffer.next()) |line| {
        if (line.len == 0) {
            break;
        }
        const move = try split_n(line, " ", 2);
        const val = try std.fmt.parseInt(i32, move[1], 10);
        switch (std.meta.stringToEnum(move_set, move[0]).?) {
            .forward => {
                x += val;
                z += theta * val;
            },
            .down => theta += val,
            .up => theta -= val,
        }
    }
    const res: i32 = z * x;
    return res;
}

pub fn split_n(input: []const u8, delimiter: []const u8, comptime n: u8) ![n][]const u8 {
    var res: [n][]const u8 = undefined;
    var iter = std.mem.tokenize(u8, input, delimiter);
    var i: usize = 0;

    while (i < n) : (i += 1) {
        if (i >= n) {
            break;
        }
        res[i] = iter.next().?;
    }

    return res;
}

test "day 2 " {
    std.debug.print("\npart 1: {}\n", .{try d2p1()});
    std.debug.print("\npart 2: {}\n", .{try d2p2()});
}
