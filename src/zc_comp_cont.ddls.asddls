@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP2UI5 Component Container demo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zc_comp_cont
  as select from zi_comp_cont as country
{
      @ObjectModel.readOnly: true
      @EndUserText.label: 'Language'
  key country.Language    as Language,

      @ObjectModel.readOnly: true
      @EndUserText.label: 'Country'
  key country.Country     as Country,

      @ObjectModel.readOnly: true
      @EndUserText.label: 'Nationality'
      country.Nationality as Nationality
}
