@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VIEW FOR TRAVEL DATA'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_TRAVEL_DS as select from /dmo/travel as Travel
composition [0..*] of ZCDS_BOOKINGS_DS as _Booking
association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyId = _Agency.AgencyID
association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
key Travel.travel_id as TravelId,
Travel.agency_id as AgencyId,
Travel.customer_id as CustomerId,
Travel.begin_date as BeginDate,
Travel.end_date as EndDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
Travel.booking_fee as BookingFee,
@Semantics.amount.currencyCode: 'CurrencyCode'
Travel.total_price as TotalPrice,
Travel.currency_code as CurrencyCode,
Travel.description as Description,
Travel.status as Status,
Travel.lastchangedat as LastChangedAt,
_Booking,
_Agency,
_Customer,
_Currency
}
