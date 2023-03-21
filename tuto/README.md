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