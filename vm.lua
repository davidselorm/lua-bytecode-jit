-- Bytecode Virtual Machine Engine in Lua
local VM = {}
VM.__index = VM

function VM.new()
    return setmetatable({
        registers = {},
        pc = 1,
        hot_counts = {}
    }, VM)
end

function VM:execute(instructions)
    while self.pc <= #instructions do
        local inst = instructions[self.pc]
        local op = inst[1]

        -- Trace hot instruction loop counting
        self.hot_counts[self.pc] = (self.hot_counts[self.pc] or 0) + 1

        if op == "LOADK" then
            self.registers[inst[2]] = inst[3]
        elseif op == "ADD" then
            self.registers[inst[2]] = self.registers[inst[3]] + self.registers[inst[4]]
        elseif op == "SUB" then
            self.registers[inst[2]] = self.registers[inst[3]] - self.registers[inst[4]]
        elseif op == "JMP" then
            self.pc = inst[2] - 1
        elseif op == "HALT" then
            break
        end
        self.pc = self.pc + 1
    end
    return self.registers
end

return VM
