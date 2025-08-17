# Lottery API (Java + Spring Boot + SQLite)

## Запуск проекта
1. Требуется **Java 17+** и **Maven 3.8+**.
2. В корне проекта выполните:  
   ```bash
   mvn spring-boot:run
   ```
3. Приложение стартует на [http://localhost:8080](http://localhost:8080).  
4. База данных **lottery.db** создаётся автоматически. При старте выполняются `schema.sql` и `data.sql`, которые создают таблицы и наполняют тестовыми данными.

## Основные эндпоинты
### 1. Создать тираж
`POST /draws`  
Создаёт новый активный тираж. Разрешён только один активный тираж.  

Пример ответа:
```json
{
  "id": 2,
  "status": "ACTIVE",
  "winningNumbers": null,
  "createdAt": "2025-08-17T18:30:00Z",
  "closedAt": null
}
```

### 2. Купить билет
`POST /tickets`  
Тело запроса:
```json
{
  "numbers": [1, 2, 3, 4, 5],
  "drawId": 2
}
```
Пример ответа:
```json
{
  "id": 10,
  "drawId": 2,
  "numbers": [1, 2, 3, 4, 5],
  "createdAt": "2025-08-17T18:32:00Z"
}
```

### 3. Закрыть тираж
`POST /draws/{id}/close`  
Генерирует случайные 5 чисел, закрывает тираж и определяет победителей.  

Пример ответа:
```json
{
  "drawId": 2,
  "winningNumbers": [3, 7, 12, 22, 35],
  "winners": [10]
}
```

### 4. Результаты тиража
`GET /draws/{id}/results`  
Возвращает выигрышные числа и список всех билетов.  

Пример ответа:
```json
{
  "drawId": 2,
  "status": "CLOSED",
  "winningNumbers": [3, 7, 12, 22, 35],
  "tickets": [
    {"id": 10, "numbers": [1,2,3,4,5], "winner": false},
    {"id": 11, "numbers": [3,7,12,22,35], "winner": true}
  ],
  "winners": [11]
}
```

### 5. Проверка доступности
`GET /health`  
Пример ответа:
```json
{"status": "ok"}
```

## Примеры тестирования
- Файл **tests.http** содержит готовые запросы для VS Code / IntelliJ.
- Можно также протестировать через **Postman** или `curl`.

## Структура проекта
- `src/main/java/com/example/lottery` — исходный код (контроллер, сервис, репозитории, модели)
- `src/main/resources/schema.sql` — схема БД
- `src/main/resources/data.sql` — демо-данные
- `lottery.db` — SQLite база
- `tests.http` — примеры запросов
