@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZAllocation97'
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'AllocationUUID' ]
define root view entity ZR_ALLOCATION97
  as select from ZALLOCATION97 as Allocation
{
  key uuid as UUID,
  allocation_uuid as AllocationUUID,
  employee_id as EmployeeID,
  employee_name as EmployeeName,
  equipment_type as EquipmentType,
  quantity as Quantity,
  @Semantics.amount.currencyCode: 'CurrencyField'
  equipment_value as EquipmentValue,
  begin_date as BeginDate,
  end_date as EndDate,
  status as Status,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_field as CurrencyField,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
