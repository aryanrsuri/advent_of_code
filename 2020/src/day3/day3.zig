const std = @import("std");
const sort = std.sort.heap;
var stream = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = stream.allocator();
var input = @embedFile("input");

fn part1() !void {}
