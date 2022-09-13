/*
From the prvious two tabels we decieded to hold our rock concert in USA. but we haven't set a date for the concert yet
In this SQL we will determine the month when we should hold our rock concert 
We want to choose the month with the lowest profit based on previous years (to increase the profit in that month).
*/

/*
This SQL will provide a tabel of total profits for each month.
*/

SELECT t1.month, sum(t1.UnitPrice) AS "Total Profit"
FROM(
	SELECT *, strftime("%m",Invoice.InvoiceDate) month
	FROM Invoice
	JOIN InvoiceLine
	ON InvoiceLine.InvoiceId = Invoice.InvoiceId
	JOIN Track
	ON Track.TrackId = InvoiceLine.TrackId
	JOIN Genre
	ON Genre.GenreId = track.GenreId
	WHERE Genre.Name = "Rock") AS t1
GROUP BY 1
ORDER BY 1

/*
Based on this table, we find out that March is the lowest gross profit month, so we will hold our profitable concert in March to increase the profit
*/
