#!/bin/bash

if [ -z "$1" ]; then
  echo " Укажите имя файла в аргументе командной строки"
  exit 1
fi
FILE="$1"
add_entry() {
  read -p "Введите дату: " date
  read -p "Введите категорию: " category
  read -p "Введите сумму: " amount
  read -p "Введите описание: " description

  echo "$date | $category | $amount | $description" >> "$FILE"
  echo "Запись добавлена"
}

# Функция для просмотра всех записей
view_entries() {
  if [ -f "$FILE" ]; then
    echo "Список расходов:"
    cat "$FILE"
  else
    echo "Файл не найден или не существует"
  fi
}

while true; do
  echo "Выберите действие:"
  echo "1) Добавить запись"
  echo "2) Просмотреть записи"
  echo "3) Выйти"

  read -p "Ваш выбор: " choice

  case $choice in
    1)
      add_entry
      ;;
    2)
      view_entries
      ;;
    3)
      echo "Выход из программы"
      exit 0
      ;;
    *)
      echo "Неверный выбор"
      ;;
  esac
done
