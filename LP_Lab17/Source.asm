.586
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO : DWORD

.stack 4096

.const

.data
arr dword 3, 3, 2, 4, -10, 6, -11, 8, 20, 0
max dword ?
min dword ?

.code
getmin PROC parr: dword, count: dword
sub count, 1
mov ecx, count
mov esi, parr
mov eax, [esi]
add esi, 4
CYCLE:
	sub eax, [esi]
	js IS_NOTMIN
	jns IS_MIN
IS_NOTMIN:
	add eax, [esi]
	jmp BACK
IS_MIN:
	mov eax, [esi]
	jmp BACK
BACK:
	add esi, 4
	loop CYCLE
ret
getmin ENDP
main PROC
invoke getmin, offset arr, lengthof arr
mov min, eax
push 0
call ExitProcess
main ENDP
end main