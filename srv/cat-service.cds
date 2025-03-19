// using my.bookshop as my from '../db/schema';
using sampleCAPProject from '../db/schema';

// UI Line Item Annotations - This annotation can be used to define additional metadata for line items
annotate CatalogService.Products with @(
    UI:{
        LineItem  : [
            { 
                Label: 'Product Name',
                Value: productName 
            },
            { 
                Label: 'Description',
                Value: description 
            },
            { 
                Label: 'Price',
                Value: price 
            },
        ],
    }
);

service CatalogService {
    // @readonly entity Books as projection on my.Books;
    @readonly entity Products as projection on sampleCAPProject.Products;
}
