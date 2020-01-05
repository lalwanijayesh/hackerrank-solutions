SET @potential_prime := 1;
SET @divisor := 1;
SELECT GROUP_CONCAT(potential_prime SEPARATOR '&')
FROM (SELECT @potential_prime := @potential_prime + 1 AS potential_prime
      FROM information_schema.tables t1, information_schema.tables t2
      LIMIT 1000) potential_primes
WHERE NOT EXISTS (SELECT *
                  FROM (SELECT @divisor := @divisor + 1 AS divisor
                        FROM information_schema.tables t3, information_schema.tables t4
                        LIMIT 1000) divisors
                  WHERE MOD(potential_prime, divisor) = 0
                        AND potential_prime <> divisor);