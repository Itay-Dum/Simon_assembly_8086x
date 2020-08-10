IDEAL
MODEL small
STACK 100h
DATASEG
array db 0,0,0,0,0,0,0
array2 db 0,0,0,0,0,0,0
wellcomemsg db 10,13,10,13,10,13,10,' ',' ',' ',  ' ' ,' ',' ',' ',  '  ' ,' ','   ',' ','Simon Game','$'
msg2 db  10,13,10,13,10,13,10,13,10,13,' ',' ',' ',  ' ' ,' ',' ',' ',  '' ,'press any key to continue','$'
ending db 10,13,10,13,10,13,10,10,13,13,10,' ',' ',' ',  ' ' ,'Game Over your final score is:','$'
x1 dw 60
y1 dw 30
msg3 db 10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,10,13,13,10,"            By Itay Dumay$"
msg db "game starts in:$"
clock equ es:6CH
startmessege db 'Game starts in:',' ',' ','$'
second1 db '3','$'
second2 db ' ',' ','2','$'
second3 db ' ',' ','1','$'
score db 0
secondcounter dw 1
testi db 1
mishtane dw 0
mishtane1 dw 1
mishtane2 dw 2
mishtane3 dw 3
mishtane4 dw 4
mishtane5 dw 5
popo dw ?
color db ?
pf db ?
pfi db ?
pointscounter db 0
lklk db 'points:','$'
new dw ?
rtrt db 10,13,10,13,10,13,10,13,10,13,'     press any key to play again','$'
scoremsg db'Score:$'
scorenum db '$'
scorenum1 db '0$'
scorenum2 db '0$'
pointer dw ?
; --------------------------
; Your variables here
; --------------------------
CODESEG
start:
	
; --------------------------
; Your code here
; --------------------------
	mov ax, @data
	mov ds, ax 
	call wellcome
	mov si,offset array
	mov di,offset array2
	call rando
exit:
	proc wellcome
	mov ax,13h
	int 10h
	mov dx,offset wellcomemsg
	mov ah,09h
	int 21h 
	mov dx,offset msg2
	mov ah,9
	int 21h
	mov dx,offset msg3
	mov ah,9
	int 21h
	; Wait for key press
	mov ah,00h
	int 16h
	ret
	endp wellcome

	
	proc squares
	
	mov [x1],60
	mov [y1],30
again6:	cmp [y1],100;square1
	je cont9
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,2
	mov ah,0ch
	int 10h
	inc [y1]
again7:cmp [x1],130
	je cont10
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,2
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again7
cont10:
	mov [x1],60
	jmp again6
	cont9:
	
	mov [x1],140
	mov [y1],30
	again21:cmp [y1],100;square2
	je cont22
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,14
	mov ah,0ch
	int 10h
	inc [y1]
again23:cmp [x1],210
	je cont24
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,14
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again23
cont24:
	mov [x1],140
	jmp again21
	cont22:
	
	mov [x1],60
	mov [y1],110
	again25:cmp [y1],180;square3
	je cont26
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,4
	mov ah,0ch
	int 10h
	inc [y1]
again27:cmp [x1],130
	je cont28
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,4
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again27
cont28:
	mov [x1],60
	jmp again25
	
	cont26:
	
	mov [x1],140
	mov [y1],110
	again29:cmp [y1],180;square4
	je cont30
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,9
	mov ah,0ch
	int 10h
	inc [y1]
again31:cmp [x1],210
	je cont32
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,9
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again31
cont32:
	mov [x1],140
	jmp again29
	
cont30:
	ret
	endp squares
	
	proc randomnumbers1
	RANDGEN1:         ; generate a rand no using the system time
RANDSTART1:
   MOV AH, 00h  ; interrupts to get system time        
   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

   mov  ax, dx
   xor  dx, dx
   mov  cx, 3    
   div  cx       ; here dx contains the remainder of the division - from 0 to 9

   add  dl, '0'  ; to ascii from '0' to '9'
   mov si,[mishtane]
   mov [si],dl
   
RET    
	endp randomnumbers1
	
	proc randomnumbers2
	RANDGEN2:         ; generate a rand no using the system time
RANDSTART2:
   MOV AH, 00h  ; interrupts to get system time        
   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

   mov  ax, dx
   xor  dx, dx
   mov  cx, 3    
   div  cx       ; here dx contains the remainder of the division - from 0 to 9

   add  dl, '0'  ; to ascii from '0' to '9'
   mov si,[mishtane1]
   mov [si],dl
RET    
	endp randomnumbers2
	
	proc randomnumbers3
	RANDGEN3:         ; generate a rand no using the system time
