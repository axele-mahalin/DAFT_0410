#challenge 1

select a.au_id, au_lname, au_fname, ta.title_id, t.title, t.pub_id, p.pub_name
from publications.titleauthor as ta
left join publications.authors as a
	on a.au_id = ta.au_id
left join publications.titles as t
	on ta.title_id = t.title_id
left join publications.publishers as p
	on t.pub_id = p.pub_id;

#challenge 2


