declare
    v_current_user VARCHAR2(50);
begin
    v_current_user := sys_context('USERENV', 'CURRENT_USER'); -- utente che ha fatto l'operazione
    -- esempio quando crei un tabella
    ORA_DICT_OBJ_NAME; -- nome della tabella create
    ORA_DICT_OBJ_TYPE; -- typo "tabella"
    ORA_SYSEVENT; -- se fai una "crate table" tornerà "crate"
end;