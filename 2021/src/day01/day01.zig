const std = @import("std");
var gpa_stream = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_stream.allocator();

fn d1p1() !u16 {
    var file = try read_input(gpa);
    var buffer = std.mem.split(u8, file, "\n");
    var count: u16 = 0;
    var last: u16 = 65_535;
    while (buffer.next()) |line| {
        if (line.len == 0) {
            break;
        } else {
            const depth = try std.fmt.parseInt(u16, line, 10);
            if (depth > last) count += 1;
            last = depth;
        }
    }
    return count;
}

fn d1p2() !u16 {
    var file = try read_input(gpa);
    var buffer = std.mem.tokenize(u8, file, "\n");
    var count: u16 = 0;
    var window: [3]u16 = .{
        try std.fmt.parseInt(u16, buffer.next().?, 10),
        try std.fmt.parseInt(u16, buffer.next().?, 10),
        try std.fmt.parseInt(u16, buffer.next().?, 10),
    };
    var last: u16 = window[0] + window[1] + window[2];
    while (buffer.next()) |line| {
        window[0] = window[1];
        window[1] = window[2];
        window[2] = try std.fmt.parseInt(u16, line, 10);
        if (line.len == 0) {
            break;
        } else {
            const new_sum = window[0] + window[1] + window[2];
            if (new_sum > last) count += 1;
            last = new_sum;
        }
    }

    return count;
}

test " day 1" {
    std.debug.print("\nanswer to part 1 day 1: {}\n", .{try d1p1()});
    std.debug.print("answer to part 1 day 2: {}\n", .{try d1p2()});
}
pub fn read_input(allocator: std.mem.Allocator) ![]const u8 {
    const file = try std.fs.cwd().openFile("input", .{});
    defer file.close();
    const stat = try file.stat();
    const file_size = stat.size;
    return try file.reader().readAllAlloc(allocator, file_size);
}
