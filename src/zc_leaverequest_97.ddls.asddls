@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZLeaveRequest_97', 
  Semantickey: [ 'LeaveRequestUUID' ]
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_LEAVEREQUEST_97
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_LEAVEREQUEST_97
  association [1..1] to ZR_LEAVEREQUEST_97 as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  LeaveRequestUUID,
  EmployeeID,
  EmployeeName,
  BeginDate,
  EndDate,
  LeaveType,
  Status,
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
