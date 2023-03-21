SELECT first_name, LENGTH(first_name) length FROM customer WHERE first_name LIKE 'a%' AND LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
    length;