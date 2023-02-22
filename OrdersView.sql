create view OrdersView AS 
select orderID as OrderID, quantity as Quantity, total as Cost
from orders
where quantity > 2;