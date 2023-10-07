/// Maximum width of an image is 5760px
const _imageWidth = 700;

/// Maximum height of an image is 5760px
const _imageHeight = 1000;

const _scale = 1;

class ShopifyQuery {
  static String readCollections = '''
    query(\$cursor: String, \$langCode: LanguageCode) @inContext(language: \$langCode) {
        collections(first: 250, after: \$cursor) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            cursor
            node {
              id
              title
              description
              image {
                ...imageInformation
              }
            }
          }
        }
    }
    $fragmentImage
    ''';

  static String getCollections = '''
    query(\$cursor: String) {
        collections(first: 20, after: \$cursor) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            cursor
            node {
              id
              title
              description
              image {
                ...imageInformation
              }
            }
          }
        }
    }
    $fragmentImage
    ''';

  static String getShop = '''
    query {
    shop {
      name
      description
    }
  }
  ''';

  static String getProducts = '''
    query(\$cursor: String, \$pageSize: Int, \$langCode: LanguageCode) @inContext(language: \$langCode) {
      products(first: \$pageSize, after: \$cursor) {
        pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          cursor
          node {
            ...productInformation
          }
        }
      }
    }
    $fragmentProduct
  ''';

  static String getProductByName = '''
    query(\$cursor: String, \$pageSize: Int, \$query: String\$reverse: Boolean, \$sortKey: ProductSortKeys, \$langCode: LanguageCode) @inContext(language: \$langCode) {
        products(first: \$pageSize, after: \$cursor, query: \$query, sortKey: \$sortKey, reverse: \$reverse) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            cursor
            node {
              ...productInformation
            }
          }
        }
    }
    $fragmentProduct
  ''';
  static String getProductById = '''
   query (\$id: String, \$langCode: LanguageCode) @inContext(language: \$langCode) {
    products(first: 1, query: \$id) {
      edges {
        node {
          ...productInformation
        }
      }
    }
  }
  $fragmentProduct
''';

  static String getProductByPrivateId = '''
   query(\$id: ID!, \$langCode: LanguageCode) @inContext(language: \$langCode) {
      node(id: \$id) {
      ...on Product {
        ...productInformation
       }
     }
   }
   $fragmentProduct
''';

  // static String getRelativeProducts = '''
  //   query(\$query: String, \$pageSize: Int) {
  //     shop {
  //       products(first: \$pageSize, query: \$query, sortKey: PRODUCT_TYPE) {
  //         pageInfo {
  //           hasNextPage
  //           hasPreviousPage
  //         }
  //         edges {
  //           cursor
  //           node {
  //             ...productInformation
  //           }
  //         }
  //       }
  //     }
  //   }
  //   $fragmentProduct
  // ''';

  static String getProductByCollection = '''
    query(\$categoryId: ID!, \$pageSize: Int, \$cursor: String, \$reverse: Boolean, \$sortKey: ProductCollectionSortKeys, \$langCode: LanguageCode) @inContext(language: \$langCode) {
      node(id: \$categoryId) {
        id
        ... on Collection {
          title
          products(first: \$pageSize, after: \$cursor, sortKey: \$sortKey, reverse: \$reverse) {
            pageInfo {
              hasNextPage
              hasPreviousPage
            }
            edges {
              cursor
              node {
                ...productInformation
              }
            }
          }
        }
      }
    }
    $fragmentProduct
  ''';

  // static String getRelatedByCollection = '''
  //   query(\$query: String, \$pageSize: Int) {
  //     shop {
  //       products(first: \$pageSize, query: \$query, sortKey: PRODUCT_TYPE) {
  //         pageInfo {
  //           hasNextPage
  //           hasPreviousPage
  //         }
  //         edges {
  //           cursor
  //           node {
  //             ...productInformation
  //           }
  //         }
  //       }
  //     }
  //   }
  //   $fragmentProduct
  // ''';

  // static String getCheckout = '''
  //   query(\$checkoutId: ID!) {
  //     node(id: \$checkoutId) {
  //       ... on Checkout {
  //         id
  //         completedAt
  //       }
  //     }
  //   }
  // ''';

