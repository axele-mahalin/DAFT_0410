-- Challenge 1 : Most Profiting Authors

#Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

select a.au_id, ta.title_id, t.advance * ta.royaltyper / 100 as advance, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as sales_royalty
from publications.titleauthor as ta
left join publications.authors as a
	on a.au_id = ta.au_id
left join publications.titles as t
	on ta.title_id = t.title_id
left join publications.sales as s
	on s.title_id = t.title_id
;

#Step 2: Aggregate the total royalties for each title and author --> à continuer

select a.au_id, ta.title_id, t.advance * ta.royaltyper / 100 as advance, sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sum_royalties
from publications.titleauthor as ta
left join publications.authors as a
	on a.au_id = ta.au_id
left join publications.titles as t
	on ta.title_id = t.title_id
left join publications.sales as s
	on s.title_id = t.title_id
group by a.au_id, ta.title_id
;

#Step 3: Calculate the total profits of each author

-- Challenge 2 : Alternative Solution


