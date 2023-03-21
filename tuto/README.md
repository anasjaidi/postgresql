# Getting started

### What is PostgreSQL
PostgreSQL is an advanced, enterprise-class, and open-source relational database system.
PostgreSQL supports both SQL (relational) and JSON (non-relational) querying.

PostgreSQL is a highly stable database backed by more than 20 years of development by the open-source community.

# Querying Data

## SELECT
One of the most common tasks, when you work with the database, is to query data from tables by using the `SELECT` statement.

The `SELECT` statement is one of the most complex statements in PostgreSQL. It has many clauses that you can use to form a flexible query.

The `SELECT` statement has the following clauses:

1. Select distinct rows using `DISTINCT` operator.
2. Sort rows using `ORDER BY` clause.
3. Filter rows using `WHERE` clause.
4. Select a subset of rows from a table using `LIMIT` or `FETCH` clause.
5. Group rows into groups using `GROUP BY` clause.
6. Filter groups using `HAVING` clause.
7. Join with other tables using joins such as `INNER JOIN`, `LEFT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN` clauses.
8. Perform set operations using `UNION`, `INTERSECT`, and `EXCEPT`.
9. In this tutorial, you are going to focus on the `SELECT` and `FROM` clauses.

### PostgreSQL SELECT statement syntax

Let’s start with the basic form of the `SELECT` statement that retrieves data from a single table.

The following illustrates the syntax of the `SELECT` statement:

```postgresql
    SELECT
        select_list
    FROM
        table_name;
```

Let’s examine the `SELECT` statement in more detail:

* First, specify a select list that can be a column or a list of columns in a table from which you want to retrieve data. If you specify a list of columns, you need to place a comma (,) between two columns to separate them. If you want to select data from all the columns of the table, you can use an asterisk (*) shorthand instead of specifying all the column names. The select list may also contain expressions or literal values.
* Second, specify the name of the table from which you want to query data after the FROM keyword.

### PostgreSQL SELECT examples

Let’s take a look at some examples of using PostgreSQL `SELECT` statement.

We will use the following `customer` table.

![CUSTOMER TABLE](./images/customer.png)

#### 1) Using PostgreSQL SELECT statement to query data from one column example

This example uses the `SELECT` statement to find the first names of all customers from the customer table:

```postgresql
SELECT first_name FROM customer;
```
Here is the partial output:

![Results](./images/PostgreSQL-Select-Select-a-single-column.png)

**SEMICOLON**

Notice that we added a semicolon (;) at the end of the SELECT statement. The semicolon is not a part of the SQL statement. It is used to signal PostgreSQL the end of an SQL statement. The semicolon is also used to separate two SQL statements.

#### 2) Using PostgreSQL SELECT statement to query data from multiple columns example

Suppose you just want to know the first name, last name and email of customers, you can specify these column names in the `SELECT` clause as shown in the following query:

```postgresql
SELECT
   first_name,
   last_name,
   email
FROM
   customer;
```

![results](images/PostgreSQL-Select-Select-multiple-columns.png)

#### 3) Using PostgreSQL SELECT statement to query data from all columns of a table example

The following query uses the `SELECT` statement to select data from all columns of the customer table:

```postgresql
SELECT * FROM customer;
```

![results](images/PostgreSQL-Select-Select-all-columns.png)

In this example, we used an asterisk (*) in the SELECT clause, which is a shorthand for all columns. Instead of listing all columns in the SELECT clause, we just used the asterisk (*) to save some typing.


## Column Alias

A column alias allows you to assign a column or an expression in the select list of a SELECT statement a temporary name. The column alias exists temporarily during the execution of the query.

The following illustrates the syntax of using a column alias:

```postgresql
SELECT column_name AS alias_name
FROM table_name;
```

In this syntax, the `column_name` is assigned an alias `alias_name`. The `AS` keyword is optional so you can omit it like this:

```postgresql
SELECT column_name alias_name
FROM table_name;
```

The following syntax illustrates how to set an alias for an expression in the SELECT clause:

```postgresql
SELECT expression AS alias_name
FROM table_name;
```

The main purpose of column aliases is to make the headings of the output of a query more meaningful.

### column alias examples

#### 1) Assigning a column alias to a column example

The following query returns the first names and last names of all customers from the customer table:

```postgresql
SELECT 
   first_name, 
   last_name
FROM customer;
```
![Res](images/PostgreSQL-Column-Alias-example-1.png)

If you want to rename the `last_name` heading, you can assign it a new name using a column alias like this:

```postgresql
SELECT 
   first_name, 
   last_name AS surname
FROM customer;
```

This query assigned the `surname` as the alias of the `last_name` column:
![res](images/PostgreSQL-Column-Alias-Surname-example-1.png)

Or you can make it shorter by removing the `AS` keyword as follows:

```postgresql
SELECT 
   first_name, 
   last_name surname
FROM customer;
```

#### 2) Assigning a column alias to an expression example

The following query returns the full names of all customers. It constructs the full name by concatenating the first name, space, and the last name:

