-- Single Index

create index index_1
on ipl.players(id);

-- clustered Index 

create index clusterd_index
on ipl.matches(col1,col2,col3.....)