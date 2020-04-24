# Гоу на шашлыки!

Приложение — организатор событий на rails 6.0.2.1.

В приложении реализовано загрузка файлов, аутентификация, авторизация, гемами devise, pundit, carrierwave
, фреймворком bootstrap, очередями worker resque, redis.

**Демо**

[https://kuda-edem.com/](https://kuda-edem.com/)

**Установка**
 
1. Скопировать/клонировать проект;
2. Установить и настроить базу данных (в проекте по умолчанию используется [PostgreSQL][1]);
3. Установить [Redis][2], [NodeJS][3], [Yarn][4];
 
**Настройка**
 
1. Установите все зависимости командой:

```
bundle install
```

2. Перейдите в папку проекта и выполните команды:
 
```
rails db:create db:migrate
```

3. Сделайте:
   
```
cp .env.example .env
```
  
  И пропишите переменные окружения в .env файле:
```
MAILER_LOGIN="Ваш email"
MAILER_PASSWORD="Пароль от почты"
MAPS_API_KEY="Ваш апи ключ"
FACEBOOK_ID="Ваш апи ключ"
FACEBOOK_SECRET="Ваш апи ключ"
VK_API_ID="Ваш апи ключ"
VK_API_SECRET="Ваш апи ключ"
``` 


4. Сделайте:
  
 ```
 cp Procfile.example Procfile
 ```

5. Запустите приложени командой:

```
foreman start
```

6. Запустите **redis** сервер и выполните команду в отдельном окне консоли: 

```
QUEUE=tubilinkz* bundle exec rake environment resque:work
```
 
7. В браузере перейти по адресу:

```
localhost:5000
```

**Продакшен**

На продакшене для хранения картинок используется ***[AWS S3][5]***




 [1]: https://www.postgresql.org/
 [2]: https://redis.io/
 [3]: https://nodejs.org/en/
 [4]: https://yarnpkg.com/
 [5]: https://docs.aws.amazon.com/quickstarts/latest/s3backup/step-1-create-bucket.html