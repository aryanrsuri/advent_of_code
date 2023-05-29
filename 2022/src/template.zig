const std = @import("std");
const print = std.debug.print;
const input = @embedFile("./input");

fn part1() !u32 {}
fn part2() !u32 {}

test "part1" {
    print("Part 1 result is: {} \n", .{try part1()});
}
test "part2" {
    print("Part 2 result is: {} \n", .{try part2()});
}
