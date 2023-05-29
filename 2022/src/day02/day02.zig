const std = @import("std");
const print = std.debug.print;
const input = @embedFile("./input");
const gpa_init = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_init.allocator();

const turn = enum(u8) {
    Rock = 1,
    Paper = 2,
    Scissors = 3,
};

const outcome = enum(u8) {
    Lost = 0,
    Draw = 3,
    Won = 6,
};

// const KV_turn = struct { []const u8, turn };

const player_1 = std.ComptimeStringMap(turn, .{
    .{ "A", .Rock },
    .{ "B", .Paper },
    .{ "C", .Scissors },
});

const player_2 = std.ComptimeStringMap(turn, .{
    .{ "A", .Rock },
    .{ "B", .Paper },
    .{ "C", .Scissors },
});

fn part1() !u16 {
    var buffer = std.mem.split(u8, input, "\n");
    var score: u16 = 0;
    while (buffer.next()) |line| {
        const a = player_1.get(&[_]u8{line[0]});
        const b = player_2.get(&[_]u8{line[2]}).?;

        score += switch (a) {
            .Rock => {
                return switch (b) {
                    .Rock => return @enumToInt(b) + @enumToInt(outcome.Draw),
                    .Paper => return 2 + @enumToInt(outcome.Lost),
                    .Scissors => return 3 + @enumToInt(outcome.Won),
                };
            },
            .Paper => {
                return switch (player_2.get(&[_]u8{line[2]}).?) {
                    .Rock => 1 + @enumToInt(outcome.Draw),
                    .Paper => 2 + @enumToInt(outcome.Lost),
                    .Scissors => 3 + @enumToInt(outcome.Won),
                };
            },
            .Scissors => {
                return switch (player_2.get(&[_]u8{line[2]}).?) {
                    .Rock => 1 + @enumToInt(outcome.Draw),
                    .Paper => 2 + @enumToInt(outcome.Lost),
                    .Scissors => 3 + @enumToInt(outcome.Won),
                };
            },
        };
    }

    return score;
}

pub fn main() void {
    print("{}\n", .{try part1()});
}
