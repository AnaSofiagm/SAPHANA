using { training.salesorder as salesorder } from '../schema/salesorder';
using {training.clients as client } from '../schema/clients';

namespace training.views;

define view TotalSalesByClientView as

	select from salesorder.TblSalesOrderItem{
		salesOrder.client.ID as ![clientId],
		salesOrder.client.name as ![clientName],
		sum(quantity * product.salesPrice) as ![totalSalesValor]
	} group by salesOrder.client.ID.salesOrder.client.name;