namespace sampleCAPProject;

entity Products {
  key ID: String;
  productName: String;
  category: String;
  price: Decimal;
  description: String;
  image:String;
  _supplier: Association to Supplier;
}

entity Supplier {
  key ID: UUID;
  name:String;
  country:String;
  suppliedProducts: Association to many Products on suppliedProducts._supplier = $self;
}