program testClass;

uses
  rs2, rs2_error;
var
  r: TRs2;
begin
  r := TRs2.Create;
  r.free;
end.
