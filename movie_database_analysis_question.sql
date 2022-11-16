use moviedb;

/*
1.Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role
*/
select act_fname,act_lname,role from actors
inner join movie_cast
on actors.act_id = movie_cast.act_id
inner join movie
on movie_cast.mov_id= movie.mov_id
AND movie.mov_title = 'Annie Hall';

#output: woody Allen actors role is Alvy Singer

/*2.From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
Return director first name, last name and movie title
*/
select dir_fname,dir_lname,mov_title
from director
inner join movie_direction
on director.dir_id = movie_direction.dir_id
inner join movie
on movie_direction.mov_id = movie.mov_id
inner join movie_cast
on movie.mov_id = movie_cast.mov_id
and movie.mov_title = 'Eyes wide shut';

#Output: The director name is stanley kubrick was directed by flim 'eyes wide shut'.

/*
3.Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
*/
select dir_fname,dir_lname,mov_title
from director
inner join movie_direction
on director.dir_id = movie_direction.dir_id
inner join movie
on movie_direction.mov_id = movie.mov_id
inner join movie_cast
on movie.mov_id = movie_cast.mov_id
where role = 'Sean Maguire';

#Output: director name is gus vansant was playing role 'sean mangurie' in 'good will hunting' movie.

/*
4.Write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.).
 Return actor first name, last name, movie title and release year. 
*/
select act_fname,act_lname,mov_title,mov_year
from actors
join movie_cast
on actors.act_id = movie_cast.act_id
join movie
on movie_cast.mov_id = movie.mov_id
WHERE mov_year NOT BETWEEN  1990 and 2000;

#Output: the output will show who actors who have not acted in any movie between1990 and 2000.

/*
5.Write a SQL query to find the directors with number of genres movies. Group the result set on director first name, last name and generic title. 
Sort the result-set in ascending order by director first name and last name.
 Return director first name, last name and number of genres movies.
*/

select dir_fname,dir_lname,count(gen_title)
from director
join movie_direction
on director.dir_id = movie_direction.dir_id
join movie_genres
on movie_direction.mov_id = movie_genres.mov_id
join genres
on movie_genres.gen_id = genres.gen_id
group by dir_fname,dir_lname,gen_title
order by dir_fname,dir_lname asc;

#output:the output will show directors with number of genres movies in assending order.

/*
6.Write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
*/

select mov_title,mov_year,gen_title
from movie
join movie_genres
on movie.mov_id = movie_genres.mov_id
join genres
on movie_genres.gen_id = genres.gen_id;

#Output:The ouput will show the movies with year and genres.

/*
7.Write a SQL query to find all the movies with year, genres, and name of the director.
*/

SELECT mov_title, mov_year, gen_title, dir_fname, dir_lname
FROM movie
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director;

#Output: The ouput will show all the movies with year, genres, and name of the director.

/*
8.Write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. 
Return movie title, release year, date of release, duration, and first and last name of the director. 
*/

select mov_title,mov_year,mov_dt_rel,dir_fname,dir_lname
from movie
join movie_direction
on movie.mov_id = movie_direction.mov_id
join director
on movie_direction.dir_id = director.dir_id
where mov_dt_rel < '1989-01-01'
order by mov_dt_rel desc;

#Output:The output will show the movies released before 1st January 1989. desending order by date of release.
