;jacob webb
; This code shifts teh values in an array a specified number of times

.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
		
	input BYTE 1, 2, 3, 4, 5, 6, 7, 8
	output BYTE LENGTHOF input DUP(?) ;empty array of length input
	shift DWORD 5

.code
main proc
		;initialize all registers
		mov eax, 0
		mov ebx, 0
		mov ecx, 0
		mov edx, 0
		
		
		mov ecx, LENGTHOF input		; into ecx register
		sub ecx, shift				;lengthof input - shift
		inc ecx						; ecx + 1
		mov ebx, shift				; shift into ebx register
		
		
		L1:
		mov al, [input+(ebx-1)]		;ebx = shift, elements right before shift
		mov [output+(edx)], al		
		inc ebx						;increments ebc and edx registers
		inc edx
		LOOP L1
		
		
		mov ecx, shift				; sets ecx = shift
		dec ecx						; shift - 1
		mov ebx, 1
		
		
		L2:
		mov al, [input+(ebx-1)]		;ebx = shift, elements right before shift
		mov [output+(edx)], al
		inc ebx						;increments ebc and edx registers
		inc edx
		LOOP L2


		mov al, output[1]
		mov ah, output
		mov bl, output[LENGTHOF output-1]
		mov bh, output[LENGTHOF output-2]

		invoke ExitProcess, 0
main endp
end main