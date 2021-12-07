const std = @import("std");

const data = @embedFile("../data/day06.txt");

pub fn main() !void {
    
    var lines = tokenize(u8,data, "\r\n");
    var fishCycle = [9]u64 {0,0,0,0,0,0,0,0,0};
    while(lines.next()) |line|{
        var tokenized = tokenize(u8, line, ",");
        while(tokenized.next()) |splitted|{
            var numParsed = try parseInt(u64,splitted,10);
            fishCycle[numParsed] += 1;
        }
    }

    var daysPassed: u64= 0;
    while(daysPassed < 80) : (daysPassed+=1){
        var fish0:u64 = fishCycle[0];
        fishCycle[0] = fishCycle[1];
        fishCycle[1] = fishCycle[2];
        fishCycle[2] = fishCycle[3];
        fishCycle[3] = fishCycle[4];
        fishCycle[4] = fishCycle[5];
        fishCycle[5] = fishCycle[6];
        fishCycle[6] = fishCycle[7]+fish0;
        fishCycle[7] = fishCycle[8];
        fishCycle[8] = fish0;
    }

    print("Day 6 Part 1: {} \n", .{countFish(fishCycle)});

    while(daysPassed < 256) :(daysPassed+=1){
        var fish0:u64 = fishCycle[0];
        fishCycle[0] = fishCycle[1];
        fishCycle[1] = fishCycle[2];
        fishCycle[2] = fishCycle[3];
        fishCycle[3] = fishCycle[4];
        fishCycle[4] = fishCycle[5];
        fishCycle[5] = fishCycle[6];
        fishCycle[6] = fishCycle[7]+fish0;
        fishCycle[7] = fishCycle[8];
        fishCycle[8] = fish0;
    }

    print("Day 6 Part 2: {} \n", .{countFish(fishCycle)});
}

fn  countFish (cyclesDone: [9]u64 ) u64{
    var count:u64 = 0;
    for(cyclesDone) |fish|{
        count += fish;
    }
    return count;
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;

const parseInt = std.fmt.parseInt;
const print = std.debug.print;