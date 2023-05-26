const std = @import("std");
const print = std.debug.print;
const input = @embedFile("./input");

fn part1() !u32 {
    var buffer = std.mem.split(u8, input, "\n");
    var max_kcal: u32 = 0;
    var curr_kcal: u32 = 0;
    while (buffer.next()) |line| {
        if (line.len == 0) {
            if (curr_kcal > max_kcal) {
                max_kcal = curr_kcal;
            }

            curr_kcal = 0;
        } else {
            curr_kcal += try std.fmt.parseInt(u32, line, 10);
        }
    }

    return max_kcal;
}

fn part2() !u32 {
    var buffer = std.mem.split(u8, input, "\n");
    var three_max = [3]u32{ 0, 0, 0 };
    var curr_kcal: u32 = 0;

    while (buffer.next()) |line| {
        if (line.len == 0) {
            var min_idx = std.mem.indexOfMin(u32, &three_max);
            if (curr_kcal > three_max[min_idx]) {
                three_max[min_idx] = curr_kcal;
            }
            curr_kcal = 0;
        } else {
            curr_kcal += try std.fmt.parseInt(u32, line, 10);
        }
    }

    curr_kcal = 0;
    for (three_max) |val| {
        curr_kcal += val;
    }

    return curr_kcal;
}

test "part1" {
    print("Part 1 result is: {} \n", .{try part1()});
}
test "part2" {
    print("Part 2 result is: {} \n", .{try part2()});
}
