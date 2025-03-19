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
        FieldGroup #DetailFG : {
            $Type: 'UI.FieldGroupType',
            Label: 'Overview',
            Data: [
                {
                    $Type: 'UI.DataField',
                    Value: productName
                },
                {
                    $Type: 'UI.DataField',
                    Value: price
                },
            ]
        },
        // linking field group to UI
        Facets : [
            {
                // bundling 2 Facets under 1. If separeted then we would have 2 sections
                $Type: 'UI.CollectionFacet', // You can generate nested collection facets
                Label: 'Information',
                ID: 'CollectionFacet1',
                Facets: [
                    // Nested - Collection Facet inside Collection Facet 
                    /* 
                        Best Practice says:
                        1. Dont nest more than 3 levels Facets
                        2. Not reference more than 1 Reference Facet per collection (you might reference more but not advisable)
                    */
                    {
                        $Type: 'UI.CollectionFacet', 
                        Label: 'Overview',
                        ID: 'CollectionFacet2',
                        Facets: [
                                {
                                    $Type: 'UI.ReferenceFacet', // 3 Facet types avaliable UI.CollectionFacet, UI.ReferenceURLFacet
                                    Label: 'Overview',
                                    Target: '@UI.FieldGroup#OverviewFG' // points to our new Field Group above
                                }
                            ]
                    },
                    {
                        $Type: 'UI.CollectionFacet', 
                        Label: 'Detail',
                        ID: 'CollectionFacet3',
                        Facets: [
                                {
                                    $Type: 'UI.ReferenceFacet', 
                                    Label: 'More Details',
                                    Target: '@UI.FieldGroup#DetailFG' 
                                }
                            ]
                    },
                ]
            },
            
        ],
    }
);

service CatalogService {
    // @readonly entity Books as projection on my.Books;
    @readonly entity Products as projection on sampleCAPProject.Products;
}
