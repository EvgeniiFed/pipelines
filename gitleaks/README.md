# Обнаружение секретов в коде с помощью Gitleaks

Этот репозиторий содержит конфигурацию для GitLab CI и скрипт для поиска секретов и чувствительных данных в коде с использованием [Gitleaks](https://github.com/zricethezav/gitleaks).

## Описание

Решение предоставляет:
- Шаблон job для GitLab CI для сканирования секретов
- Генерацию отчета в формате JSON
- Человекочитаемы формат вывода результатов

## Компоненты

1. `.include_gitleaks_secret_detection` - конфигурация job для GitLab CI
2. `parse_gitleaks.sh` - bash-скрипт для парсинга JSON-отчета Gitleaks

## Использование

### Интеграция с GitLab CI

1. Подключите job в ваш `.gitlab-ci.yml`:
   ```yaml
   include:
     - remote: 'https://raw.githubusercontent.com/ваш-репозиторий/путь/к/.include_gitleaks_secret_detection'
2. Job выполняет:
 - Сканирование всего репозитория
 - Генерацию JSON-отчета
 - Преобразование в читаемый формат
 - Загрузку артефактов
