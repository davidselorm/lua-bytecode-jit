# lua-bytecode-jit

Register-based bytecode virtual machine interpreter and hot loop trace profiler in Lua.

## Instruction Set
- `LOADK`: Load immediate scalar constant into target register.
- `ADD` / `SUB`: Register-to-register arithmetic.
- `JMP`: Direct program counter branching with loop frequency instrumentation.
