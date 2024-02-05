-- CURSORI IMPLICITI
create or replace procedure procedure_example is

begin
    update writer set amount = amount * 1.25 where freelancer = 'Y';
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows changed.');
    COMMIT;
end;
   /
DECLARE
   c_id customers.id%type;
   c_name customers.name%type;
   c_addr customers.address%type;
   CURSOR c_customers is
      SELECT id, name, address FROM customers;
BEGIN
   OPEN c_customers;
   LOOP
   FETCH c_customers into c_id, c_name, c_addr;
      EXIT WHEN c_customers%notfound;
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
   END LOOP;
   CLOSE c_customers;
END;
/
-- CURSORI ESPLICITI
create or replace procedure esempio_cursori is
    cursor writer_cursor (p_flstatus in writer.freelancer%TYPE) is
        select ln, phone
        from writer
        where freelancer = p_flstatus
        order by ln;
begin
    for vr_writer in writer_cursor
        loop
            -- implicit open/fetch
            DBMS_OUTPUT.PUT_LINE(rpad(vr_writer.ln, 40) || vr_writer.phone);
        end loop;
end;
/
-- CURSORI ESPLICITI FOR UPDATE
-- applica un lock alle righe selezionate per applicargli delle modifiche
create or replace procedure esmpio_cursore_update is
    cursor c_stud_zip is
        select s.student_id, z.city
        from student s,
             zipcode z
        where z.city = 'Roma'
          and s.zip = z.zip
            for update of phone
begin
    for r_stud_zip in c_stud_zip
        loop
            update student
            set phone = '333' || substr(phone, 4)
            where student_id = r_stud_zip.student_id; -- evolutiva where current of c_stud_zip
        end loop;
    commit;
end;
/
-- Esempio
declare
    cursor cursore_importi is
        select d_numf, sum(d_qta * d_prezzo) as importo
        from dettaglio
        where d_numf between 1 and 5
        group by d_numf;
    vr_importi cursore_importi%ROWTYPE;
begin
    fetch cursore_importi into vr_importi;
    exit when cursore_importi%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('la fattura: ' || vr_importi.d_numf || ' è di importo' || vr_importi.importo);
end;