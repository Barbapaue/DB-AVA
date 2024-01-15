create or replace NONEDITIONABLE PROCEDURE nome(v_cf IN VARCHAR2) IS
    v_name fornitore.nome%TYPE;
BEGIN
    SELECT nome INTO v_name FROM fornitore WHERE cf = v_cf;
    DBMS_OUTPUT.PUT_LINE(v_name);
END;
/
create or replace PROCEDURE add_to_fornitore(
    v_cf IN FORNITORE.CF%TYPE,
    v_name IN FORNITORE.NOME%TYPE
) IS
BEGIN
    INSERT INTO FORNITORE (CF, NOME) VALUES (v_cf, v_name);
end;