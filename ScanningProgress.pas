{*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*}
unit ScanningProgress;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls;

type

  { TScanningProgressF }

  TScanningProgressF = class(TForm)
    ScanningL: TLabel;
    ScanningPB: TProgressBar;
  private

  public

  end;

var
  ScanningProgressF: TScanningProgressF;

implementation

{$R *.lfm}

{ TScanningProgressF }

end.

