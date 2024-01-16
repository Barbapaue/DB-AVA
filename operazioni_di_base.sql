-- IF STATEMENT
DECLARE
    qty_in_hand NUMERIC(5);
BEGIN
    if qty_in_hand < 5 AND qty_in_hand = 5 then
        DBMS_OUTPUT.PUT_LINE('Qta minore o uguale a 5: ' || qty_in_hand);
    elsif qty_in_hand > 10 then
        DBMS_OUTPUT.PUT_LINE('Qta maggiore di 10: ' || qty_in_hand);
    else
        DBMS_OUTPUT.PUT_LINE('Qta di: ' || qty_in_hand);
    end if;
end;
/
-- LOOP STATEMENT
declare
    v_counter NUMERIC(2) := 1;
begin
    Loop
        EXIT when v_counter > 12;
        DBMS_OUTPUT.PUT_LINE(v_counter);
        v_counter := v_counter + 1;
    end loop;
end;
/
-- WHILE STATEMENT
declare
    v_counter NUMERIC(2) := 1;
begin
    WHILE v_counter <= 12
        LOOP
            DBMS_OUTPUT.PUT_LINE(v_counter);
            v_counter := v_counter + 1;
        end loop;
end;
/
-- FOR STATEMENT
declare

begin
    for v_counter in REVERSE 1 .. 10
        loop
            DBMS_OUTPUT.PUT_LINE(v_counter);
        end loop;
end;