```postgresql
SELECT 
   first_name || ' ' || last_name 
FROM 
   customer;
```

Note that in PostgreSQL, you use the `||` as the concatenating operator that concatenates one or more strings into a single string.

![res](images/PostgreSQL-Alias-Example.png)

As you can see clearly from the output, the heading of the column is not meaningful `?column?` .

To fix this, you can assign the expression `first_name || ' ' || last_name` a column alias e.g., `full_name`:

```postgresql
SELECT
    first_name || ' ' || last_name AS full_name
FROM
    customer;
```
![res](images/PostgreSQL-Alias-column-alias-example.png)

#### 3) Column aliases that contain spaces

If a column alias contains one or more spaces, you need to surround it with double quotes like this:

```postgresql
column_name AS "column alias"
```

```postgresql
SELECT
    first_name || ' ' || last_name "full name"
FROM
    customer;
```
![](images/PostgreSQL-Column-Alias-with-space.png)

## ORDER BY

When you query data from a table, the `SELECT` statement returns rows in an unspecified order. To sort the rows of the result set, you use the `ORDER BY` clause in the `SELECT` statement.

The `ORDER BY `clause allows you to sort rows returned by a `SELECT` clause in `ascending` or `descending` order based on a sort expression.

The following illustrates the syntax of the ORDER BY clause:

```postgresql
SELECT
	select_list
FROM
	table_name
ORDER BY
	sort_expression1 [ASC | DESC],
        ...
	sort_expressionN [ASC | DESC];
```

In this syntax:

* First, specify a sort expression, which can be a column or an expression, that you want to sort after the `ORDER BY` keywords. If you want to sort the result set based on multiple columns or expressions, you need to place a comma (`,`) between two columns or expressions to separate them.
* Second, you use the ASC option to sort rows in ascending order and the DESC option to sort rows in descending order. If you omit the ASC or DESC option, the ORDER BY uses ASC by default.

PostgreSQL evaluates the clauses in the `SELECT` statment in the following order: `FROM`, `SELECT`, and `ORDER BY`:

![](images/PostgreSQL-ORDER-BY.png)

### PostgreSQL ORDER BY examples

#### 1) Using PostgreSQL ORDER BY clause to sort rows by one column

The following query uses the `ORDER BY` clause to sort customers by their first names in ascending order:

```postgresql
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC;
```
![](images/PostgreSQL-ORDER-BY-one-column-example.png)

Since the `ASC` option is the default, you can omit it in the `ORDER BY` clause like this:

```postgresql
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name;
```

#### 2) Using PostgreSQL ORDER BY clause to sort rows by one column in descending order

The following statement selects the first name and last name from the `customer` table and sorts the rows by values in the last name column in descending order:

```postgresql
SELECT
       first_name,
       last_name
FROM
       customer
ORDER BY
       last_name DESC;
```

![](images/PostgreSQL-ORDER-BY-one-column-desc-example.png)

#### 3) Using PostgreSQL ORDER BY clause to sort rows by multiple columns


The following statement selects the first name and last name from the customer table and sorts the rows by the first name in ascending order and last name in descending order:

```postgresql
SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;
```

![](images/PostgreSQL-ORDER-BY-multiple-columns.png)

In this example, the `ORDER BY` clause sorts rows by values in the first name column first. And then it sorts the sorted rows by values in the last name column.

As you can see clearly from the output, two customers with the same first name `Kelly` have the last name sorted in descending order.

#### 4) Using PostgreSQL ORDER BY clause to sort rows by expressions


The `LENGTH()` function accepts a string and returns the length of that string.

The following statement selects the first names and their lengths. It sorts the rows by the lengths of the first names:

```postgresql
SELECT 
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY 
	len DESC;
```

![](images/PostgreSQL-ORDER-BY-expressions.png)

Because the `ORDER BY` clause is evaluated after the `SELECT` clause, the column alias len is available and can be used in the `ORDER BY` clause.


#### PostgreSQL ORDER BY clause and NULL

In the database world, `NULL` is a marker that indicates the missing data or the data is unknown at the time of recording.

When you sort rows that contains `NULL`, you can specify the order of `NULL` with other non-null values by using the `NULLS FIRST` or `NULLS LAST` option of the ORDER BY clause:

```postgresql
ORDER BY sort_expresssion [ASC | DESC] [NULLS FIRST | NULLS LAST]
```
```postgresql
SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;
```

## SELECT DISTINCT

The `DISTINCT` clause is used in the `SELECT` statement to remove duplicate rows from a result set. The `DISTINCT` clause keeps one row for each group of duplicates. The `DISTINCT` clause can be applied to one or more columns in the select list of the `SELECT` statement.

The following illustrates the syntax of the `DISTINCT` clause:

```postgresql
SELECT
   DISTINCT column1
FROM
   table_name;
```

In this statement, the values in the `column1` column are used to evaluate the duplicate.

If you specify multiple columns, the `DISTINCT` clause will evaluate the duplicate based on the combination of values of these columns.

```postgresql
SELECT
   DISTINCT column1, column2
FROM
   table_name;
```

