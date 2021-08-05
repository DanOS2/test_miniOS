@echo off
echo Build HoneyOS v0001
fasm src/kernel.asm
fasm src/boot.asm os.bin
echo Done
pause