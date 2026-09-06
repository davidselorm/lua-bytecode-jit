local VM = {}
VM.__index = VM

function VM.new()
    return setmetatable({ registers = {}, pc = 1 }, VM)
end

function VM:exec(instruction)
    local op = instruction[1]
    if op == "LOAD" then
        self.registers[instruction[2]] = instruction[3]
    elseif op == "ADD" then
        self.registers[instruction[2]] = self.registers[instruction[3]] + self.registers[instruction[4]]
    end
end

return VM
