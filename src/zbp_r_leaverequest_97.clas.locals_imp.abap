CLASS LHC_ZR_LEAVEREQUEST_97 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR LeaveRequest
        RESULT result,

      validateDates FOR VALIDATE ON SAVE
            IMPORTING keys FOR LeaveRequest~validateDates,
      setInitialStatus FOR DETERMINE ON MODIFY
            IMPORTING keys FOR LeaveRequest~setInitialStatus.
ENDCLASS.

CLASS LHC_ZR_LEAVEREQUEST_97 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

 METHOD validateDates.
    " Entity verilerini okuyoruz
    READ ENTITIES OF ZR_LEAVEREQUEST_97 IN LOCAL MODE
      ENTITY LeaveRequest
      FIELDS ( BeginDate EndDate )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_leaverequest).

    " Kayıtlar üzerinde dönüp tarih kontrolü yapıyoruz
    LOOP AT lt_leaverequest INTO DATA(ls_leaverequest).
      IF ls_leaverequest-EndDate < ls_leaverequest-BeginDate.

        " 1. Hatalı kaydı FAILED tablosuna ekliyoruz (TO failed-leaverequest kısmı eksikti)
        APPEND VALUE #( %tky = ls_leaverequest-%tky ) TO failed-leaverequest.

        " 2. Kullanıcıya gösterilecek hata mesajını REPORTED tablosuna ekliyoruz
        APPEND VALUE #( %tky = ls_leaverequest-%tky
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text     = 'End date cannot be before begin date.' )
                      ) TO reported-leaverequest.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD setInitialStatus.

    " Read the leave request entities
    READ ENTITIES OF ZR_LEAVEREQUEST_97 IN LOCAL MODE
      ENTITY LeaveRequest
      FIELDS ( Status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_leaverequest).

    " Set the status to 'New' for all newly created requests

     LOOP AT lt_leaverequest INTO DATA(ls_leaverequest).
      IF ls_leaverequest-Status IS INITIAL.
        ls_leaverequest-Status = 'New'.
        MODIFY ENTITIES OF ZR_LEAVEREQUEST_97 IN LOCAL MODE
          ENTITY LeaveRequest
          UPDATE FIELDS ( Status )
          WITH VALUE #( ( %tky   = ls_leaverequest-%tky
                          Status = ls_leaverequest-Status ) ).
      ENDIF.
    ENDLOOP.
*    MODIFY ENTITIES OF ZR_LEAVEREQUEST_97 IN LOCAL MODE
*      ENTITY LeaveRequest
*      UPDATE FIELDS ( Status )
*      WITH VALUE #( FOR ls_req IN lt_leaverequest (
*                      %tky   = ls_req-%tky
*                      Status = 'New'
*                  ) ).
  ENDMETHOD.

ENDCLASS.
