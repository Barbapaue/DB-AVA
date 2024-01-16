-- CREATE TRIGGER <nome>
-- { BEFORE|AFTER|INSTEAD OF} <eventi>
-- ON <tabella>
-- <code block>

-- Trigger at row
-- CREATE TRIGGER <nome>
-- { BEFORE|AFTER|INSTEAD OF} <eventi>
-- ON <tabella>
-- [REFERENCING <riferimenti>]
-- FOR EACH ROW
-- [WHEN (<condizione>)] <code block>

-- <evento> ::= INSERT|DELETE|UPDATE [OF <colonne>]
-- <riferimento ::= OLD AS <nome vecchio valore>|
--                  NEW AS <nome nuovo valore>

create or replace trigger riordine
    after update of quantita
    on inventario
    when ( NEW.quantita < NEW.livelloMinimo )
    for each row
declare
    number x
begin
    select count(*)
    into x
    from ordini
    where codParte = NEW.codPArte;
    if x = 0 then
        insert into ordini values (NEW.codPArte, NEW.qtaRiordinate, sysdate)
    end if;
end;

-- Esempio
create or replace trigger audit_trigger
    before insert or update or delete
    on SUPERHEROES
    for each row
    enable
declare
    v_user Varchar2(30);
    v_date Varchar2(30);
begin
    select user, TO_CHAR(sysdate, '') into v_user, v_date from dual;

    if inserting then
        -- insert into ;
        DBMS_OUTPUT.PUT_LINE('inserting');
    elsif deleting then
        DBMS_OUTPUT.PUT_LINE('deleting');
    elsif updating then
        DBMS_OUTPUT.PUT_LINE('updating');
    end if;
end;

--backup
create or replace trigger backup_superheroes
    before insert or update or delete
    on SUPERHEROES
    for each row
    enable
begin
    if inserting then
        insert into SUPERHEROES_BACKUP (SH_NAME) values (:NEW.sh_name);
    elsif deleting then
        DBMS_OUTPUT.PUT_LINE('deleting');
    elsif updating then
        DBMS_OUTPUT.PUT_LINE('updating');
    end if;
end;

-- DOPO ogni DDL schema
create or replace trigger logging_operation
    after ddl on schema -- al posto di ddl di puo usare anche "create, alter o truncate"
begin
    DBMS_OUTPUT.PUT_LINE('dopo ogni ddl action');
end;