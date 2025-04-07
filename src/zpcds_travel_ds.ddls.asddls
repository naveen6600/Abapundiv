@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PROJECTION VIEW FOR ZCDS_TRAVEL_DS'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@UI:{ headerInfo: {
    typeName: 'Travel',
    typeNamePlural: 'Travels',
    title: {
        type: #STANDARD,
        value: 'TravelID'
    }
} }
define root view entity ZPCDS_TRAVEL_DS provider contract transactional_query as  projection on ZCDS_TRAVEL_DS
{
   key TravelId,

      @Consumption.valueHelpDefinition: [{

          entity: {
              name: '/DMO/I_Agency',
              element: 'AgencyID'
          }}]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name        as AgencyName,

      @Consumption.valueHelpDefinition: [{

               entity: {
                   name: '/DMO/I_Customer',
                   element: 'CustomerID'
               }}]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true

      CustomerId,
      _Customer.FirstName as CustomerName,

      BeginDate, 
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{

             entity: {
                 name: 'I_Currency',
                 element: 'Currency'
             }}]
      @Search.defaultSearchElement: true
      CurrencyCode,
      Description,
      Status,
      LastChangedAt,
      _Agency,
      _Booking : redirected to composition child ZPCDS_BOOKINGS_DS,
      _Currency,
      _Customer
}
