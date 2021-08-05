use16
org 0x7C00	;Адрес загрузки
BootLoader:

cli		; Запрещаем прерывания
xor ax, ax	; Очищаем регистр ax
mov ds, ax	; Устанавливаем сегмент данных на нулевой адрес
mov es, ax	; Устанавливаем сегмент es на нулевой адрес
mov ss, ax	; Устанавливаем сегмент стека на нулевой адрес
mov sp, 07c00h	; Устанавливаем сегмент sp на текущию вершину стека
sti		; Разрешаем прерывания

;Очистка экрана
mov al, 0002h
int 10h

file 'kernel.bin' ; загрузка ядра

times(512-2-($-07c00h)) db 0	; Заполняем пустоты нулями
db 055h, 0AAh			; Устанавливаем сигнатуру загрузочного сектора