.text
	.global calc_word
	.type calc_word, @function

# rdi - указатель на строку
# rsi - указатель на начало массива
# eax - счетчик слов
# ebx - счетчик длины слова
# cl - символ, полученный из строки


# Процедура добавления слова
add_word:
	# Добавление длины слова в массив
	movl %ebx, (%rsi)
	addq $4, %rsi

	# Увеличение count words
	incl %eax
	# Обнуление len word
	xorl %ebx, %ebx

	ret


# Основная прога
calc_word:
	# подготовка данных
	movb (%rdi), %cl
	xorq %rax, %rax
	xorq %rbx, %rbx


main_calc_word:
	# Проверка на пробел
	cmpb $32, %cl
	je new_word

	# Проверка на конец строки
	cmpb $0, %cl
	je end_calc_word

	# Учитываем символ
	incl %ebx
	jmp next_symbol

# Провека наличия слова после пробела (вдруг несколько пробелов подряд)
new_word:
	cmpl $0, %ebx
	je next_symbol

	call add_word

# Получение следующего символа строки
next_symbol:
	incq %rdi
	movb (%rdi), %cl
	jmp main_calc_word

end_calc_word:
	# Проверка наличия слова в конце строки
	cmpl $0, %ebx
	je exit

	call add_word

# завершение проги
exit:
	# Кидаем 0 в массив для обозначения конца массива
	movl $0, (%rsi)

	ret


