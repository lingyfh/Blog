#### The simplest way to use the row value constructor in a SELECT statement as a derived table can be illustrated in the following script:
    SELECT * 
    FROM (VALUES ('USD', 'U.S. Dollar'), 
              ('EUR', 'Euro'),
              ('CAD', 'Canadian Dollar'),
              ('JPY', 'Japanese Yen')) AS [Currency] ( [CurrencyCode], [CurrencyName] )
              
     CurrencyCode   CurrencyName
     -------------- --------------------
     USD            U.S. Dollar
     EUR            Euro
     CAD            Canadian Dollar
     JPY            Japanese Yen