  static String createCheckout = '''
  mutation checkoutCreate(
    \$input: CheckoutCreateInput! 
    \$langCode: LanguageCode
  ) @inContext(language: \$langCode) {
      checkoutCreate(input: \$input) {
        checkout {
          id
          customAttributes {
              key
              value
          }
          webUrl
          subtotalPrice
          totalTax
          totalPrice
          paymentDue
        }
        checkoutUserErrors {
          code
          field
          message
        }
      }
  }
  ''';

  static String updateCheckout = '''
    mutation checkoutLineItemsReplace(
      \$lineItems: [CheckoutLineItemInput!]!
      \$checkoutId: ID!
      \$langCode: LanguageCode
    ) @inContext(language: \$langCode) {
      checkoutLineItemsReplace(lineItems: \$lineItems, checkoutId: \$checkoutId) {
        userErrors {
          field
          message
        }
        checkout {
          id
          customAttributes {
            key
            value
          }
          webUrl
          totalPrice
          subtotalPrice
          paymentDue
        }
      }
    }
  ''';

  static String updateCheckoutAttribute = '''
  mutation checkoutAttributesUpdateV2(
  \$checkoutId: ID! 
  \$input: CheckoutAttributesUpdateV2Input!
  \$langCode: LanguageCode
  ) @inContext(language: \$langCode) {
  checkoutAttributesUpdateV2(checkoutId: \$checkoutId, input: \$input) {
    checkout {
      id
    }
    checkoutUserErrors {
      code
      field
      message
    }
  }
}
  ''';

  static String updateShippingAddress = '''
    mutation checkoutShippingAddressUpdateV2(
    \$shippingAddress: MailingAddressInput!
    \$checkoutId: ID!) {
      checkoutShippingAddressUpdateV2(shippingAddress: \$shippingAddress, checkoutId: \$checkoutId) {
        userErrors {
          field
          message
        }
        checkout {
          id
          webUrl
          subtotalPrice
          totalTax
          totalPrice
          paymentDue
          shippingAddress {
            address1
            address2
            city
            firstName
            id
            lastName
            zip
            phone
            name
            latitude
            longitude
            province
            country
            countryCode
          }
          availableShippingRates {
            ready
            shippingRates {
              handle
              price
              title
            }
          }
          shippingLine {
            price
            title
            handle
          }
          taxExempt
          taxesIncluded
          totalPriceV2 {
            amount
          }
          totalTaxV2 {
            amount
          }
          paymentDueV2 {
            amount
          }
          lineItems(first: 250) {
            pageInfo {
              hasNextPage
              hasPreviousPage
            }
            edges {
              node {
                id
                title
                quantity
                variant {
                  title
                  image {
                    ...imageInformation
                  }
                  price
                  selectedOptions {
                    name
                    value
                  }
                }
              }
            }
          }
        }
      }
    }
    $fragmentImage
  ''';

  static String updateShippingLine = '''
    mutation checkoutShippingLineUpdate(
    \$shippingRateHandle: String!
    \$checkoutId: ID!) {
      checkoutShippingLineUpdate(shippingRateHandle: \$shippingRateHandle, checkoutId: \$checkoutId) {
        userErrors {
          field
          message
        }
        checkout {
          id
          webUrl
          subtotalPrice
          totalTax
          totalPrice
          paymentDue
          shippingLine {
            price
            title
            handle
          }
          lineItems(first: 250) {
            pageInfo {
              hasNextPage
              hasPreviousPage
            }
            edges {
              node {
                id
                title
                quantity
                variant {
                  title
                  image(maxHeight: $_imageHeight, maxWidth: $_imageWidth) {
                    src
                  }
                  price
                  selectedOptions {
                    name
                    value
                  }
                  product {
                    id
                    title
                    description
                    descriptionHtml
                    availableForSale
                    productType
                    onlineStoreUrl
                    options {
                      id
                      name
                      values
                    }
                    variants(first: 250) {
                      pageInfo {
                        hasNextPage
                        hasPreviousPage
                      }
                      edges {
                        node {
                          id
                          title
                          availableForSale
                          selectedOptions {
                            name
                            value
                          }
                          image(maxHeight: $_imageHeight, maxWidth: $_imageWidth) {
                            src
                          }
                          price
                          compareAtPrice
                        }
                      }
                    }
                    images(first: 250, maxHeight: $_imageHeight, maxWidth: $_imageWidth) {
                      pageInfo {
                        hasNextPage
                        hasPreviousPage
                      }
                      edges {
                        node {
                          src
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  ''';

