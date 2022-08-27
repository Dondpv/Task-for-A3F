# Task-for-A3F
1. Спроектировать структуру таблиц(ы) для хранения Контактов, которые могут иметь друзей из этого же списка Контактов (в рамках задачи достаточно хранить только Имя Контакта). Если Контакт 2 является другом Контакта 1, это не означает, что Контакт 1 является другом Контакта 2.
1.1. Написать запрос sql, отображающий список Контактов, имеющих больше 5 друзей.
1.2. Написать запрос sql, отображающий все пары Контактов, которые дружат друг с другом. Исключить дубликаты.
(задача на sql запросы, использование PHP запрещено).


2.  Имеется массив числовых значений, например, [4, 5, 8, 9, 1, 7, 2]. В распоряжении есть функция array_swap(&$arr, $num) { … } которая меняет местами элемент на позиции $num и элемент на 0 позиции. Т.е. при выполнении array_swap([3, 6, 2], 2) на выходе получим [2, 6, 3].
Написать код, сортирующий произвольный массив по возрастанию, используя только функцию array_swap.


3. Написать на PHP парсер html страницы (на входе url), который на выходе будет отображать количество и название всех используемых html тегов. Использование готовых парсеров и библиотек запрещено, включая модуль DOM.
(обязательно использование ООП подхода, демонстрирующее основные принципы структурирования и взаимодействия объектов
не нужно придерживаться принципа KISS, приветствуется преувеличение уровня абстракции)
Основная цель задания ”3” не получить верный ответ, а продемонстрировать какие либо навыки организации кода с использованием ООП. Допускаются предположения не описанные в задаче, оверкодинг.
