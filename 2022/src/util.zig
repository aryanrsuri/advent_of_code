// pub const std = @import("std");
// var gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
// pub const gpa = gpa_init.allocator();
// const tokenize = std.mem.tokenize;
// const split = std.mem.split;
// const indexOf = std.mem.indexOfScalar;
// const indexOfAny = std.mem.indexOfAny;
// const indexOfStr = std.mem.indexOfPosLinear;
// const lastIndexOf = std.mem.lastIndexOfScalar;
// const lastIndexOfAny = std.mem.lastIndexOfAny;
// const lastIndexOfStr = std.mem.lastIndexOfLinear;
// const trim = std.mem.trim;
// const sliceMin = std.mem.min;
// const sliceMax = std.mem.max;
// const parseInt = std.fmt.parseInt;
// const parseFloat = std.fmt.parseFloat;
// const min = std.math.min;
// const min3 = std.math.min3;
// const max = std.math.max;
// const max3 = std.math.max3;
// const print = std.debug.print;
// const assert = std.debug.assert;
// const sort = std.sort.sort;
// const asc = std.sort.asc;
// const desc = std.sort.des
const std = @import("std");
var gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
pub const gpa = gpa_init.allocator();
pub fn split_n(input: []const u8, delim: []const u8, comptime n: usize) ![n][]const u8 {
    var rv: [n][]const u8 = undefined;

    var iter = std.mem.split(u8, input, delim);
    var i: usize = 0;
    while (iter.next()) |thing| {
        if (i >= n) {
            return error.SplitOverflow;
        }
        rv[i] = thing;
        i += 1;
    }
    if (i != n) {
        return error.SplitUnderflow;
    }
    return rv;
}