RANDSTART3:
   MOV AH, 00h  ; interrupts to get system time        
   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

   mov  ax, dx
   xor  dx, dx
   mov  cx, 4    
   div  cx       ; here dx contains the remainder of the division - from 0 to 9

   sub  dl, '0'  ; to ascii from '0' to '9'
	mov si,[mishtane2]
	mov [si],dl
RET    
	endp randomnumbers3
	
	
	proc randomnumbers4
	mov si,[mishtane1]
	mov al,[si]
	mov si,[mishtane3]
	mov [si],al
RET    
	endp randomnumbers4
	
	
	proc randomnumbers5
	mov si,[mishtane]
	mov al,[si]
	mov si,[mishtane4]
	mov [si],al
RET    
	endp randomnumbers5
	
	proc randomnumber6
	
   MOV AH, 00h  ; interrupts to get system time        
   INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

   mov  ax, dx
   xor  dx, dx
   mov  cx, 4    
   div  cx       ; here dx contains the remainder of the division - from 0 to 9

   sub  dl, '0'  ; to ascii from '0' to '9'
	mov si,[mishtane5]
	mov [si],dl
RET    
	endp randomnumber6
	
	
	proc mnm
	mov [popo],5
	call waitk
	call randomnumbers1
	mov [popo],7
	call waitk
	call randomnumbers2
	mov [popo],5
	call waitk
	call randomnumbers3
	mov [popo],7
	call waitk
	call randomnumbers4
	mov [popo],5
	call waitk
	call randomnumbers5
	mov [popo],2
	call waitk 
	call randomnumber6
	ret
	endp mnm
	
	

	
	proc waitk
	mov ax,40h
	mov es,ax
	mov ax,[clock]
firstick5:
	cmp ax,[clock]
	je firstick5
	;print start messege
	;count 10s
	mov cx,[popo];18x0.055s=1s
delayloop5:
	mov ax,[clock]
tick5:
	cmp ax,[clock]
	je tick5
	loop delayloop5
	;print end messege
	
	ret
	endp waitk
	
	
	
	proc callupperleftblacksquare
	mov [color],0
	
	call squares
	call waitonesec
	call upperleftblacksquare
	call waitonesec
	call squares
	ret
	endp callupperleftblacksquare
	
	proc callupperrightblacksquare
	mov [color],0
	
	call squares
	call waitonesec
	call upperrightblacksquare
	call waitonesec
	call squares
	ret
	endp callupperrightblacksquare
	
	proc callbottomleftblacksquare
	mov [color],0
	
	call squares
	call waitonesec
	call bottomleftblacksquare
	call waitonesec
	call squares
	ret
	endp callbottomleftblacksquare
	
	proc callbottomrightblacksquare
	mov [color],0
	call squares
	call waitonesec
	call bottomrightblacksquare
	call waitonesec
	call squares
	ret
	endp callbottomrightblacksquare
	
	
	

	proc upperleftblacksquare
	mov [x1],60
	mov [y1],30
again100:cmp [y1],100;square1
	je cont101
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color]
	mov ah,0ch
	int 10h
	inc [y1]
again102:cmp [x1],130
	je cont103
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color]
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again102
cont103:
	mov [x1],60
	jmp again100
	cont101:ret
	endp upperleftblacksquare
	
	proc upperrightblacksquare
	mov [x1],140
	mov [y1],30
	again105:cmp [y1],100;square2
	je cont106
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color];black
	mov ah,0ch
	int 10h
	inc [y1]
again107:cmp [x1],210
	je cont108
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color];black
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again107
cont108:
	mov [x1],140
	jmp again105
	cont106:ret
	endp upperrightblacksquare
	
	proc bottomleftblacksquare
	mov [x1],60
	mov [y1],110
	again106:cmp [y1],180;square3
	je cont107
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color]
	mov ah,0ch
	int 10h
	inc [y1]
again108:cmp [x1],130
	je cont109
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color];black
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again108
cont109:
	mov [x1],60
	jmp again106
	cont107:ret
	endp bottomleftblacksquare
	
	proc bottomrightblacksquare
	mov [x1],140
	mov [y1],110
	again110:cmp [y1],180;square4
	je cont111
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color];black
	mov ah,0ch
	int 10h
	inc [y1]
again112:cmp [x1],210
	je cont113
	mov bh,0h
	mov cx,[x1]
	mov dx,[y1]
	mov al,[color];black
	mov ah,0ch
	int 10h
	inc [x1]
	jmp again112
cont113:
	mov [x1],140
	jmp again110
	cont111:ret
	endp bottomrightblacksquare
	
	
	proc waitonesec
	mov ax,40h
	mov es,ax
	mov ax,[clock]
