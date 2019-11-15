.586
.model flat, stdcall
includelib kernel32.lib
.stack 4096

.const

.data

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

getmax PROC parr: dword, count: dword
	sub count, 1	
	mov ecx, count
	mov esi, parr
	mov eax, [esi]
	add esi, 4
CYCLE:
	sub eax, [esi]
	js IS_MAX
	jns IS_NOTMAX
IS_MAX:
	mov eax, [esi]
	jmp BACK
IS_NOTMAX:
	add eax, [esi]
	jmp BACK
BACK:
	add esi, 4
	loop CYCLE
	ret
	getmax ENDP
end