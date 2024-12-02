Example of doing a basic comptime-based interface. Don't need to do the tagged
union approach, or the vtable stuff, which add a little runtime weight of some
kind.

Was pretty excited to see this kind of approach used in tigerbeetle. A negative
to me is that the comptime type `Shapable` doesn't have any LSP information. So
I can just call `.area()` on that comptime type, and I'll only know if that's
an issue if the compiler fails. ZLS has a certain config to setup a compilation
check on save, so it'll alert me to that situation. But still, in other systems
like Rust, you get to define that contract in a trait, and any users of the
trait know what they're getting into. But here you don't really have that info
with the `Sharable` comptime function type parameter. You'd need to read the
code to see what methods/properties are used on that type to know what the
contract is. I suppose I could do asserts in the `ShapeT` function, to document
what `Shapable` type requires, but still no LSP info.
