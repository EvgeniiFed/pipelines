#!/bin/bash

# Путь к JSON-файлу с результатами сканирования Gitleaks
REPORT_FILE="gitleaks-report.json"

# Проверка наличия файла отчета
if [[ ! -f "$REPORT_FILE" ]]; then
  echo "Отчет Gitleaks не найден: $REPORT_FILE"
  exit 1
fi

# Проверка, пуст ли отчет
if [[ ! -s "$REPORT_FILE" ]]; then
  echo "Отчет Gitleaks пуст. Чувствительные данные не обнаружены."
  exit 0
fi

# Парсинг JSON и вывод в табличном формате
echo "Результаты сканирования Gitleaks:"
echo "---------------------------------"

# Используем jq для обработки JSON
jq -r '
  .[] | 
  "Описание: \(.Description)\n" +
  "Найденные данные: \(.Match)\n" +
  "Файл: \(.File)\n" +
  "Строка: \(.StartLine)\n" +
  "---------------------------------"
' "$REPORT_FILE"
