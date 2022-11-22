# Notas sobre la conversión

La libreria es declarada como externa y el tipo de llamada cdecl.

El nombre de la librería externa es realsense2. Se declara en el archivo rs_type.pas  como una constante en función del sistema operativo a compilar:

    const
    {$IFDEF MSWINDOWS}
      REALSENSE_DLL='realsense2.dll';
    {$ENDIF}
    {$IFDEF LINUX}
      REALSENSE_DLL='realsense2.so';
    {$ENDIF}   


## Funciones void

Las funciones void (que no retornan nada).

    void rs2_delete_context(rs2_context* context);

Se declaran en pascal como procedimientos (procedure)

    procedure rs2_delete_context(context: prs2_context); cdecl; external REALSENSE_DLL;    

## Funciones que retornan un puntero

Una función que retorna un punto como la siguiente:

    rs2_context* rs2_create_context(int api_version, rs2_error** error);

Es declarada como una funcion que devuelve un puntero. 

    type
      rs2_context = integer; //Tipo de dato que contiene el puntero
      prs2_context = ^rs2_context; //prs2_context será un puntero a rs2_context
      (...)
    function rs2_create_context(api_version: integer; aerror: Pointer): prs2_context;cdecl; external REALSENSE_DLL;




