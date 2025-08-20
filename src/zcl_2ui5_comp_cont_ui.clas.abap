class ZCL_2UI5_COMP_CONT_UI definition
  public
  final
  create public .

public section.

  interfaces IF_SERIALIZABLE_OBJECT .
  interfaces Z2UI5_IF_APP .

  data MT_STARTUP_PARAMS type Z2UI5_IF_TYPES=>TY_T_NAME_VALUE .
  data MV_CHECK_INITIALIZED type ABAP_BOOL .
protected section.
private section.
ENDCLASS.



CLASS ZCL_2UI5_COMP_CONT_UI IMPLEMENTATION.


  METHOD z2ui5_if_app~main.
    IF me->mv_check_initialized = abap_false.
      me->mv_check_initialized = abap_true.
* -------------------------------------------------------------------------------------------------
* INITIALIZATION
* -------------------------------------------------------------------------------------------------
* ---------- Get startup parameters ---------------------------------------------------------------
      me->mt_startup_params = client->get( )-t_comp_params.

      IF me->mt_startup_params IS INITIAL.
        client->message_box_display( text = 'Startup parameters are missing'
                                     type = `error`  ).
        RETURN.
      ENDIF.

* -------------------------------------------------------------------------------------------------
* RENDERING
* -------------------------------------------------------------------------------------------------
* ---------- Set view -----------------------------------------------------------------------------
      DATA(lr_view) = z2ui5_cl_xml_view=>factory( ).

* ---------- Set page -----------------------------------------------------------------------------
      DATA(lr_page) = lr_view->page( showheader = abap_false
                                     backgrounddesign = 'List' )->content( ).


* ---------- Grid ---------------------------------------------------------------------------------
      DATA(lr_grid) = lr_page->grid( 'L3 M12 S12' )->content( 'layout' ).

* ---------- Form --------------------------------------------------------------------
      lr_grid->simple_form( layout = 'ResponsiveGridLayout'
          )->content( 'form'
              )->label( 'Language'
              )->text( text = me->mt_startup_params[ 2 ]-v ).

* ---------- Form --------------------------------------------------------------------
      lr_grid->simple_form( layout = 'ResponsiveGridLayout'
          )->content( 'form'
              )->label( 'Country'
              )->text( text = me->mt_startup_params[ 3 ]-v  ).

* ---------- Form --------------------------------------------------------------------
      lr_grid->simple_form( layout = 'ResponsiveGridLayout'
          )->content( 'form'
              )->label( 'Nationality'
              )->text( text = me->mt_startup_params[ 4 ]-v  ).

* ---------- Stringify the XML view ---------------------------------------------------------------
      client->view_display( lr_view->stringify( ) ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