  static String applyCoupon = '''
    mutation checkoutDiscountCodeApplyV2(\$discountCode: String!, \$checkoutId: ID!) {
      checkoutDiscountCodeApplyV2(discountCode: \$discountCode, checkoutId: \$checkoutId) {
          checkoutUserErrors {
            field
            message
          }
          checkout {
            id
            webUrl
            discountApplications(first: 10) {
              edges {
                node {
                  __typename
                  ... on DiscountCodeApplication {
                    allocationMethod
                    applicable
                    code
                    targetSelection
                    targetType
                    value {
                      __typename
                      ... on MoneyV2 {
                        amount
                      }
                      ... on PricingPercentageValue {
                        percentage
                      }
                    }
                  }
                }
              }
            }
            totalTaxV2 {
              amount
            }
            totalPriceV2 {
              amount
            }
            subtotalPriceV2 {
              amount
            }
            paymentDueV2 {
              amount
            }
          }
      }
    }
    ''';

  static String removeCoupon = '''
    mutation checkoutDiscountCodeRemove(\$checkoutId: ID!) {
      checkoutDiscountCodeRemove(checkoutId: \$checkoutId) {
        checkoutUserErrors {
          code
          field
          message
        }
        checkout {
          id
          webUrl
          totalPrice
          subtotalPrice
          paymentDue
        }
      }
    }
    ''';

  static String checkoutLinkUser = '''
    mutation checkoutCustomerAssociateV2(\$checkoutId: ID!, \$customerAccessToken: String!) {
    checkoutCustomerAssociateV2(checkoutId: \$checkoutId, customerAccessToken: \$customerAccessToken) {
      checkoutUserErrors {
        field
        message
      }
      customer {
        id
        email
      }
      checkout {
      id
      webUrl
      subtotalPrice
      totalTax
      totalPrice
      paymentDue
      lineItems(first: 250) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              id
              title
              quantity
              variant {
                title
                image(maxHeight: $_imageHeight, maxWidth: $_imageWidth) {
                  src
                }
                price
                selectedOptions {
                  name
                  value
                }
                product {
                  id
                  title
                  description
                  availableForSale
                  productType
                  onlineStoreUrl
                  options {
                    id
                    name
                    values
                  }
                  variants(first: 250) {
                    pageInfo {
                      hasNextPage
                      hasPreviousPage
                    }
                    edges {
                      node {
                        id
                        title
                        availableForSale
                        selectedOptions {
                          name
                          value
                        }
                        image(maxHeight: $_imageHeight, maxWidth: $_imageWidth) {
                          src
                        }
                        price
                        compareAtPrice
                      }
                    }
                  }
                  images(first: 250, maxHeight: $_imageHeight, maxWidth: $_imageWidth) {
                    pageInfo {
                      hasNextPage
                      hasPreviousPage
                    }
                    edges {
                      node {
                        src
                      }
                    }
                  }
                }
              }
          }
        }
      }
      
    }
  }
}
  ''';

  static String createCustomer = '''
    mutation customerCreate(\$input: CustomerCreateInput!) {
      customerCreate(input: \$input) {
        userErrors {
          field
          message
        }
        customer {
          id
          email
          firstName
          lastName
          phone
        }
      }
    }
  ''';

