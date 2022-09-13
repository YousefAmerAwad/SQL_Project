/*
Based on the last question (Q1), we decided to hold a rock concert, but In which country should we hold our concert?
Questions answered with this SQL are the following:
Q1: Top countries that consume rock music so we can hold a rock concert there?
*/



SELECT Customer.Country, SUM(InvoiceLine.UnitPrice) AS "Total Spend"
FROM Customer
JOIN Invoice
ON Invoice.CustomerId = Customer.CustomerId
JOIN InvoiceLine
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
JOIN Track
ON Track.TrackId = InvoiceLine.TrackId
JOIN Genre
ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = "Rock"
GROUP BY Customer.Country
ORDER BY 2 DESC


/*
Based on this table, we found out that customers from USA spend the most on rock music, so we decided to hold a rock concert there
*/