local BranchOps = {}
function BranchOps.jmp(vm, target)
    vm.pc = target
end
function BranchOps.jz(vm, reg, target)
    if vm.registers[reg] == 0 then vm.pc = target end
end
return BranchOps
