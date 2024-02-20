const std = @import("std");
const mem = std.mem;
const stdout = std.io.getStdOut().writer();
const raw = @embedFile("day5.test.input");

pub const Seed = u64;
pub const Map = struct {
    source: []const u8,
    destination: []const u8,
    drange: Seed,
    srange: Seed,
    rlen: usize,
};

pub fn part1() !void {
    var buffer = std.mem.tokenizeScalar(u8, raw, '\n');
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const alloc = gpa.allocator();
    // var seeds = std.ArrayList(Seed).init(alloc);
    var sds = std.mem.tokenizeScalar(u8, buffer.next().?, ' ');
    _ = sds.next();
    var seeds: [100]Seed = undefined;
    var i: usize = 0;
    while (sds.next()) |line| : (i += 1) {
        const s: Seed = try std.fmt.parseInt(u64, line, 10);
        seeds[i] = s;
    }
    while (buffer.next()) |line| {
        _ = line;

    }
}

pub fn part2() !u8 {
    var buffer = std.mem.tokenizeScalar(u8, raw, '\n');

    while (buffer.next()) |line| {
        try stdout.print("{s}\n", .{line});
    }
    return 0;
}

test "part1" {
    try part1();
}
// test "part2" {
// stdout.print("result :: {any}\n", .{try part2()});
// }
