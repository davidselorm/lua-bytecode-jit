local VM = require("vm")

local vm = VM.new()
local bytecode = {
    {"LOADK", 1, 10},   -- R[1] = 10
    {"LOADK", 2, 20},   -- R[2] = 20
    {"ADD",   3, 1, 2}, -- R[3] = R[1] + R[2]
    {"HALT"}
}

local regs = vm:execute(bytecode)
print("[PASS] Lua Bytecode VM executed program. Result in R[3] = " .. tostring(regs[3]))
