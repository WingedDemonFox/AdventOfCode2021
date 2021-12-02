const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("../data/day01.txt");

pub fn main() !void {
    var counterPart1: u64 = 0;
    var counterPart2: u64 = 0;

    var tempOrFirst:u64 = 0;
    const test_allocator = std.testing.allocator;
    var list = List(u64).init(test_allocator);
    var lines = tokenize(u8,data, "\r\n");

    while(lines.next()) |line| {
        var currentLine = parseInt(u64, line, 10) catch unreachable;
        list.append(currentLine) catch unreachable;
        if(tempOrFirst < currentLine){
            counterPart1 +=1;
        }
        tempOrFirst = currentLine;
    }

    var index: u32 = 0;
    while(index < list.items.len -3) :(index +=1){
        var a1Num : u64 = list.items[index];
        var a2b1Num :u64 = list.items[index+1];
        var a3b2Num:u64 = list.items[index+2];
        var b3Num: u64 = list.items[index+3];

        var partA :u64 = a1Num + a2b1Num + a3b2Num;
        var partB :u64 = a2b1Num + a3b2Num + b3Num;

        if(partA < partB){
            counterPart2 += 1;
        }
    }

    std.debug.print("Day 1 Part 1: {}\n", .{counterPart1-1});
    std.debug.print("Day 1 Part 2: {}\n", .{counterPart2});
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
