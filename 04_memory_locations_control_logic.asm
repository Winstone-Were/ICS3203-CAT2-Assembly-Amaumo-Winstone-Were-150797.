section .data
    sensor_value db 20     ; Simulated sensor reading, e.g., 60 (High water level)
    motor_status db 0      ; 0 - motor OFF, 1 - motor ON
    alarm_status db 0      ; 0 - no alarm, 1 - alarm triggered

section .text
    global _start

_start:
    ; Read sensor value (simulated in data section)
    mov al, [sensor_value]

    ; Compare the sensor value and take action
    cmp al, 50
    jg trigger_alarm        ; If sensor value > 50, trigger alarm

    cmp al, 30
    jge stop_motor          ; If sensor value >= 30, stop motor

    ; If sensor value < 30, turn motor ON
    mov byte [motor_status], 1
    jmp done

trigger_alarm:
    ; Trigger alarm if sensor value is high
    mov byte [alarm_status], 1
    jmp done

stop_motor:
    ; Stop motor if sensor value is moderate
    mov byte [motor_status], 0

done:
    ; Save the motor status in another register (to avoid overwriting al)
    mov bl, [motor_status]
    ; Print "Motor Status: ON/OFF"
    call print_motor_status

    ; Save the alarm status in another register
    mov bl, [alarm_status]
    ; Print "Alarm Status: Triggered/Not Triggered"
    call print_alarm_status

    ; Exit program
    mov eax, 1        ; exit system call
    xor ebx, ebx      ; status 0
    int 0x80

; Print motor status (ON/OFF)
print_motor_status:
    cmp bl, 1
    je motor_on
    ; If motor is OFF
    mov eax, 4
    mov ebx, 1
    mov ecx, motor_off_message
    mov edx, 20
    int 0x80
    ret

motor_on:
    ; If motor is ON
    mov eax, 4
    mov ebx, 1
    mov ecx, motor_on_message
    mov edx, 20
    int 0x80
    ret

; Print alarm status (Triggered/Not Triggered)
print_alarm_status:
    cmp bl, 1
    je alarm_triggered
    ; If alarm is not triggered
    mov eax, 4
    mov ebx, 1
    mov ecx, alarm_not_triggered_message
    mov edx, 30
    int 0x80
    ret

alarm_triggered:
    ; If alarm is triggered
    mov eax, 4
    mov ebx, 1
    mov ecx, alarm_triggered_message
    mov edx, 30
    int 0x80
    ret

section .data
    motor_on_message db 'Motor Status: ON', 0xA
    motor_off_message db 'Motor Status: OFF', 0xA
    alarm_triggered_message db 'Alarm Status: Triggered', 0xA
    alarm_not_triggered_message db 'Alarm Status: Not Triggered', 0xA
