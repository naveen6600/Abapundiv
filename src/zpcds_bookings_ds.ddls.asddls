@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PROJECTION VIEW FOR ZCDS_BOOKINGS_DS'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPCDS_BOOKINGS_DS  as projection on ZCDS_BOOKINGS_DS
{
     @Search.defaultSearchElement: true
  key TravelID,
      @Search.defaultSearchElement: true
  key BookingID,

      BookingDate,

      @Consumption.valueHelpDefinition: [{

          entity: {
              name: '/DMO/I_Customer',
              element: 'CustomerID'
          }}]
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      CustomerID,
      _Customer.FirstName as CustomerName,

      @Consumption.valueHelpDefinition: [{

         entity: {
             name: '/DMO/I_Carrier',
             element: 'AirlineID'
         }}]
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AirlineName']

      AirlineID,
      _Carrier.Name       as AirlineName,

      @Consumption.valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Flight',
              element: 'ConnectionID'
          },
          additionalBinding: [
              {localElement: 'FlightDate', element: 'FlightDate'},
              {localElement: 'AirlineID',element: 'AirlineID' },
              {localElement: 'FlightPrice',element: 'Price'},
              {localElement: 'CurrencyCode',element: 'CurrencyCode'}]
      }]
      ConnectionID,

      @Consumption.valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Flight',
              element: 'FlightDate'
          },
          additionalBinding: [
              {localElement: 'ConnectionID', element: 'ConnectionID'},
              {localElement: 'AirlineID',element: 'AirlineID' },
              {localElement: 'FlightPrice',element: 'Price'},
              {localElement: 'CurrencyCode',element: 'CurrencyCode'}]
      }]
      FlightDate, 

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      @Consumption.valueHelpDefinition: [{
         entity: {
             name: 'I_Currency',
             element: 'Currency'
         }}]

      CurrencyCode,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZPCDS_TRAVEL_DS
}
