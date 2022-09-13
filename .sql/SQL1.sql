/*
We decieded to hold a concert.
but before we do, we must know Which music genre should we choose, Where to hold our concert and Which band should perform
*/

/*First SQL: Which music genre should we choose*/

/*
Questions answered with this SQL are the following:

Q1: Which music genre is most popular among our customers?
Q2: How many customers out of all our 59 customers listen to this genre with percentage?
*/

SELECT t1.Name, COUNT(*) AS "Number of listeners", COUNT(*)*100/59 AS "Percentage %"
FROM(
	SELECT Customer.CustomerId, Genre.Name, COUNT(*)
	FROM Customer
	JOIN Invoice
	ON Invoice.CustomerId = Customer.CustomerId
	JOIN InvoiceLine
	ON InvoiceLine.InvoiceId = Invoice.InvoiceId
	JOIN Track
	ON Track.TrackId = InvoiceLine.TrackId
	JOIN Genre
	ON Genre.GenreId = Track.GenreId

	GROUP BY  Customer.CustomerId, Genre.Name
	ORDER BY Customer.CustomerId) as t1
GROUP BY 1
ORDER BY 2 DESC

/*
Based on this table we found out that 100% of our customers listen to Rock music, so we decided to told a Rock concert
*/