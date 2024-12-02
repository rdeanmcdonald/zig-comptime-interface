const std = @import("std");

fn ShapeT(comptime Shapable: type) type {
    return struct {
        const Shape = @This();

        s: Shapable,

        fn init(s: Shapable) Shape {
            return Shape{
                .s = s,
            };
        }
        fn area(self: Shape) u64 {
            return self.s.area();
        }
    };
}

const Circle = struct {
    r: u64,

    fn area(self: Circle) u64 {
        return self.r * self.r;
    }
};

const Square = struct {
    w: u64,
    h: u64,

    fn area(self: Square) u64 {
        return self.w * self.h;
    }
};

pub fn main() !void {
    const circle = Circle{ .r = 2 };
    const square = Square{ .w = 3, .h = 2 };
    const CircleShape = ShapeT(Circle).init(circle);
    const SquareShape = ShapeT(Square).init(square);

    std.debug.print("Circle Area {d}\n", .{CircleShape.area()});
    std.debug.print("Square Area {d}\n", .{SquareShape.area()});
}
