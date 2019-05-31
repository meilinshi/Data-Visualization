/*SELECT 
    title,
    itemtype,
    deweyClass,
    COUNT(title) AS Counts,
    COUNT(IF(YEAR(cout) = 2006, 1, NULL)) AS '2006',
    COUNT(IF(YEAR(cout) = 2007, 1, NULL)) AS '2007',
    COUNT(IF(YEAR(cout) = 2008, 1, NULL)) AS '2008',
    COUNT(IF(YEAR(cout) = 2009, 1, NULL)) AS '2009',
    COUNT(IF(YEAR(cout) = 2010, 1, NULL)) AS '2010',
    COUNT(IF(YEAR(cout) = 2011, 1, NULL)) AS '2011',
    COUNT(IF(YEAR(cout) = 2012, 1, NULL)) AS '2012',
    COUNT(IF(YEAR(cout) = 2013, 1, NULL)) AS '2013',
    COUNT(IF(YEAR(cout) = 2014, 1, NULL)) AS '2014',
    COUNT(IF(YEAR(cout) = 2015, 1, NULL)) AS '2015',
    COUNT(IF(YEAR(cout) = 2016, 1, NULL)) AS '2016',
    COUNT(IF(YEAR(cout) = 2017, 1, NULL)) AS '2017',
    COUNT(IF(YEAR(cout) = 2018, 1, NULL)) AS '2018'
FROM
    spl_2016.outraw
WHERE
    YEAR(cout) BETWEEN 2006 AND 2018
        AND (deweyClass >= 420 AND deweyClass < 470)
        OR (deweyClass >= 491.7
        AND deweyClass < 491.8)
        OR (deweyClass >= 492.7
        AND deweyClass < 492.8)
        OR (deweyClass >= 495.1
        AND deweyClass < 495.2)
        OR (deweyClass >= 495.6
        AND deweyClass < 495.8)
GROUP BY title , itemtype , deweyClass
ORDER BY COUNT(title) DESC 
*/
