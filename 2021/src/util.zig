const std = @import("std");

pub fn read_input(allocator: std.mem.Allocator) ![]const u8 {
    const file = try std.fs.cwd().openFile("input", .{});
    defer file.close();
    const stat = try file.stat();
    const file_size = stat.size;
    return try file.reader().readAllAlloc(allocator, file_size);
}
