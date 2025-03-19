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
        FieldGroup #OverviewFG : {
            $Type: 'UI.FieldGroupType',
            Label: 'Overview',
            Data: [
                {
                    $Type: 'UI.DataField',
                    Value: category
                },
                {
                    $Type: 'UI.DataField',
                    Value: description
                },
            ]
        },
        // linking field group to UI
        Facets : [
            {
                $Type: 'UI.ReferenceFacet', // 3 Facet types avaliable UI.CollectionFacet, UI.ReferenceURLFacet
                Label: 'Overview',
                Target: '@UI.FieldGroup#OverviewFG' // points to our new Field Group above
            }
        ],
    }
);

service CatalogService {
    // @readonly entity Books as projection on my.Books;
    @readonly entity Products as projection on sampleCAPProject.Products;
}
