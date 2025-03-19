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
        HeaderInfo  : {
            $Type: 'UI.HeaderInfoType',
            TypeName: 'Product',
            TypeNamePlural: 'Products',
            TypeImageUrl: image,
            // appears when navigated to the product details view
            Title : {
                $Type: 'UI.DataField', // specifies that the data will be binded from Products
                Value: productName,
                // Label: 'Product'
            },
            Description: {
                $Type: 'UI.DataField',
                Value: price
            }
        },
        
    }
);

service CatalogService {
    // @readonly entity Books as projection on my.Books;
    @readonly entity Products as projection on sampleCAPProject.Products;
}
