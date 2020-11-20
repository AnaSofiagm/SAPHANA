using {Base, withTemporal} from './common';
namespace training.product;

entity TblProducts: Base, withTemporal{
    name: String(100);
    manufacturer: String(50);
    salesPrice: Decimal;
    basePrice: Decimal;
    quantity: Integer;
}