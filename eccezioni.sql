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

/*
 ACCESS_INTO_NULL	    06530	-6530	It is raised when a null object is automatically assigned a value.
CASE_NOT_FOUND	        06592	-6592	It is raised when none of the choices in the WHEN clause of a CASE statement is selected, and there is no ELSE clause.
COLLECTION_IS_NULL	    06531	-6531	It is raised when a program attempts to apply collection methods other than EXISTS to an uninitialized nested table or varray, or the program attempts to assign values to the elements of an uninitialized nested table or varray.
DUP_VAL_ON_INDEX	    00001	-1	It is raised when duplicate values are attempted to be stored in a column with unique index.
INVALID_CURSOR	        01001	-1001	It is raised when attempts are made to make a cursor operation that is not allowed, such as closing an unopened cursor.
INVALID_NUMBER	        01722	-1722	It is raised when the conversion of a character string into a number fails because the string does not represent a valid number.
LOGIN_DENIED	        01017	-1017	It is raised when a program attempts to log on to the database with an invalid username or password.
NO_DATA_FOUND	        01403	+100	It is raised when a SELECT INTO statement returns no rows.
NOT_LOGGED_ON	        01012	-1012	It is raised when a database call is issued without being connected to the database.
PROGRAM_ERROR	        06501	-6501	It is raised when PL/SQL has an internal problem.
ROWTYPE_MISMATCH	    06504	-6504	It is raised when a cursor fetches value in a variable having incompatible data type.
SELF_IS_NULL	        30625	-30625	It is raised when a member method is invoked, but the instance of the object type was not initialized.
STORAGE_ERROR	        06500	-6500	It is raised when PL/SQL ran out of memory or memory was corrupted.
TOO_MANY_ROWS	        01422	-1422	It is raised when a SELECT INTO statement returns more than one row.
VALUE_ERROR	            06502	-6502	It is raised when an arithmetic, conversion, truncation, or sizeconstraint error occurs.
ZERO_DIVIDE	            01476	1476	It is raised when an attempt is made to divide a number by zero.
 */