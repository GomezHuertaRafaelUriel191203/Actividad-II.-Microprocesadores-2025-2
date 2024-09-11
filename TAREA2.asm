	.org 0000h
	ld b,77
	ld c,0
	ld a,b

	cp 0
	jr Z, ultimo
	cp 1
	jr Z, ultimo

	ld d,1
	ld e,1
ciclo:
	ld a,b
	cp d
	jr c, ultimo_1
	inc e
	ld h,0
	ld l,0
multiplicacion:
	ld a,l
	add a,e
	ld l,a
	inc h
	ld a,e
	cp h
	jr nz, multiplicacion
	ld d,l
	jr ciclo

ultimo:
	ld c,a
	jr convertir

ultimo_1:
	dec e
	ld c,e
	jr convertir


convertir:
	ld a,b
	ld l,0
loop:
	cp 10
	jr c, done
	sub 10
	inc l
	jr loop
done:
	sla l
	sla l
	sla l
	sla l
	or l
	ld B,A
	halt

	.end