In this case, the combination of values in both `column1` and `column2` columns will be used for evaluating the duplicate.

PostgreSQL also provides the `DISTINCT ON (expression)` to keep the “first” row of each group of duplicates using the following syntax:

```postgresql
SELECT
   DISTINCT ON (column1) column_alias,
   column2
FROM
   table_name
ORDER BY
   column1,
   column2;
```

The order of rows returned from the `SELECT` statement is unspecified therefore the “first” row of each group of the duplicate is also unspecified.

It is a good practice to always use the `ORDER BY `clause with the `DISTINCT ON(expression)` to make the result set predictable.

Notice that the `DISTINCT ON` expression must match the leftmost expression in the ORDER BY clause.

### PostgreSQL SELECT DISTINCT examples

Let’s create a new table called distinct_demo and insert data into it for practicing the `DISTINCT` clause.

First, use the following `CREATE TABLE` statement to create the `distinct_demo` table that consists of three columns: `id`, `bcolorand` `fcolor`.

```postgresql
CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);
```
Second, insert some rows into the `distinct_demo` table using the following `INSERT` statement:

```postgresql
INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
```

Third, query the data from the `distinct_demo` table using the `SELECT` statement:

```postgresql
SELECT
	id,
	bcolor,
	fcolor
FROM
	distinct_demo ;
```
![](images/PostgreSQL-Distinct-Sample-Table.png)

#### 1) PostgreSQL DISTINCT one column example

The following statement selects unique values in the  `bcolor` column from the `t1` table and sorts the result set in alphabetical order by using the `ORDER BY` clause.

![](images/PostgreSQL-Distinct-select-distinct-one-column.png)

#### 2) PostgreSQL DISTINCT multiple columns

The following statement demonstrates how to use the `DISTINCT` clause on multiple columns:

```postgresql
SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
```
![](images/PostgreSQL-Distinct-select-distinct-two-columns.png)

Because we specified both `bcolor` and `fcolor` columns in the SELECT DISTINCT clause, `PostgreSQL` combined the values in both `bcolor` and `fcolor` columns to evaluate the uniqueness of the rows.

The query returns the unique combination of `bcolor` and `fcolor` from the distinct_demo table. Notice that the distinct_demo table has two rows with red value in both  `bcolor` and  `fcolor` columns. When we applied the DISTINCT to both columns, one row was removed from the result set because it is the duplicate.

#### 3)  PostgreSQL DISTINCT ON example

The following statement sorts the result set by the  `bcolor` and  `fcolor`, and then for each group of duplicates, it keeps the first row in the returned result set.

```postgresql
SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo 
ORDER BY
	bcolor,
	fcolor;
```

![](images/PostgreSQL-Distinct-select-distinct-on.png)

# Filtering Data

## WHERE

The syntax of the `PostgreSQL` `WHERE` clause is as follows:


```postgresql
SELECT select_list
FROM table_name
WHERE condition
ORDER BY sort_expression
```


The `WHERE` clause appears right after the `FROM` clause of the `SELECT` statement.  The `WHERE` clause uses the condition to filter the rows returned from the `SELECT` clause.

The condition must evaluate to `true`, `false`, or `unknown`. It can be a `boolean expression` or a combination of boolean expressions using the `AND` and `OR` operators.

The query returns only rows that satisfy the `condition` in the `WHERE` clause. In other words, only rows that cause the `condition` evaluates to true will be included in the result set.


`PostgreSQL` evaluates the `WHERE` clause after the `FROM` clause and before the `SELECT` and `ORDER BY` clause:

![](images/PostgreSQL-WHERE.png)

If you use column `aliases` in the `SELECT` clause, you cannot use them in the `WHERE` clause.

Besides the `SELECT` statement, you can use the WHERE clause in the `UPDATE` and `DELETE` statement to specify rows to be updated or deleted.

To form the condition in the `WHERE` clause, you use comparison and logical operators:



| Operator | Description |
|----------|-------------|
| =        | Equal       |
| >        | Greater than|
| <        | Less than   |
| >=       | Greater than or equal |
| <=       | Less than or equal |
| <> or != | Not equal   |
| AND      | Logical operator AND |
| OR       | Logical operator OR  |
| IN       | Return true if a value matches any value in a list |
| BETWEEN  | Return true if a value is between a range of values |
| LIKE     | Return true if a value matches a pattern |
| IS NULL  | Return true if a value is NULL |
| NOT      | Negate the result of other operators |

### WHERE clause examples

#### 1)  Using WHERE clause with the equal (=) operator example

The following statement uses the `WHERE` clause customers whose first names are `Jamie`:

```postgresql
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie';
```

![](images/PostgreSQL-WHERE-string-comparison.png)

#### 2) Using WHERE clause with the AND operator example

The following example finds customers whose first name and last name are `Jamie` and `rice` by using the `AND` logical operator to combine two Boolean expressions:

```postgresql
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie' AND 
        last_name = 'Rice';
```

![](images/PostgreSQL-WHERE-with-AND-operator.png)

