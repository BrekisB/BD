# Разработка базы данных для системы самообслуживания в ресторане быстрого питания
![Скриншот](https://github.com/user-attachments/assets/8ed22387-f4e5-4e29-a24c-b5b792816ba1)

## Типовые Запросы
**1. Вывести сотрдника, который получает больше всех в компании**
```sql
select name, salary from emploees
order by salary desc
limit 1;
```

**2. Уволить сотрудника с именем 'джон' с фамилей 'доу', и зарплатой 1**
```sql
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM emploees WHERE (name = 'джон' and surname = 'доу'
 and salary = 1) and id = 3;
SET FOREIGN_KEY_CHECKS = 1;
```

**3. Вывести ТОП-3 самых продоваенмых товаров**
```sql
select products_id, amount, new_value from accounting
where old_value = 'Заказ в процессе'
order by new_value desc
limit 3;
```

**4. Вывести товар у которого остался 1 день до просрочки**
```sql
select stock_id , quantity, was_order,expiration_date,dey_deleys
from expirations where dey_deleys <= 1 
order by dey_deleys asc;
```

**5. установка скидок**
```sql
update products 
set price = price * (1 - 20 / 100)
where id = 2;
select title, price from products 
where id = 2;
```

## Хранимые процедуры
1. Данная хранимая процедура выполняет оформление заказа,фиксируя пополненя на склад указанного количества товара конкретным сотрудником.
``` sql
call mydb.add_products(1, 1, 1);
```
2. Данная хранимая процедура выполняет оформление заказа,фиксируя продажу указанного количества товара конкретным сотрудником.
``` sql
call mydb.procces_sales(1, 1, 1);
```
3. Данная хранимая процедура удалет просроченый товар.
``` sql
call mydb.artem_wolf();
```
4. Данная хранимая процедура выдает скидку на товар которому осталось 7 дней до просрочки.
``` sql
call mydb.discount_products();
```
## Тригер
**`'products_before_update'`** -  Триггер отслеживаюшый таблицу `products` на изменения цены и количество товаров, и записываюшый логи в `accounting`

## Функция
**`product_price`** - это функция отоброжает цену указанного товара по ID

## Представление
``` sql
SELECT * FROM mydb.last_sales;
```
Это представление показывает доход за текущий месяц.

## Роли

``` sql
-- 1. Создаём роли
CREATE ROLE IF NOT EXISTS 'full_access_role';
CREATE ROLE IF NOT EXISTS 'read_only_role';
 -- 2. Назначаем права
GRANT ALL PRIVILEGES ON *.* TO 'full_access_role' WITH GRANT OPTION;
GRANT SELECT ON *.* TO 'read_only_role';
 -- 3. Создаём пользователей
CREATE USER IF NOT EXISTS 'джон'@'localhost' IDENTIFIED BY'11111';
CREATE USER IF NOT EXISTS 'билли'@'localhost' IDENTIFIED BY '22222';
 -- 4. Назначаем роли
GRANT 'full_access_role' TO 'джон'@'localhost';
GRANT 'read_only_role' TO 'билли'@'localhost';
 -- 5. Активируем роли по умолчанию (важно!)
SET DEFAULT ROLE 'full_access_role' TO 'джон'@'localhost';
SET DEFAULT ROLE 'read_only_role' TO 'билли'@'localhost';
 -- 6. Применяем изменения
FLUSH PRIVILEGES;
```
**"Данный код настраивает роли доступа для сотрудников:
1)джон получает права администратора (полный доступ)
2)Билли получают права только на чтение
Это обеспечивает защиту базы данных от несанкционированных изменений."**
