using { training.product as products } from '../schema/product';

namespace training.views;

define view AvailableProductsView as
	
	select from products.TblProducts as s where s.validFrom <= now() and s.validTo >= now();