firstick20:
	cmp ax,[clock]
	je firstick20
	;print start messege
	;count 10s
	mov cx,9;18x0.055s=1s
delayloop19:
	mov ax,[clock]
tick80:
	cmp ax,[clock]
	je tick80
	loop delayloop19
	;print end messege
	ret
	endp waitonesec
	
	proc first
	mov si,[mishtane]
	mov al,'0'
	cmp [si],al
	;push [si]
	jne ll
	call callupperleftblacksquare
	mov bl,[si]
	;jmp next
	jmp l99
ll:
	mov al,'1'
	cmp [si],al
	;push [si]
	jne lr
	call callupperrightblacksquare
	;jmp next
	jmp l99
lr:
	mov al,'2'
	cmp [si],al
	;push [si]
	jne li
	call callbottomleftblacksquare
	;jmp next
	jmp l99
li:
	mov al,'3'
	mov [si],al
	;push [si]
	call callbottomrightblacksquare
	;jmp next
	jmp l99
l99:
	ret
	endp first
	
	proc first2
	mov si,[mishtane1]
	mov al,'0'
	cmp [si],al
	jne qq
	call callupperleftblacksquare
	jmp next4000
qq:
	mov al,'1'
	cmp [si],al
	jne qr
	call callupperrightblacksquare
	jmp next4000
qr:
	mov al,'2'
	cmp [si],al
	jne qi
	call callbottomleftblacksquare
	jmp next4000
qi:
	
	call callbottomrightblacksquare	
	jmp next4000
next4000:
	ret
	endp first2
	
	proc first3 
	mov si,[mishtane2]
	mov al,'0'
	cmp [si],al
	;push [si]
	jne az
	call callupperleftblacksquare
	mov bl,[si]
	jmp next900
az:
	mov al,'1'
	cmp [si],al
	;push [si]
	jne ac
	call callupperrightblacksquare
	jmp next900
ac:
	mov al,'2'
	cmp [si],al
	;push [si]
	jne au
	call callbottomleftblacksquare
	jmp next900
au:
	mov al,'3'
	mov [si],al
	;push [si]
	call callbottomrightblacksquare
	jmp next900
next900:
	ret
	endp first3
	
	proc first4
	mov si,[mishtane3]
	mov al,'0'
	cmp [si],al
	;push [si]
	jne ty
	call callupperleftblacksquare
	mov bl,[si]
	jmp next1600
ty:
	mov al,'1'
	cmp [si],al
	;push [si]
	jne tv
	call callupperrightblacksquare
	jmp next1600
tv:
	mov al,'2'
	cmp [si],al
	;push [si]
	jne tio
	call callbottomleftblacksquare
	jmp next1600
tio:
	mov al,'3'
	mov [si],al
	;push [si]
	call callbottomrightblacksquare
	jmp next1600
next1600:	
	ret
	endp first4
	
	proc first5
	mov si,[mishtane4]
	mov al,'0'
	cmp [si],al
	;push [si]
	jne r1
	call callupperleftblacksquare
	mov bl,[si]
	jmp next2500
r1:
	mov al,'1'
	cmp [si],al
	;push [si]
	jne r2
	call callupperrightblacksquare
	jmp next2500
r2:
	mov al,'2'
	cmp [si],al
	;push [si]
	jne r3
	call callbottomleftblacksquare
	jmp next2500
r3:
	mov al,'3'
	mov [si],al
	;push [si]
	call callbottomrightblacksquare
	jmp next2500
next2500:
	ret
	endp first5
	
	proc first6
	mov si,[mishtane5]
	mov al,'0'
	cmp [si],al
	;push [si]
	jne qwe1
	call callupperleftblacksquare
	mov bl,[si]
	jmp next2500qwe
qwe1:
	mov al,'1'
	cmp [si],al
	;push [si]
	jne qwe2
	call callupperrightblacksquare
	jmp next2500qwe
qwe2:
	mov al,'2'
	cmp [si],al
	;push [si]
	jne qwe3
	call callbottomleftblacksquare
	jmp next2500qwe
qwe3:
	mov al,'3'
	mov [si],al
	;push [si]
	call callbottomrightblacksquare
	jmp next2500qwe
next2500qwe:
	ret
	endp first6
	
	proc rando
	mov ax,13h
	int 10h
	call scoresys
	call mnm
	call first
	jmp next
next:
	mov [pointer],0
	call mouseforcalling
next20:
	call first
	jmp next30
next30:
	call first2
	jmp next40
next40:
	mov [pointer],0
	call mouseforcalling
next50:
	mov [pointer],1
	call mouseforcalling
next60:
	call first
	jmp next70
next70:
	call first2
	jmp next80
next80:
	call first3
	jmp next90
