select 
	customers.customerID as CustomerID, concat(customers.firstName, ' ', customers.lastName) as FullName,
	orders.orderID as OrderID, orders.total as Cost,
    menu.name as MenuName,
    menuitems.name as CourseName
from orders 
	inner join customers on orders.customerID = customers.customerID
	inner join menu on orders.menuID = menu.menuID
	inner join menuitems on menu.menuItemID = menuitems.menuItemID
order by cost asc;