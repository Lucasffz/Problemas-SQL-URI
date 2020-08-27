/*Problema: 2614 - Locações de Setembro:*/

select customers.name, rentals.rentals_date from customers inner join
 rentals on rentals.id_customers = customers.id where
 DATE_PART('MONTH', rentals.rentals_date)  = '09';
 

/*Problema 2616 - Nenhuma Locação:*/

Select customers.id,customers.name 
from customers where customers.id 
not in (select locations.id_customers from locations)
;

/*Problema 2741 - Notas dos Alunos*/ 

SELECT concat('Approved: ',students.name),students.grade from students where students.grade >= 7
order by students.grade desc;


/*Problema 2738 - Concurso*/ 

SELECT candidate.name,
trunc(( (score.math *2 + score.specific*3 + 
       score.project_plan *5)/10),2) as "avg"
FROM score INNER join 
candidate on
score.candidate_id = candidate.id
order by 2 desc
;

/* Problema 2623 - Categorias com Vários Produtos*/

SELECT products.name, categories.name FROM products
INNER JOIN
categories on products.id_categories = categories.id
where products.amount > 100 and categories.id in (1,2,3,6,9)
order by categories.id
;


/* Problema 2622 - Pessoas Jurídicas */
SELECT customers.name FROM legal_person 
INNER join 
customers on legal_person.id_customers = customers.id;

/* Problema 2737 - Advogados */

SELECT lawyers.name,lawyers.customers_number from lawyers where lawyers.customers_number = 
(Select max(lawyers.customers_number) FROM lawyers)
union all
SELECT lawyers.name,lawyers.customers_number from lawyers where lawyers.customers_number = 
(Select min(lawyers.customers_number) FROM lawyers)
union all
SELECT 'Average', round(avg(lawyers.customers_number),0) FROM lawyers
;

/* Problema 2618 - Produtos Importados */

SELECT products.name, providers.name,categories.name FROM products INNER JOIN 
providers on products.id_providers = providers.id INNER JOIN 
categories on products.id_categories = categories.id 
where providers.name ='Sansul SA' and categories.name = 'Imported'; 


/* Problema 2619 - Super Luxo */

SELECT products.name, providers.name,products.price FROM products INNER JOIN 
providers on products.id_providers = providers.id INNER JOIN 
categories on products.id_categories = categories.id 
where products.price >1000 and categories.name like 'Super%'; 


/* Problema 2624 - Quantidades de Cidades por Clientes */

SELECT count(DISTINCT customers.city) from customers;

/*Problema 2621 - Quantidades Entre 10 e 20 */

select products.name from products INNER join
providers on products.id_providers = providers.id
where providers.name like 'P%' and 
products.amount > 10 and products.amount <20
;


/*Problema 2617 - Fornecedor Ajax SA */

select products.name,providers.name from products,providers where products.id_providers = providers.id
and providers.name = 'Ajax SA';


/*Problema 2609 - Produtos por Categorias*/

SELECT categories.name, sum(products.amount) from products
INNER JOIN categories on products.id_categories = categories.id
group by categories.name
;

/* Problema 2612 - Os Atores Silva */

SELECT DISTINCT movies.id,movies.name from movies, genres, actors, movies_actors
where movies_actors.id_movies = movies.id and movies_actors.id_actors = actors.id and 
genres.description = 'Action' and actors.name like '%Silva'
order by movies.name;
;

/*Problema 2613 - Filmes em Promoção */

SELECT movies.id,movies.name from movies,prices where
movies.id_prices = prices.id and prices.value < 2.00;


/*Problema 2606 - Categorias  */

SELECT products.id,products.name FROM products,categories where products.id_categories = categories.id 
and categories.name like 'super%'

/*Problema 2611 - Filmes de Ação */

SELECT movies.id, movies.name FROM movies 
INNER JOIN genres on movies.id_genres = genres.id 
where genres.description = 'Action'; 


/*Problema 2610 - Valor Médio dos Produtos  */

SELECT round(avg(price),2) from products;

/*Problema 2605 - Representantes Executivos  */

SELECT products.name, providers.name FROM products 
INNER JOIN providers on products.id_providers = providers.id WHERE products.id_categories = 6;

/* Problema 2615 - Expandindo o Negocio */

SELECT distinct city from customers;


/* Problema 2608 - Maior e Menor Preço */

SELECT max(price),min(price) from products;

/*  Problema 2607 - Cidades em Ordem Alfabética */

SELECT city from providers order by city;

/* Problema 2604 - Menores que 10 ou Maiores que 100 */

SELECT "id","name" FROM products WHERE "price" < 10 or "price" >100;

/* Problema 2603 Endereço dos Clientes */

SELECT "name","street" from customers where "city" ='Porto Alegre';

/* Problema 2602 - Select Básico */

SELECT "name" from customers where "state" ='RS';

