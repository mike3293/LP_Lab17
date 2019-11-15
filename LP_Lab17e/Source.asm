.586
.model flat, stdcall
includelib kernel32.lib
ExitProcess PROTO : DWORD

includelib libucrt.lib

EXTERN getmin :proc
EXTERN getmax :proc

SetConsoleTitleA PROTO : DWORD
GetStdHandle PROTO : DWORD
WriteConsoleA PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD
.stack 4096

.const
	consoletitle byte ' LP_Lab17', 0
	text byte 'getmax - getmin =', 0

.data
	consolehandle dword ?
	arr dword 10, 1, 2, 3, 4, 5, 6, 8, 15, 1
	strtoconsole byte 255 dup(0)
	max dword ?
	min dword ?
	result dword ?

.code
int_to_char proc uses eax ebx ecx edi esi, pstr: dword, intfield: dword        
    mov edi,pstr            
    mov esi,0               
    cdq                     
    mov ebx,10              
    idiv ebx                
    test eax,80000000h      
    jz plus                 
    neg eax                 
    neg edx                 
    mov cl, '-'             
    mov [edi],cl            
    inc edi                 
plus:
    push dx                 
    inc esi                 
    test eax, eax           
    jz fin                  
    cdq                     
    idiv ebx                
    jmp plus
fin:
    mov ecx, esi            
write:                      
    pop bx                  
    add bl,'0'              
    mov [edi],bl            
    inc edi                 
    loop write              

	pop eax;
	ret 2
	push eax

    ret
int_to_char ENDP

main PROC
	push lengthof arr
	push offset arr
	call getmin
	mov min, eax

	push lengthof arr
	push offset arr
	call getmax
	mov max, eax

	invoke SetConsoleTitleA, offset consoletitle
	invoke GetStdHandle, -11
	mov consolehandle, eax
	invoke WriteConsoleA, consolehandle, offset text, sizeof text, 0, 0
	mov eax, max
	sub eax, min
	mov result, eax
	push  result
	push offset strtoconsole        
	call int_to_char          
	invoke WriteConsoleA, consolehandle, offset strtoconsole, sizeof strtoconsole, 0, 0
	push 0
	call ExitProcess
main ENDP
end main