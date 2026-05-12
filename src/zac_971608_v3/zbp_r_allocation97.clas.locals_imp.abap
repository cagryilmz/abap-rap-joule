CLASS LHC_ZR_ALLOCATION97 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Allocation
        RESULT result,
      validateAllocation FOR VALIDATE ON SAVE
            IMPORTING keys FOR Allocation~validateAllocation,
      setInitialStatus FOR DETERMINE ON MODIFY
            IMPORTING keys FOR Allocation~setInitialStatus.
ENDCLASS.

CLASS LHC_ZR_ALLOCATION97 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD validateAllocation.

    READ ENTITIES OF ZR_allocation97 IN LOCAL MODE
      ENTITY Allocation
      FIELDS ( BeginDate EndDate Quantity ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_allocation).

    LOOP AT lt_allocation INTO DATA(ls_allocation).


      IF ls_allocation-EndDate < ls_allocation-BeginDate.
        APPEND VALUE #( %tky = ls_allocation-%tky ) TO failed-allocation.
      ENDIF.


      IF ls_allocation-Quantity <= 0.
         APPEND VALUE #( %tky = ls_allocation-%tky ) TO failed-allocation.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

METHOD setInitialStatus.

    READ ENTITIES OF ZR_allocation97 IN LOCAL MODE
      ENTITY Allocation
      FIELDS ( Status ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_allocation).


    DATA: lt_update TYPE TABLE FOR UPDATE ZR_allocation97\\Allocation.

    LOOP AT lt_allocation INTO DATA(ls_allocation).
      IF ls_allocation-Status IS INITIAL.
        APPEND VALUE #( %tky = ls_allocation-%tky
                        Status = 'Allocated'
                        %control-Status = if_abap_behv=>mk-on ) TO lt_update.
      ENDIF.
    ENDLOOP.


    IF lt_update IS NOT INITIAL.
      MODIFY ENTITIES OF ZR_allocation97 IN LOCAL MODE
        ENTITY Allocation
        UPDATE FROM lt_update
        REPORTED DATA(ls_reported).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
