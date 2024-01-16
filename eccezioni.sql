begin
    DBMS_OUTPUT.PUT_LINE('ciao');
exception
    WHEN NO_DATA_FOUND then
        DBMS_OUTPUT.PUT_LINE('no data found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('too many rows');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('non definito dal sistema ');
end;