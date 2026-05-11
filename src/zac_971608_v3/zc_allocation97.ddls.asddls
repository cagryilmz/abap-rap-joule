@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZAllocation97', 
  Semantickey: [ 'AllocationUUID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_ALLOCATION97
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ALLOCATION97
  association [1..1] to ZR_ALLOCATION97 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  AllocationUUID,
  EmployeeID,
  EmployeeName,
  EquipmentType,
  Quantity,
  @Semantics: {
    Amount.Currencycode: 'CurrencyField'
  }
  EquipmentValue,
  BeginDate,
  EndDate,
  Status,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  CurrencyField,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
