/*Level: MEDIUM

Assume there are three Spotify tables containing information about the artists, songs, and music charts. 
Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. 
From now on, we'll refer to this ranking number as "song appearances".

Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). 
The order of the rank should take precedence.

For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; 
this is the highest number of appearances, so he is ranked 1st. 
Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.

Assumptions:

If two artists' songs have the same number of appearances, the artists should have the same rank.
The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).

artists Table:
Column_Name	Type
artist_id	integer
artist_name	varchar

artists Example Input:
artist_id	artist_name
101			Ed Sheeran
120			Drake

songs Table:
Column_Name	Type
song_id		integer
artist_id	integer

songs Example Input:
song_id	artist_id
45202	101
19960	120

global_song_rank Table:
Column_Name	Type
day			integer (1-52)
song_id		integer
rank		integer (1-1,000,000)

global_song_rank Example Input:
day	song_id	rank
1	45202	5
3	45202	2
1	19960	3
9	19960	15


My solution:*/

WITH ranked_artists AS
(
  SELECT artist_name, DENSE_RANK() OVER(ORDER BY song_appearances DESC) AS ranking
  FROM
  (
    SELECT art.artist_id, count(gsr.song_id) as song_appearances
    FROM global_song_rank gsr 
      JOIN songs son ON gsr.song_id = son.song_id
      JOIN artists art ON son.artist_id = art.artist_id
    WHERE gsr.rank <= 10
    GROUP BY art.artist_id
  ) r_art
  JOIN artists art ON r_art.artist_id = art.artist_id
)

SELECT *
FROM ranked_artists
WHERE ranking <= 5
ORDER BY ranking, artist_name