	.org 0000h        ; Primero establecí el origen de la dirección en 0000h
	ld b,37           ; Cargo el valor 37 en el registro B
	ld c,0            ; Cargo el valor 0 en el registro C (inicialización)
	ld a,b            ; Cargo el valor de B (37) en el acumulador A

	cp 0              ; Comparo A con 0
	jr Z, ultimo      ; Si A es igual a 0, se salta a la etiqueta 'ultimo'
	cp 1              ; Comparo A con 1
	jr Z, ultimo      ; Si A es igual a 1, se salta a la etiqueta 'ultimo'

	ld d,1            ; Carga el valor 1 en el registro D
	ld e,1            ; Carga el valor 1 en el registro E

ciclo:            ; Comienzo del ciclo

	ld a,b            ; Carga el valor de B (37) en A
	cp d              ; Compara A con D
	jr c, ultimo_1    ; Si A es menor que D, salta a 'ultimo_1'
	inc e             ; Incrementa el valor de E (E = E + 1)
	ld h,0            ; Carga el valor 0 en el registro H
	ld l,0            ; Carga el valor 0 en el registro L

multiplicacion:   ; Inicio de la rutina de multiplicación

	ld a,l            ; Carga el valor de L en A
	add a,e           ; Suma el valor de E al acumulador A
	ld l,a            ; Guarda el resultado de A en L
	inc h             ; Incrementa H (H = H + 1)
	ld a,e            ; Carga el valor de E en A
	cp h              ; Compara A con H
	jr nz, multiplicacion ; Si A no es igual a H, repite la multiplicación
	ld d,l            ; Guarda el resultado final en D
	jr ciclo          ; Vuelve al ciclo principal

ultimo:           ; Etiqueta para cuando A es 0 o 1

	ld c,a            ; Guarda el valor de A en C
	jr convertir      ; Salta a la rutina de conversión

ultimo_1:         ; Etiqueta para cuando A es menor que D

	dec e             ; Decrementa el valor de E
	ld c,e            ; Guarda el valor de E en C
	jr convertir      ; Salta a la rutina de conversión

convertir:        ; Rutina que es para convertir el número en decimal a formato de dígitos

	ld a,b            ; Carga el valor de B en A
	ld l,0            ; Inicializa L en 0


loop:             ; Inicio del bucle de conversión

	cp 10             ; Compara A con 10
	jr c, done        ; Si A < 10, salta a 'done'
	sub 10            ; Resta 10 de A
	inc l             ; Incrementa L (contando cuántas veces se resta 10)
	jr loop           ; Repite el bucle

done:             ; Etiqueta cuando el valor de A es menor que 10

	sla l             ; Desplaza L a la izquierda 4 veces (multiplicando por 16)
	sla l
	sla l
	sla l
	or l              ; Combina L con A
	ld B,A            ; Guarda el resultado final en B
	halt              ; Detengo la ejecución del programa

	.end              ; Fin del programa
