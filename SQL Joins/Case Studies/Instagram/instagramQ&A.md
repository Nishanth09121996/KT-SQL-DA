## Case Study #1 - SushiLand

#### 1. Find the 5 oldest users of the Instagram from the database provided

```sql
SELECT username, created_at
    FROM instagram.users
    ORDER BY created_at
    LIMIT 5

+------------------+---------------------+
| username         | created_at          |
+------------------+---------------------+
| Darby_Herzog     | 2016-05-06 00:14:21 |
| Emilio_Bernier52 | 2016-05-06 13:04:30 |
| Elenor88         | 2016-05-08 01:30:41 |
| Nicole71         | 2016-05-09 17:30:22 |
| Jordyn.Jacobson2 | 2016-05-14 07:56:26 |
+------------------+---------------------+
```     
#### 2.Find the users who have never posted a single photo on Instagram

```sql

SELECT u.username
FROM instagram.users u
LEFT JOIN instagram.photos p
ON u.id = p.user_id
WHERE p.user_id IS null
ORDER BY u.username
limit 5;

+---------------------+
| username            |
+---------------------+
| Aniya_Hackett       |
| Bartholome.Bernhard |
| Bethany20           |
| Darby_Herzog        |
| David.Osinski47     |
+---------------------+
```

#### 3.Identify the winner of the contest and provide their details to the team.

```sql
SELECT likes.photo_id, users.username,
	COUNT(likes.user_id) AS like_user
	FROM instagram.likes likes
	INNER JOIN instagram.photos photos
	On likes.photo_id = photos.id
	INNER JOIN instagram.users users
	ON photos.user_id = users.id
	GROUP BY likes.photo_id, users.username
	ORDER BY like_user DESC
	LIMIT 1;

+----------+---------------+-----------+
| photo_id | username      | like_user |
+----------+---------------+-----------+
|      145 | Zack_Kemmer93 |        48 |
+----------+---------------+-----------+
```

#### 4.Identify and suggest the top 5 most commonly used hashtags on the platform.

```sql 

SELECT t.tag_name,
	COUNT(p.photo_id) AS num_tags
FROM instagram.photo_tags p
	INNER JOIN instagram.tags t
	ON p.tag_id = t.id
GROUP BY tag_name
ORDER BY num_tags DESC
LIMIT 5;

+----------+----------+
| tag_name | num_tags |
+----------+----------+
| smile    |       59 |
| beach    |       42 |
| party    |       39 |
| fun      |       38 |
| concert  |       24 |
+----------+----------+

```

####  5. What day of the week do most users register on? Provide insights on when to schedule an ad campaign.

/* 0- Monday; 1- Tuesday; 2- Wednesday; 3- Thursday; 4- Friday; 5- Saturday; 6- Sunday; */

```sql 
SELECT weekday(created_at) AS weekday,
COUNT(username) AS num_users
FROM instagram.users
GROUP BY 1
ORDER BY 1;

+---------+-----------+
| weekday | num_users |
+---------+-----------+
|       0 |        14 |
|       1 |        14 |
|       2 |        13 |
|       3 |        16 |
|       4 |        15 |
|       5 |        12 |
|       6 |        16 |
+---------+-----------+
```

#### 6.Provide how many times does average user posts on Instagram. Also, provide the total number of photos on Instagram/total number of users.

```sql 

WITH CTE AS (
SELECT u.id AS user_id,
count(p.id) AS photo_id
FROM instagram.users AS u
LEFT JOIN instagram.photos p
ON u.id = p.user_id
GROUP BY u.id
	)
SELECT sum(photo_id) AS totalphotos,
count(user_id) AS total_users,
sum(photo_id)/count(user_id) AS total_posts_by_user
FROM CTE;

+-------------+-------------+---------------------+
| totalphotos | total_users | total_posts_by_user |
+-------------+-------------+---------------------+
|         257 |         100 |              2.5700 |
+-------------+-------------+---------------------+
```