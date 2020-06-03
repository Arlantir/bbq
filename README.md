# Гоу на шашлыки!

Приложение — организатор событий на **rails 6.0.2.1** и **ruby 2.6.5.**

В приложении реализовано загрузка файлов, аутентификация, авторизация, гемами devise, pundit, carrierwave
, фреймворком bootstrap, очередями worker resque, redis.

**Демо**

[https://megobbq.herokuapp.com/](https://megobbq.herokuapp.com/)

**Установка**
 
1. Скопировать/клонировать проект;
2. Установить и настроить базу данных (в проекте по умолчанию используется [PostgreSQL][1]);
3. Установить [Redis][2], [NodeJS][3], [Yarn][4];
 
**Настройка**
 
1. Установите все зависимости командой:

```
bundle install
```
2. Сделайте:
   
```
cp databese.yml.example databese.yml
```

3. Выполните команды:
 
```
rails db:create db:migrate
```

4. Сделайте:
   
```
cp .env.example .env
```
  
  И пропишите переменные окружения в .env файле:
```
MAPS_API_KEY="Ваш апи ключ"
FACEBOOK_ID="Ваш апи ключ"
FACEBOOK_SECRET="Ваш апи ключ"
VK_API_ID="Ваш апи ключ"
VK_API_SECRET="Ваш апи ключ"
``` 


5. Сделайте:
  
 ```
 cp Procfile.example Procfile
 ```

6. Запуск приложения:

```
foreman start
```

7. Запустите **redis** сервер и выполните команду в отдельном окне консоли: 

```
QUEUE=tubilinkz* bundle exec rake environment resque:work
```
 
8. В браузере перейти по адресу:

```
localhost:5000
```

**Продакшен**

Для выкатки в продакшен необходимо в файле `.env` добавить следующие настройки:

1. Для хранения картинок используется ***[AWS S3][5]***: 

```
S3_ACCESS_KEY="Ваш апи ключ"
S3_SECRET_KEY="Ваш апи ключ"
S3_BUCKET_NAME="Ваше имя приложения"
``` 

2. Для работы почты:

```
SENDGRID_USERNAME="Ваш юзернайм в Сенгрид"
SENDGRID_PASSWORD="Ваш пароль от Сенгрид"
``` 


 [1]: https://www.postgresql.org/
 [2]: https://redis.io/
 [3]: https://nodejs.org/en/
 [4]: https://yarnpkg.com/
 [5]: https://docs.aws.amazon.com/quickstarts/latest/s3backup/step-1-create-bucket.html