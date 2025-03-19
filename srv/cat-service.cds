// using my.bookshop as my from '../db/schema';
using sampleCAPProject from '../db/schema';

service CatalogService {
    // @readonly entity Books as projection on my.Books;
    @readonly entity Products as projection on sampleCAPProject.Products;
}
