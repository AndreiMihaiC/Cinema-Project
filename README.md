<h1>Database Project for Cinema </h1>

The goal of this project is to apply the SQL knowledge acquired during the Software Testing course in a practical setting.

Application under test: Cinema

Tools used: MySQL Workbench

<ol>
<li>Database Schema </li>
<br>
You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.

The tables are connected in the following way:

<ul>
  <li> **nume tabela 1**  The first create table is for the "users" table, which contains information about users, such as user_id, user_name, user_password, user_email and user_age. user_id is the primary key of the table and is automatically incremented.</li>
  <li> **nume tabela 2**  The "movies" table stores information about movies, such as movie_id, movie_title, movie_gen, movie_description and user_id. user_id is a foreign key that is linked to user_id from the "users" table.</li>
  <li> **nume tabela 3**  Tabela "reserved" stocheaza informatii despre rezervari, cum ar fi reserved_id, reserved_ticket, ticket_price, user_id si movie_id. user_id si movie_id sunt chei straine care sunt legate de user_id din tabela "users" si movie_id din tabela "movies", respectiv.</li>
</ul><br>

<li>Database Queries</li><br>

<ol type="a">
  <li>DDL (Data Definition Language)</li>

  The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

  ...



