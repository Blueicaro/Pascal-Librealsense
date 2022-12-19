unit rs2_error;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  rs_types;

type

  { TRsError }

  TRsError = class(Exception)
  private
    FErrorType: Trs2_exception_type;
    FErrorTypeDescription: string;
    FFailedArgs: string;
    FFuncionName: string;
  public
    property FailedArgs: string read FFailedArgs;
    property FuncionName: string read FFuncionName;
    property ErrorType: Trs2_exception_type read FErrorType;
    property ErrorTypeDescription: string read FErrorTypeDescription;
    constructor Create(aError: pRS2_error); overload;
  end;

implementation

{ TRsError }

constructor TRsError.Create(aError: pRS2_error);
var
  Cadena: string;
begin
  if aError <> nil then
  begin
    self.FFuncionName := rs2_get_failed_function(aError);
    self.Message := rs2_get_error_message(aError);
    self.FFailedArgs := rs2_get_failed_args(aError);
    self.FErrorType := rs2_get_librealsense_exception_type(aError);
    self.FErrorTypeDescription := rs2_exception_type_to_string(aError);
    rs2_free_error(aError);
  end;
end;

end.
