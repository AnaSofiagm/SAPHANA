const cds = require('@sap/cds');

module.exports = async function(){

    this.on('helloFunction', (req) => {
        console.log("Hello Is called"+req.data.name);
        return "hello World "+req.data.name;
    })
    this.on('helloAction', (req) => {
        console.log("Hello Is called"+req.data.name);
        return "hello World "+req.data.name;
    })

    this.before(['CREATE','UPDATE'], 'Products', async (req) =>{
        if(req.data.salesPrice / req.data.basePrice < 1.5) {
            req.data.salesPrice = req.data.basePrice * 1.5;
        }
    })
    this.after(['READ'], 'Products', async (products, red) => {

        products.map(product => {
            product.salesMargin = (product.salesPrice / product.basePrice) -1;
        });
    })
}