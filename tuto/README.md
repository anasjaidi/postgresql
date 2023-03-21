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