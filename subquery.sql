select name as MenuName 
from menu
where menuID = ANY (select menuID from orders where quantity > 2);