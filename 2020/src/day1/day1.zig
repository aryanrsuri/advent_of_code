const std = @import("std");
const sort = std.sort.heap;
var stream = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = stream.allocator();
var input = @embedFile("input");

fn part1() !u64 {
    var map = std.hash_map.AutoHashMap(u64, u64).init(gpa);
    defer map.deinit();
    var buffer = std.mem.tokenize(u8, input, "\n");
    while (buffer.next()) |line| {
        const x = try std.fmt.parseUnsigned(u64, line, 10);
        const res = map.get(2020 - x);
        if (res != null) {
            return res.? * x;
        } else {
            try map.put(x, x);
        }
    }
    return 0;
}

fn part2() !u64 {
    var num_arr: [200]u64 = undefined;
    var buffer = std.mem.tokenize(u8, input, "\n");
    var i: usize = 0;
    while (buffer.next()) |line| {
        const x = try std.fmt.parseUnsigned(u64, line, 10);
        num_arr[i] = x;
        i += 1;
    }

    for (num_arr, 0..) |int, z| {
        for (num_arr[z..], z..) |int2, j| {
            if (int + int2 > 2020) {
                continue;
            } else {
                for (num_arr[j..]) |int3| {
                    if (int + int2 + int3 == 2020) {
                        return int * int2 * int3;
                    }
                    continue;
                }
            }
        }
    }
    std.debug.print("arr {any}\n", .{num_arr});
    return 0;
}

test "day1" {
    const res = try part1();
    const res2 = try part2();
    std.debug.print("\r\nresult: {}\n", .{res});
    std.debug.print("\r\nresult: {}\n", .{res2});
}
