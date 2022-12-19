unit rs2_options;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,
  rs_types,
  rs_option;

type
  Toption_range = record
    min: single;
    max: single;
    def: single;
    step: single;

  end;

type

  { TOptions }

  TOptions = class
  private
    fOptions: pRS2_options;
  public
      {
        check if particular option is supported
        param[in] option     option id to be checked
        return true if option is supported
      }
    function supports(option: trs2_option): boolean;
      {
        get option description
        param[in] option     option id to be checked
        return human-readable option description
       }
    function get_option_description(option: Trs2_option): string;

     {
         get option name
         param[in] option     option id to be checked
        return human-readable option name
     }
    function get_option_name(option: Trs2_option): string;
    {
        get option value description (in case specific option value hold special meaning)
        param[in] option     option id to be checked
        param[in] val      value of the option
        return human-readable description of a specific value of an option or null if no special meaning
       }
    function get_option_value_description(option: Trs2_option; val: single): string;
    {
        read option's value
        param[in] option   option id to be queried
        return value of the option
    }
    function get_option(option: Trs2_option): single;
    {
        retrieve the available range of values of a supported option
        return option  range containing minimum and maximum values, step and default value
    }
    function get_option_range(option: Trs2_option): Toption_range;
    {
        write new value to the option
        param[in] option     option id to be queried
        param[in] value      new value for the option
    }
    procedure set_option(option: Trs2_option; Value: single);
    {
        check if particular option is read-only
        param[in] option     option id to be checked
        return true if option is read-only
    }
    function is_option_read_only(option: Trs2_option): boolean;
    {get_supported_options()}
    function get_supported_options: TStringList;
    public
      constructor Create(dev:pRS2_device);
      destructor Destroy; override;
  end;

implementation
uses rs2_error;
{ TOptions }

function TOptions.supports(option: trs2_option): boolean;
var
  e: pRS2_error;
  valor: integer;
begin
  e := nil;
  valor := rs2_supports_option(fOptions,option, e);
  if e <> nil then
  begin
    TRsError.Create(e);
  end;
  Result := valor = 1;
end;

{ #todo : Pendiente de implementar }
function TOptions.get_option_description(option: Trs2_option): string;
begin

end;

{ #todo : Pendiente de implementar }
function TOptions.get_option_name(option: Trs2_option): string;
begin

end;

{ #todo : Pendiente de implementar }
function TOptions.get_option_value_description(option: Trs2_option;
  val: single): string;
begin

end;

{ #todo : Pendiente de implementar }
function TOptions.get_option(option: Trs2_option): single;
begin

end;

{ #todo : Pendiente de implementar }
function TOptions.get_option_range(option: Trs2_option): Toption_range;
begin

end;

{ #todo : Pendiente de implementar }
procedure TOptions.set_option(option: Trs2_option; Value: single);
begin

end;

{ #todo : Pendiente de implementar }
function TOptions.is_option_read_only(option: Trs2_option): boolean;
begin

end;

{ #todo : Pendiente de implementar }
function TOptions.get_supported_options: TStringList;
begin

end;

constructor TOptions.Create(dev: pRS2_device);
begin
 fOptions:=rs2_options_list(;
end;

destructor TOptions.Destroy;
begin
  inherited Destroy;
end;

end.