  static String customerUpdate = '''
    mutation customerUpdate(\$customerAccessToken: String!, \$customer: CustomerUpdateInput!) {
    customerUpdate(customerAccessToken: \$customerAccessToken, customer: \$customer) {
      customer {
        ...userInformation
      }
      customerAccessToken {
        accessToken
        expiresAt
      }
      customerUserErrors {
        code
        field
        message
      }
    }
  }
  $fragmentUser
  ''';

  static String createCustomerToken = '''
    mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) {
    customerAccessTokenCreate(input: \$input) {
      userErrors {
        field
        message
      }
      customerAccessToken {
        accessToken
        expiresAt
      }
    }
  }
  ''';

  static String renewCustomerToken = '''
    mutation customerAccessTokenRenew(\$customerAccessToken: String!) {
      customerAccessTokenRenew(customerAccessToken: \$customerAccessToken) {
        userErrors {
          field
          message
        }
        customerAccessToken {
          accessToken
          expiresAt
        }
      }
    }
  ''';

  static String getCustomerInfo = '''
    query(\$accessToken: String!) {
      customer(customerAccessToken: \$accessToken) {
        id
        email
        createdAt
        displayName
        phone
        firstName
        lastName
        defaultAddress {
          address1
          address2
          city
          firstName
          id
          lastName
          zip
          phone
          name
          latitude
          longitude
          province
          country
          countryCode
        }
        addresses(first: 10) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              address1
              address2
              city
              firstName
              id
              lastName
              zip
              phone
              name
              latitude
              longitude
              province
              country
              countryCode
            }
          }
        }
      }
    }
  ''';

  static String getPaymentSettings = '''
    query {
      shop {
        paymentSettings {
          cardVaultUrl
          acceptedCardBrands
          countryCode
          currencyCode
          shopifyPaymentsAccountId
          supportedDigitalWallets
        }
      }
    }
  ''';

  static String checkoutWithCreditCard = '''
    mutation checkoutCompleteWithCreditCardV2(\$checkoutId: ID!, \$payment: CreditCardPaymentInputV2!) {
      checkoutCompleteWithCreditCardV2(checkoutId: \$checkoutId, payment: \$payment) {
        userErrors {
          field
          message
        }
        checkout {
          id
        }
        payment {
          id
          amountV2 {
            amount
          }
        }
      }
    }
  ''';

  static String checkoutWithFree = '''
    mutation checkoutCompleteFree(\$checkoutId: ID!) {
      checkoutCompleteFree(checkoutId: \$checkoutId) {
        userErrors {
          field
          message
        }
        checkout {
          id
        }
        payment {
          id
        }
      }
    }
  ''';

  static String getOrder = '''
    query(\$cursor: String, \$pageSize: Int, \$customerAccessToken: String!) {
      customer(customerAccessToken: \$customerAccessToken) {
        orders(first: \$pageSize, after: \$cursor, reverse: true) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            cursor
            node {
              id
              financialStatus
              processedAt
              orderNumber
              totalPriceV2{
                amount
              }
              statusUrl
              totalTaxV2 {
                amount
              }
              subtotalPriceV2 {
                amount
              }
              shippingAddress {
                address1
                address2
                city
                company
                country
                firstName
                id
                lastName
                zip
                provinceCode
                phone
                province
                name
                longitude
                latitude
                lastName
              }
              lineItems(first: \$pageSize) {
                pageInfo {
                  hasNextPage
                  hasPreviousPage
                }
                edges {
                  node {
                    quantity
                    title
                    originalTotalPrice{
                      amount
                    }
                    variant {
                      title
                      image {
                        ...imageInformation
                      }
                      price
                      selectedOptions {
                        name
                        value
                      }
                      product {
                        id
                        title
                        description
                        availableForSale
                        productType
                        onlineStoreUrl
                        options {
                          id
                          name
                          values
                        }
                        variants(first: 250) {
                          pageInfo {
                            hasNextPage
                            hasPreviousPage
                          }
                          edges {
                            node {
                              id
                              title
                              availableForSale
                              selectedOptions {
                                name
                                value
                              }
                              image {
                                ...imageInformation
                              }
                              price
                              compareAtPrice
                            }
                          }
                        }
                        images(first: 250) {
                          edges {
                            node {
                              ...imageInformation
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    $fragmentImage
  ''';

