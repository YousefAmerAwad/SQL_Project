/*
Finally, we would like to choose a rock band that will perform at our rock concert.
Of course, we'll pick the band with the highest grossing last year.
*/


SELECT Artist.Name as "Artist/Band Name", SUM(InvoiceLine.UnitPrice) AS "2013 Total Gross "
FROM Invoice
JOIN InvoiceLine
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
JOIN Track
ON track.TrackId = InvoiceLine.TrackId
JOIN Album
ON Album.AlbumId = Track.AlbumId
JOIN Artist
ON Artist.ArtistId = Album.ArtistId
JOIN genre
ON Genre.GenreId = Track.GenreId
WHERE genre.Name = "Rock"
AND Invoice.InvoiceDate > "2012-12-31" 
GROUP BY 1 
ORDER BY 2 DESC

