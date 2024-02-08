SECTION .data
helloWorld DB "Hello, World!", 0x0d, 0x0a, 0

SECTION .text

GLOBAL main

main: 
    PUSH EBP
    MOV EBP, ESP

    MOV EAX, 0x04
    MOV EBX, 0x01

    MOV ECX, helloWorld
    MOV EDX, 0x0f
    INT 0x80

    MOV ESP, EBP
    POP EBP
    XOR EAX, EAX
    RET