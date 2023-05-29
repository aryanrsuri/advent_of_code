const std = @import("std");
var gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_init.allocator();
const input = @embedFile("./input");
const print = std.debug.print;

fn part01() !u64 {
    var buffer = std.mem.split(u8, input, "\n");
    var value: u64 = 0;
    while (buffer.next()) |line| {
        const rksk2: []const u8 = line[line.len / 2 ..];
        // if (line.len == 0) {
        //     continue;
        // }
        for (line[0 .. line.len / 2]) |char| {
            var number = std.mem.count(u8, rksk2, &[_]u8{char});
            if (number > 0) {
                value += try assign_char_priority(char);
                break;
            } else {
                continue;
            }
        }
    }
    return value;
}

fn part02() !u64 {
    return 0;
}

fn assign_char_priority(char: u8) !u64 {
    if (char >= 65 and char <= 90) {
        return @as(u64, char - 38);
    }
    return @as(u64, char - 96);
}

test "charreper" {
    const part1 = try part01();
    // const part2 = try part02();
    print("result: {}\n", .{part1});
    // print("result: {}\n", .{part2});
}