next90:	
	mov [pointer],0
	call mouseforcalling
next100:
	mov [pointer],1
	call mouseforcalling
next110:
	mov [pointer],2
	call mouseforcalling
next120:
	call first
	jmp next130
next130:
	call first2
	jmp next140
next140:
	call first3
	jmp next150
next150:
	call first4
	jmp next160

next160:
	mov [pointer],0
	call mouseforcalling
next170:
	mov [pointer], 1
	call mouseforcalling
next180:
	call mouse
	mov [pointer] ,2
	call mouseforcalling
next190:
	mov [pointer], 3
next200:
	call first
	jmp next210
next210:
	call first2
	jmp next220
next220:
	call first3
	jmp next230
next230:
	call first4
	jmp next240
next240:
	call first5
	jmp next250
next250:
	mov [pointer],0
	call mouseforcalling
next260:
	mov [pointer],1
	call mouseforcalling
next270:
	mov [pointer],2
	call mouseforcalling
next280:
	mov [pointer],3
	call mouseforcalling
next290:
	mov [pointer],4
	call mouseforcalling
next300:
	call first
	jmp next310
next310:
	call first2
	jmp next320
next320:
	call first3
	jmp next330
next330:
	call first4
	jmp next340
next340:
	call first5
	jmp next350
next350:
	call first6
	jmp next360
next360:
	mov [pointer],0
	call mouseforcalling
next370:
	mov [pointer],1
	call mouseforcalling
next380:
	mov [pointer],2
	call mouseforcalling
next390:
	mov [pointer],3
	call mouseforcalling
next400:
	mov [pointer],4
	call mouseforcalling
next410:
	mov [pointer],5
	call mouseforcalling
	call waitonesec
	jmp kkkp
kkkp:
	mov ax,13h
	int 10h
	mov dx,offset ending
	mov ah,09h
	int 21h
	mov dl,[scorenum1]
	mov ah,2
	int 21h
	mov dl,[scorenum2]
	mov ah,2
	int 21h
	mov dx,offset rtrt
	mov ah,09h
	int 21h
	mov [scorenum1],'0'
	mov [scorenum2],'0'
	; Wait for key press
	mov ah,00h
	int 16h
	jmp iii
iii:
	jmp start
	ret
	endp rando
	
	proc mouse 
	mov ax,01h;show mouse cursor
	int 33h
	call squares
waitformouseclick:
    mov ax,03h                ; wait for the user to press a button
    int 33h
    cmp bx,1
	jne waitformouseclick				;continue this loop until mouse button is pressed
square1:
	cmp cx,260			;square 1 cmp x
	jg square2
	cmp dx,100
	jg square2
	mov [pf],'0'
	jmp exitk
square2:
	cmp cx,280
	jl square3
	cmp dx,100
	jg square3
	mov [pf],'1'
	jmp exitk
square3:
	cmp cx,260
	jg square4
	cmp dx,110
	jl square4
	mov [pf],'2'
	jmp exitk
square4:
	mov [pf],'3'
	jmp exitk
exitk:
	ret
	endp mouse
	
	proc mouseforcalling
	call mouse
	call mouse
	mov si,[pointer]
	mov al,[si]
	cmp al,[pf]
	jne tqqui
	inc [pointscounter]
	call adscore
	call scoresys
	jmp endingmouse
tqqui:
	mov dl,'f'
	mov ah,2
	int 21h
	call kkkp
endingmouse:
	ret
	endp mouseforcalling
	
	
	
	
	
	proc scoresys
	mov dh, 0
	mov dl, 0
	mov ah, 02h
	int 10h
	mov dx, offset scoremsg
	mov ah, 9
	int 21h
	mov dx, offset scorenum

	mov ah, 9
	int 21h
	mov dx, offset scorenum1

	mov ah, 9
	int 21h
	mov dx, offset scorenum2

	mov ah, 9
	int 21h
	ret
	endp scoresys
	proc adscore
	mov dl, [scorenum]
	mov cl, [scorenum1]
	mov bl, [scorenum2]
	sub dl, '0'
	sub cl, '0'
	sub bl, '0'
	mov al, 0
	cmp bl, 9
	jne cont53
	mov bl, 0
	inc cl
	mov al, 1
cont53:
	cmp cl, 9
	jne cont54
	mov cl, 0
	inc dl
	
	jmp cont55
cont54:
	cmp al, 1
	je cont55
	inc bl
cont55:
	
	add bl, '0'
	add cl, '0'
	add dl, '0'
	mov [scorenum2], bl
	mov [scorenum1], cl
	mov [scorenum], dl
	
	ret
	endp adscore
	
	mov ax, 4c00h
	int 21h
END start