/*SELECT 
    YEAR(cout) AS years,
    MONTH(cout) AS months,
    COUNT(IF(deweyClass >= 420 AND deweyClass < 430,
        1,
        NULL)) AS 'English',
    COUNT(IF(deweyClass >= 430 AND deweyClass < 440,
        1,
        NULL)) AS 'German & related',
    COUNT(IF(deweyClass >= 440 AND deweyClass < 450,
        1,
        NULL)) AS 'French & related',
    COUNT(IF(deweyClass >= 450 AND deweyClass < 460,
        1,
        NULL)) AS 'Italian & related',
    COUNT(IF(deweyClass >= 460 AND deweyClass < 470,
        1,
        NULL)) AS 'Spanish & related',
    COUNT(IF(deweyClass >= 491.7
            AND deweyClass < 491.8,
        1,
        NULL)) AS 'Russian',
    COUNT(IF(deweyClass >= 492.7
            AND deweyClass < 492.8,
        1,
        NULL)) AS 'Arabic',
    COUNT(IF(deweyClass >= 495.1
            AND deweyClass < 495.2,
        1,
        NULL)) AS 'Chinese',
    COUNT(IF(deweyClass >= 495.6
            AND deweyClass < 495.7,
        1,
        NULL)) AS 'Japanese',
    COUNT(IF(deweyClass >= 495.7
            AND deweyClass < 495.8,
        1,
        NULL)) AS 'Korean'
FROM
    spl_2016.outraw
WHERE
    deweyClass >= 420 AND deweyClass < 495.8
        AND YEAR(cout) BETWEEN 2006 AND 2018
GROUP BY MONTH(cout),YEAR(cout)
ORDER BY YEAR(cout), MONTH(cout);
*/
