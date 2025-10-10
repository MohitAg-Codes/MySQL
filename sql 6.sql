show databases;
use dena_bank;

-- String functions in sql 
-- CONCAT() : The CONCAT() function is used to concatenate (combine) two or more strings into one string.
-- It is useful when we want to merge fields like first and last names into a full name.

SELECT CONCAT('John' , ' ', 'Doe') AS FullName;

--  CHAR_LENGTH() / CHARACTER_LENGTH()
-- The CHAR_LENGTH() or LENGTH() function returns the length of a string in characters.
-- It’s essential for validating or manipulating text data, especially when you need to know how many characters a string contains.
 
SELECT CHAR_LENGTH('Hello   ') AS StringLength;

-- UPPER() and LOWER()
-- These functions convert the text to uppercase or lowercase, respectively. 
-- They are useful for normalizing the case of text in a database.
 
SELECT UPPER('They are useful for normalizing the case of text in a database.') AS UpperCase;
SELECT LOWER('HELLO') AS LowerCase;

-- REPLACE()
-- The REPLACE() function replaces occurrences of a substring within a string with another substring.
-- This is useful for cleaning up data, such as replacing invalid characters or formatting errors.

SELECT REPLACE('Hello World', 'World', 'SQL') AS UpdatedString;

-- SUBSTRING() / SUBSTR()
-- The SUBSTRING() (or SUBSTR()) function is used to extract a substring from a string, starting from a specified position.
-- It is especially useful when we need to extract a specific part of a string, like extracting the domain from an email address.

SELECT SUBSTRING('Hello World', 1, 3) AS SubStringExample;

-- LENGTH()
-- LENGTH() returns the length of a string in bytes. 
-- This can be useful for working with multi-byte character sets.
 
SELECT LENGTH('Hello') AS LengthInBytes;


-- LEFT() and RIGHT()
-- The LEFT() and RIGHT() functions allow you to extract a specified number of characters from the left or right side of a string, respectively.
-- It is used for truncating strings for display.

SELECT LEFT('Hello World', 4) AS LeftString;
SELECT RIGHT('Hello World', 8) AS RightString;

-- INSTR()
-- The INSTR() function is used to find the position of the first occurrence of a substring within a string.
-- It returns the position (1-based index) of the substring. If the substring is not found, it returns 0.
-- This function is particularly useful for locating specific characters or substrings in text data.

SELECT INSTR('Hello World', 'World') AS SubstringPosition;
SELECT INSTR('Learn to Learn and Teach to Teach', 'Teach') AS SubstringPosition;

-- TRIM()
-- The TRIM() function removes leading and trailing spaces (or other specified characters) from a string
-- By default, it trims spaces but can also remove specific characters using TRIM(character FROM string). 
-- This is helpful for cleaning text data, such as user inputs or database records.

SELECT TRIM(' ' FROM '  Hello World ') AS TrimmedString;

--  ASCII()
-- The ASCII() function returns the ASCII value of a single character.
-- This is helpful when we need to find the numeric code corresponding to a character, often used in encoding and decoding text.

SELECT ascii('t');

-- CONCAT_WS()
-- CONCAT_WS() stands for "Concatenate With Separator." It allows us to join multiple strings with a specific separator between them.
-- This is ideal when we need to merge columns like first name and last name with a custom separator.

SELECT CONCAT_WS('_', 'Career', '247', 'Education') AS concatvalue;

-- REVERSE()
-- The REVERSE() function reverses the characters in a string.
-- It’s useful in situations where we need to process data backward, such as for password validation or certain pattern matching.

SELECT REVERSE('Hello World') AS ReversedString;

-- FORMAT()
-- The FORMAT() function is used to format a number as a string in a specific way, often with commas for thousands or with a specific number of decimal places
--  It is handy when you need to display numbers in a user-friendly format.

SELECT FORMAT(0.98143224 * 100, '1') + '%' AS PercentageOutput;
SELECT CONCAT(ROUND(0.981 * 100, 1), '%') as concatvalue;

-- LCASE()
-- The LCASE() function converts all characters in a string to lowercase.
-- It helps standardize text data, especially when comparing strings in a case-insensitive way.

SELECT LCASE ("Learn to Learn and THEN TEACH TO TEACH");

-- POSITION()
-- The POSITION() function finds the position of the first occurrence of a specified character in a string.

SELECT POSITION('e' IN 'LearntoLearn');


-- REPEAT()
-- The REPEAT() function repeats a string a specified number of times
-- It's useful when you need to duplicate a string or pattern for certain operations.

SELECT REPEAT('LearntoLearn',3);