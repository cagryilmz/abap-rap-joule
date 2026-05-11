@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZLeaveRequest_97'
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'LeaveRequestUUID' ]
define root view entity ZR_LEAVEREQUEST_97
  as select from ZLEAVEREQUEST_97 as LeaveRequest
{
  key uuid as UUID,
  leave_request_uuid as LeaveRequestUUID,
  employee_id as EmployeeID,
  employee_name as EmployeeName,
  begin_date as BeginDate,
  end_date as EndDate,
  leave_type as LeaveType,
  status as Status,
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
