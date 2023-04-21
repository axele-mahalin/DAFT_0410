#challenge 1

select a.au_id, au_lname, au_fname, ta.title_id, t.title, t.pub_id, p.pub_name
from publications.titleauthor as ta
left join publications.authors as a
	on a.au_id = ta.au_id
left join publications.titles as t
	on ta.title_id = t.title_id
left join publications.publishers as p
	on t.pub_id = p.pub_id
;
    
#challenge 2

with temp_table as (
select a.au_id, au_lname, au_fname, ta.title_id, t.title, t.pub_id, p.pub_name, count(t.title) as title_count
from publications.titleauthor as ta
left join publications.authors as a
	on a.au_id = ta.au_id
left join publications.titles as t
	on ta.title_id = t.title_id
left join publications.publishers as p
	on t.pub_id = p.pub_id
group by a.au_id, au_lname, au_fname, ta.title_id, t.title, t.pub_id, p.pub_name
)

select count(*) from temp_table; 

#challenge 3

select a.au_id, au_lname, au_fname, sum(qty) as total
from publications.authors as a
left join publications.titleauthor as ta
	on a.au_id = ta.au_id
left join publications.sales as s
	on ta.title_id = s.title_id
group by a.au_id, au_lname, au_fname, ta.title_id
order by total desc
limit 3;

#challenge 4

with new_temp_table as (
select a.au_id, au_lname, au_fname, (select case when qty is null then 0
			else qty
		end) as quantity
from publications.authors as a
left join publications.titleauthor as ta
	on a.au_id = ta.au_id
left join publications.sales as s
	on ta.title_id = s.title_id
)

select au_id, au_lname, au_fname, sum(quantity) as total
from new_temp_table
group by au_id, au_lname, au_fname
order by total desc
;



    