  static String getArticle = '''
    query(
    \$cursor: String
    \$pageSize: Int
    \$langCode: LanguageCode
    ) @inContext(language: \$langCode) {
        articles(
          first: \$pageSize 
          after: \$cursor
          sortKey: PUBLISHED_AT 
          reverse: true
          ) {
            pageInfo {
              hasNextPage
              hasPreviousPage
            }
            edges {
              cursor
              node {
                onlineStoreUrl
                title
                excerpt
                authorV2 {
                  name
                }
                id
                content
                contentHtml
                image {
                  ...imageInformation
                }
                publishedAt
              }
            }
          }
    }
    $fragmentImage
  ''';

  static String resetPassword = '''
    mutation customerRecover(\$email: String!) {
    customerRecover(email: \$email) {
      customerUserErrors {
        code
        field
        message
      }
    }
}
  ''';

  static String getProductByHandle = '''
   query (\$handle: String!) {
      productByHandle(handle: \$handle) {
        ...productInformation
      }
   }
   $fragmentProduct
''';

  static String getProductWithCategoryAndName = '''
   query (\$id: ID!) {
      collection(id: \$id) {
        products(first: \$pageSize, filters: [
          {
            
          }
          # {
          #   productType: "shoes"
          # },
          # {
          #   productVendor: "ACORELLE"
          # },
          # {
          #   productMetafield: {
          #     namespace: "custom",
          #     key:"type_de_cheveux",
          #     value :"Tous types de cheveux"
          #   }
          # }
          # {
          #   variantOption: {
          #       name: "color",
          #       value: "blue"
          #   }
          # }
        ]){
          nodes{
            ...productInformation
          }
        }
      }
   }
   $fragmentProduct
   ''';

  static String deleteToken = '''
    mutation customerAccessTokenDelete(\$customerAccessToken: String!) {
      customerAccessTokenDelete(customerAccessToken: \$customerAccessToken) {
        deletedAccessToken
        deletedCustomerAccessTokenId
        userErrors {
          field
          message
        }
      }
    }
  ''';

  static const fragmentUser = '''
      fragment userInformation on Customer {
        id
        email
        createdAt
        displayName
        phone
        firstName
        lastName
        defaultAddress {
          address1
          address2
          city
          firstName
          id
          lastName
          zip
          phone
          name
          latitude
          longitude
          province
          country
          countryCode
        }
        addresses(first: 10) {
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
          edges {
            node {
              address1
              address2
              city
              firstName
              id
              lastName
              zip
              phone
              name
              latitude
              longitude
              province
              country
              countryCode
            }
          }
        }
      }
  ''';

  static const fragmentProduct = '''
      fragment productInformation on Product {
          id
          title
          vendor
          description
          descriptionHtml
          totalInventory
          availableForSale
          productType
          onlineStoreUrl
          tags
          collections(first: 10) {
            edges {
              node {
                id
                title
              }
            }
          }
          options {
            id
            name
            values
          }
          variants(first: 250) {
            pageInfo {
              hasNextPage
              hasPreviousPage
            }
            edges {
              node {
                id
                title
                availableForSale
                quantityAvailable
                selectedOptions {
                  name
                  value
                }
                image {
                  ...imageInformation
                }
                priceV2 {
                  amount
                }
                compareAtPriceV2 {
                  amount
                }
                priceV2 {
                  amount
                  currencyCode
                }
                compareAtPriceV2 {
                  amount
                  currencyCode
                }
              }
            }
          }
          images(first: 250) {
            edges {
              node {
                ...imageInformation
              }
            }
          }
          featuredImage {
            ...imageInformation
          }
        }
        $fragmentImage
''';

  static const fragmentImage = '''
  fragment imageInformation on Image {
    url(transform: {maxWidth: $_imageWidth, maxHeight: $_imageHeight, scale: $_scale})
    width
    height
  }
  ''';
}
