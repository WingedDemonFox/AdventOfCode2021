const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day02.txt");

const Submarine = struct{
    horizontal: u64 = 0,
    depth:u64 = 0,
    aim:u64 =0,

    pub fn SubMultiply(self:*Submarine) u64 {
        return self.horizontal * self.depth;
    }
};

pub fn main() !void {
    var part1Sub = Submarine{};
    var part2Sub = Submarine{};

    var lines = tokenize(u8,data, "\r\n");
    while(lines.next()) |line|{
        var tokenized = tokenize(u8, line, " ");
        var order = tokenized.next().?;
        var amount = try parseInt(u64, tokenized.next().?, 10);
        
        //std.debug.print("order: {s}, amount: {} \n", .{order, amount});
        if(std.mem.eql(u8, order, "forward")){
            part1Sub.horizontal += amount;
            part2Sub.horizontal += amount;
            part2Sub.depth += (amount * part2Sub.aim);

        } else if(std.mem.eql(u8,order,"down")){
            part1Sub.depth += amount;
            part2Sub.aim += amount;

        } else if(std.mem.eql(u8,order,"up")){
            part1Sub.depth -= amount;
            part2Sub.aim -= amount;
        } else {
            std.debug.print("something went horribly wrong", .{});
        }
    }

    std.debug.print("Day 2 Part 1: {} \n", .{part1Sub.SubMultiply()});
    std.debug.print("Day 2 Part 1: {} \n", .{part2Sub.SubMultiply()});
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;
