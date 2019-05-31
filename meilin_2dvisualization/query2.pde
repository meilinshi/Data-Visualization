/*SELECT 
    class, years, AVG(TIMESTAMPDIFF(DAY, cout, cin)) AS AVG_TIME
FROM
    (SELECT 
        #SUBSTRING(deweyClass, 1, 5) AS class,
        SUBSTRING(deweyClass, 1, 2) AS class, #for deweyClass 420 to 470
            YEAR(cout) AS years,
            cin,
            cout,
            TIMESTAMPDIFF(DAY, cout, cin)
    FROM
        spl_2016.inraw
    WHERE
        YEAR(cout) BETWEEN 2006 AND 2018
            AND TIMESTAMPDIFF(DAY, cout, cin) > 0
  #    AND deweyClass >= 420 AND deweyClass < 470
  #         AND (deweyClass >= 491.7
  #         AND deweyClass < 491.8
    #         OR deweyClass >= 492.7
    #         AND deweyClass < 492.8
  #         OR deweyClass >= 495.1
  #         AND deweyClass < 495.2
  #         OR deweyClass >= 495.6
  #         AND deweyClass < 495.7
  #         OR deweyClass >= 495.7
  #         AND deweyClass < 495.8)
    GROUP BY years , class , cin , cout) AS aTable
GROUP BY class , years
*/
