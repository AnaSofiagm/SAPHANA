using { training.salesorder as salesorder } from '../schema/salesorder';

namespace training.views;

define view TotalSalesByClientView as

	select from salesorder.TblSalesOrderItem{
		salesOrder.client.ID as ![clientId],
		salesOrder.client.name as ![clientName],
        salesOrder.createdAt as ![dataCriacao],
		sum(quantity * product.salesPrice) as ![totalSalesValor]:Decimal
	} group by salesOrder.client.ID,salesOrder.client.name, salesOrder.createdAt;