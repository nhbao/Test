[
  {
    name: 'book',
    tax: 0
  },
  {
    name: 'music cd',
    tax: 10
  },
  {
    name: 'chocolate bar',
    tax: 0
  },
  {
    name: 'imported box of chocolates',
    tax: 5
  },
  {
    name: 'imported bottle of perfume',
    tax: 15
  },
  {
    name: 'bottle of perfume',
    tax: 10
  },
  {
    name: 'packet of headache pills',
    tax: 0
  },
  {
    name: 'box of imported chocolates',
    tax: 5
  }
].map {|hash| Product.where(hash).first_or_create}
