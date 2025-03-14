WITH product_churns AS (
    SELECT
        product_id,
        MAX(payment_month) AS last_purchase_date
    FROM
        {{ ref('transform_final') }}
    GROUP BY product_id
)
 
SELECT
    year(last_purchase_date) AS end_of_year_for_the_product,
    product_id AS number_of_product_churns
FROM
    product_churns
ORDER BY
    end_of_year_for_the_product
 