{*
  Fosca Driver
  Licensed under the GNU LGPLv3. See the LICENSE file in this repository.
*}
unit JTPumpDriverMain3;

{$mode objfpc}{$H+}{$R+}{$Q+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus, Math,
  StdCtrls, ExtCtrls, Spin, Buttons, LCLType, Registry, Process, SynaSer,
  Crt, StrUtils, PopupNotifier, Character, System.UITypes, Fileinfo,
  // the custom forms
  ScanningProgress, SerialUSBSelection, PumpNameSetting, AboutForm, Types;

type

  { TMainForm }

  TMainForm = class(TForm)
    ActionsGB: TGroupBox;
    DriverConnectBB: TBitBtn;
    DriverConnectionGB: TGroupBox;
    GenerateCommandBB: TBitBtn;
    HaveSerialCB: TCheckBox;
    IconImageYellow: TImage;
    IconImageGreen: TImage;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    LoadedActionFileL: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    LiveModeCB: TCheckBox;
    DutyCycle1FSE: TFloatSpinEdit;
    DutyCycle2FSE: TFloatSpinEdit;
    DutyCycle3FSE: TFloatSpinEdit;
    DutyCycle4FSE: TFloatSpinEdit;
    DutyCycle5FSE: TFloatSpinEdit;
    DutyCycle6FSE: TFloatSpinEdit;
    DutyCycle7FSE: TFloatSpinEdit;
    ActionTime1GB: TGroupBox;
    ActionTime2GB: TGroupBox;
    ActionTime3GB: TGroupBox;
    ActionTime4GB: TGroupBox;
    ActionTime5GB: TGroupBox;
    ActionTime6GB: TGroupBox;
    ActionTime7GB: TGroupBox;
    DutyCycle1GB: TGroupBox;
    DutyCycle2GB: TGroupBox;
    DutyCycle3GB: TGroupBox;
    DutyCycle4GB: TGroupBox;
    DutyCycle5GB: TGroupBox;
    DutyCycle6GB: TGroupBox;
    DutyCycle7GB: TGroupBox;
    CommandL: TLabel;
    CommandM: TMemo;
    FirmwareUpdateMI: TMenuItem;
    AboutMI: TMenuItem;
    FirmwareFileDialog: TOpenDialog;
    FirmwareNote: TPopupNotifier;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    GetFirmwareVersionMI: TMenuItem;
    Label23: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    LoadActionMI: TMenuItem;
    LoadedActionFileM: TMemo;
    FirmwareResetMI: TMenuItem;
    ActionCommandSplitter: TPanel;
    Pump1ResultLE1: TLabeledEdit;
    Pump2ResultLE1: TLabeledEdit;
    Pump3ResultLE1: TLabeledEdit;
    Pump4ResultLE1: TLabeledEdit;
    Pump5ResultLE1: TLabeledEdit;
    Pump6ResultLE1: TLabeledEdit;
    Pump7ResultLE1: TLabeledEdit;
    Pump8ResultLE1: TLabeledEdit;
    Pump1ResultLE2: TLabeledEdit;
    Pump2ResultLE2: TLabeledEdit;
    Pump3ResultLE2: TLabeledEdit;
    Pump4ResultLE2: TLabeledEdit;
    Pump5ResultLE2: TLabeledEdit;
    Pump6ResultLE2: TLabeledEdit;
    Pump7ResultLE2: TLabeledEdit;
    Pump8ResultLE2: TLabeledEdit;
    Pump1ResultLE3: TLabeledEdit;
    Pump2ResultLE3: TLabeledEdit;
    Pump3ResultLE3: TLabeledEdit;
    Pump4ResultLE3: TLabeledEdit;
    Pump5ResultLE3: TLabeledEdit;
    Pump6ResultLE3: TLabeledEdit;
    Pump7ResultLE3: TLabeledEdit;
    Pump8ResultLE3: TLabeledEdit;
    Pump1ResultLE4: TLabeledEdit;
    Pump2ResultLE4: TLabeledEdit;
    Pump3ResultLE4: TLabeledEdit;
    Pump4ResultLE4: TLabeledEdit;
    Pump5ResultLE4: TLabeledEdit;
    Pump6ResultLE4: TLabeledEdit;
    Pump7ResultLE4: TLabeledEdit;
    Pump8ResultLE4: TLabeledEdit;
    Pump1ResultLE5: TLabeledEdit;
    Pump2ResultLE5: TLabeledEdit;
    Pump3ResultLE5: TLabeledEdit;
    Pump4ResultLE5: TLabeledEdit;
    Pump5ResultLE5: TLabeledEdit;
    Pump6ResultLE5: TLabeledEdit;
    Pump7ResultLE5: TLabeledEdit;
    Pump8ResultLE5: TLabeledEdit;
    Pump1ResultLE6: TLabeledEdit;
    Pump2ResultLE6: TLabeledEdit;
    Pump3ResultLE6: TLabeledEdit;
    Pump4ResultLE6: TLabeledEdit;
    Pump5ResultLE6: TLabeledEdit;
    Pump6ResultLE6: TLabeledEdit;
    Pump7ResultLE6: TLabeledEdit;
    Pump8ResultLE6: TLabeledEdit;
    Pump1ResultLE7: TLabeledEdit;
    Pump2ResultLE7: TLabeledEdit;
    Pump3ResultLE7: TLabeledEdit;
    Pump4ResultLE7: TLabeledEdit;
    Pump5ResultLE7: TLabeledEdit;
    Pump6ResultLE7: TLabeledEdit;
    Pump7ResultLE7: TLabeledEdit;
    Pump8ResultLE7: TLabeledEdit;
    Pump5DirectionRG1: TRadioGroup;
    Pump5DirectionRG2: TRadioGroup;
    Pump5DirectionRG3: TRadioGroup;
    Pump5DirectionRG4: TRadioGroup;
    Pump5DirectionRG5: TRadioGroup;
    Pump5DirectionRG6: TRadioGroup;
    Pump5DirectionRG7: TRadioGroup;
    Pump5GB1: TGroupBox;
    Pump5GB2: TGroupBox;
    Pump5GB3: TGroupBox;
    Pump5GB4: TGroupBox;
    Pump5GB5: TGroupBox;
    Pump5GB6: TGroupBox;
    Pump5GB7: TGroupBox;
    Pump5OnOffCB1: TCheckBox;
    Pump5OnOffCB2: TCheckBox;
    Pump5OnOffCB3: TCheckBox;
    Pump5OnOffCB4: TCheckBox;
    Pump5OnOffCB5: TCheckBox;
    Pump5OnOffCB6: TCheckBox;
    Pump5OnOffCB7: TCheckBox;
    Pump5VoltageFS1: TFloatSpinEdit;
    Pump5VoltageFS2: TFloatSpinEdit;
    Pump5VoltageFS3: TFloatSpinEdit;
    Pump5VoltageFS4: TFloatSpinEdit;
    Pump5VoltageFS5: TFloatSpinEdit;
    Pump5VoltageFS6: TFloatSpinEdit;
    Pump5VoltageFS7: TFloatSpinEdit;
    Pump6DirectionRG1: TRadioGroup;
    Pump6DirectionRG2: TRadioGroup;
    Pump6DirectionRG3: TRadioGroup;
    Pump6DirectionRG4: TRadioGroup;
    Pump6DirectionRG5: TRadioGroup;
    Pump6DirectionRG6: TRadioGroup;
    Pump6DirectionRG7: TRadioGroup;
    Pump6GB1: TGroupBox;
    Pump6GB2: TGroupBox;
    Pump6GB3: TGroupBox;
    Pump6GB4: TGroupBox;
    Pump6GB5: TGroupBox;
    Pump6GB6: TGroupBox;
    Pump6GB7: TGroupBox;
    Pump6OnOffCB1: TCheckBox;
    Pump6OnOffCB2: TCheckBox;
    Pump6OnOffCB3: TCheckBox;
    Pump6OnOffCB4: TCheckBox;
    Pump6OnOffCB5: TCheckBox;
    Pump6OnOffCB6: TCheckBox;
    Pump6OnOffCB7: TCheckBox;
    Pump6VoltageFS1: TFloatSpinEdit;
    Pump6VoltageFS2: TFloatSpinEdit;
    Pump6VoltageFS3: TFloatSpinEdit;
    Pump6VoltageFS4: TFloatSpinEdit;
    Pump6VoltageFS5: TFloatSpinEdit;
    Pump6VoltageFS6: TFloatSpinEdit;
    Pump6VoltageFS7: TFloatSpinEdit;
    Pump7DirectionRG1: TRadioGroup;
    Pump7DirectionRG2: TRadioGroup;
    Pump7DirectionRG3: TRadioGroup;
    Pump7DirectionRG4: TRadioGroup;
    Pump7DirectionRG5: TRadioGroup;
    Pump7DirectionRG6: TRadioGroup;
    Pump7DirectionRG7: TRadioGroup;
    Pump7GB1: TGroupBox;
    Pump7GB2: TGroupBox;
    Pump7GB3: TGroupBox;
    Pump7GB4: TGroupBox;
    Pump7GB5: TGroupBox;
    Pump7GB6: TGroupBox;
    Pump7GB7: TGroupBox;
    Pump7OnOffCB1: TCheckBox;
    Pump7OnOffCB2: TCheckBox;
    Pump7OnOffCB3: TCheckBox;
    Pump7OnOffCB4: TCheckBox;
    Pump7OnOffCB5: TCheckBox;
    Pump7OnOffCB6: TCheckBox;
    Pump7OnOffCB7: TCheckBox;
    Pump7VoltageFS1: TFloatSpinEdit;
    Pump7VoltageFS2: TFloatSpinEdit;
    Pump7VoltageFS3: TFloatSpinEdit;
    Pump7VoltageFS4: TFloatSpinEdit;
    Pump7VoltageFS5: TFloatSpinEdit;
    Pump7VoltageFS6: TFloatSpinEdit;
    Pump7VoltageFS7: TFloatSpinEdit;
    Pump8DirectionRG1: TRadioGroup;
    Pump8DirectionRG2: TRadioGroup;
    Pump8DirectionRG3: TRadioGroup;
    Pump8DirectionRG4: TRadioGroup;
    Pump8DirectionRG5: TRadioGroup;
    Pump8DirectionRG6: TRadioGroup;
    Pump8DirectionRG7: TRadioGroup;
    Pump8GB1: TGroupBox;
    Pump8GB2: TGroupBox;
    Pump8GB3: TGroupBox;
    Pump8GB4: TGroupBox;
    Pump8GB5: TGroupBox;
    Pump8GB6: TGroupBox;
    Pump8GB7: TGroupBox;
    Pump8OnOffCB1: TCheckBox;
    Pump8OnOffCB2: TCheckBox;
    Pump8OnOffCB3: TCheckBox;
    Pump8OnOffCB4: TCheckBox;
    Pump8OnOffCB5: TCheckBox;
    Pump8OnOffCB6: TCheckBox;
    Pump8OnOffCB7: TCheckBox;
    Pump8VoltageFS1: TFloatSpinEdit;
    Pump8VoltageFS2: TFloatSpinEdit;
    Pump8VoltageFS3: TFloatSpinEdit;
    Pump8VoltageFS4: TFloatSpinEdit;
    Pump8VoltageFS5: TFloatSpinEdit;
    Pump8VoltageFS6: TFloatSpinEdit;
    Pump8VoltageFS7: TFloatSpinEdit;
    PumpNumberL: TLabel;
    PumpNumberSE: TSpinEdit;
    PumpSetupGB: TGroupBox;
    RunBB: TBitBtn;
    S2P14: TTabSheet;
    S3P14: TTabSheet;
    S4P14: TTabSheet;
    S5P14: TTabSheet;
    S6P14: TTabSheet;
    S7P14: TTabSheet;
    S2P58: TTabSheet;
    S1PC: TPageControl;
    S3P58: TTabSheet;
    S4P58: TTabSheet;
    S5P58: TTabSheet;
    S6P58: TTabSheet;
    S7P58: TTabSheet;
    S2PC: TPageControl;
    S3PC: TPageControl;
    S4PC: TPageControl;
    S5PC: TPageControl;
    S6PC: TPageControl;
    S7PC: TPageControl;
    SaveActionMI: TMenuItem;
    FileMI: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    StepTimer1: TTimer;
    StepTimer2: TTimer;
    StepTimer3: TTimer;
    StepTimer4: TTimer;
    StepTimer5: TTimer;
    StepTimer6: TTimer;
    StepTimer7: TTimer;
    StopBB: TBitBtn;
    StopTimer: TTimer;
    StartTimeLE: TLabeledEdit;
    FinishTimeLE: TLabeledEdit;
    S1P14: TTabSheet;
    S1P58: TTabSheet;
    TotalTimeLE: TLabeledEdit;
    RunTime1FSE: TFloatSpinEdit;
    RunTime2FSE: TFloatSpinEdit;
    RunTime3FSE: TFloatSpinEdit;
    RunTime4FSE: TFloatSpinEdit;
    RunTime5FSE: TFloatSpinEdit;
    RunTime6FSE: TFloatSpinEdit;
    RunTime7FSE: TFloatSpinEdit;
    RunSettingsGB: TGroupBox;
    StatusGB: TGroupBox;
    IndicatorPanelP: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Pump1DirectionRG1: TRadioGroup;
    Pump1DirectionRG2: TRadioGroup;
    Pump1DirectionRG3: TRadioGroup;
    Pump1DirectionRG4: TRadioGroup;
    Pump1DirectionRG5: TRadioGroup;
    Pump1DirectionRG6: TRadioGroup;
    Pump1DirectionRG7: TRadioGroup;
    Pump1GB1: TGroupBox;
    Pump1GB2: TGroupBox;
    Pump1GB3: TGroupBox;
    Pump1GB4: TGroupBox;
    Pump1GB5: TGroupBox;
    Pump1GB6: TGroupBox;
    Pump1GB7: TGroupBox;
    Pump1OnOffCB1: TCheckBox;
    Pump1OnOffCB2: TCheckBox;
    Pump1OnOffCB3: TCheckBox;
    Pump1OnOffCB4: TCheckBox;
    Pump1OnOffCB5: TCheckBox;
    Pump1OnOffCB6: TCheckBox;
    Pump1OnOffCB7: TCheckBox;
    Pump1VoltageFS1: TFloatSpinEdit;
    Pump1VoltageFS2: TFloatSpinEdit;
    Pump1VoltageFS3: TFloatSpinEdit;
    Pump1VoltageFS4: TFloatSpinEdit;
    Pump1VoltageFS5: TFloatSpinEdit;
    Pump1VoltageFS6: TFloatSpinEdit;
    Pump1VoltageFS7: TFloatSpinEdit;
    Pump2DirectionRG1: TRadioGroup;
    Pump2DirectionRG2: TRadioGroup;
    Pump2DirectionRG3: TRadioGroup;
    Pump2DirectionRG4: TRadioGroup;
    Pump2DirectionRG5: TRadioGroup;
    Pump2DirectionRG6: TRadioGroup;
    Pump2DirectionRG7: TRadioGroup;
    Pump2GB1: TGroupBox;
    Pump2GB2: TGroupBox;
    Pump2GB3: TGroupBox;
    Pump2GB4: TGroupBox;
    Pump2GB5: TGroupBox;
    Pump2GB6: TGroupBox;
    Pump2GB7: TGroupBox;
    Pump2OnOffCB1: TCheckBox;
    Pump2OnOffCB2: TCheckBox;
    Pump2OnOffCB3: TCheckBox;
    Pump2OnOffCB4: TCheckBox;
    Pump2OnOffCB5: TCheckBox;
    Pump2OnOffCB6: TCheckBox;
    Pump2OnOffCB7: TCheckBox;
    Pump2VoltageFS1: TFloatSpinEdit;
    Pump2VoltageFS2: TFloatSpinEdit;
    Pump2VoltageFS3: TFloatSpinEdit;
    Pump2VoltageFS4: TFloatSpinEdit;
    Pump2VoltageFS5: TFloatSpinEdit;
    Pump2VoltageFS6: TFloatSpinEdit;
    Pump2VoltageFS7: TFloatSpinEdit;
    Pump3DirectionRG1: TRadioGroup;
    Pump3DirectionRG2: TRadioGroup;
    Pump3DirectionRG3: TRadioGroup;
    Pump3DirectionRG4: TRadioGroup;
    Pump3DirectionRG5: TRadioGroup;
    Pump3DirectionRG6: TRadioGroup;
    Pump3DirectionRG7: TRadioGroup;
    Pump3GB1: TGroupBox;
    Pump3GB2: TGroupBox;
    Pump3GB3: TGroupBox;
    Pump3GB4: TGroupBox;
    Pump3GB5: TGroupBox;
    Pump3GB6: TGroupBox;
    Pump3GB7: TGroupBox;
    Pump3OnOffCB1: TCheckBox;
    Pump3OnOffCB2: TCheckBox;
    Pump3OnOffCB3: TCheckBox;
    Pump3OnOffCB4: TCheckBox;
    Pump3OnOffCB5: TCheckBox;
    Pump3OnOffCB6: TCheckBox;
    Pump3OnOffCB7: TCheckBox;
    Pump3VoltageFS1: TFloatSpinEdit;
    Pump3VoltageFS2: TFloatSpinEdit;
    Pump3VoltageFS3: TFloatSpinEdit;
    Pump3VoltageFS4: TFloatSpinEdit;
    Pump3VoltageFS5: TFloatSpinEdit;
    Pump3VoltageFS6: TFloatSpinEdit;
    Pump3VoltageFS7: TFloatSpinEdit;
    Pump4DirectionRG1: TRadioGroup;
    Pump4DirectionRG2: TRadioGroup;
    Pump4DirectionRG3: TRadioGroup;
    Pump4DirectionRG4: TRadioGroup;
    Pump4DirectionRG5: TRadioGroup;
    Pump4DirectionRG6: TRadioGroup;
    Pump4DirectionRG7: TRadioGroup;
    Pump4GB1: TGroupBox;
    Pump4GB2: TGroupBox;
    Pump4GB3: TGroupBox;
    Pump4GB4: TGroupBox;
    Pump4GB5: TGroupBox;
    Pump4GB6: TGroupBox;
    Pump4GB7: TGroupBox;
    Pump4OnOffCB1: TCheckBox;
    Pump4OnOffCB2: TCheckBox;
    Pump4OnOffCB3: TCheckBox;
    Pump4OnOffCB4: TCheckBox;
    Pump4OnOffCB5: TCheckBox;
    Pump4OnOffCB6: TCheckBox;
    Pump4OnOffCB7: TCheckBox;
    Pump4VoltageFS1: TFloatSpinEdit;
    Pump4VoltageFS2: TFloatSpinEdit;
    Pump4VoltageFS3: TFloatSpinEdit;
    Pump4VoltageFS4: TFloatSpinEdit;
    Pump4VoltageFS5: TFloatSpinEdit;
    Pump4VoltageFS6: TFloatSpinEdit;
    Pump4VoltageFS7: TFloatSpinEdit;
    RepeatL: TLabel;
    RepeatOutputLE: TLabeledEdit;
    RepeatPC: TPageControl;
    RepeatSE: TSpinEdit;
    RunEndlessCB: TCheckBox;
    Step1TS: TTabSheet;
    Step1UseCB: TCheckBox;
    Step2TS: TTabSheet;
    Step2UseCB: TCheckBox;
    Step3TS: TTabSheet;
    Step3UseCB: TCheckBox;
    Step4TS: TTabSheet;
    Step4UseCB: TCheckBox;
    Step5TS: TTabSheet;
    Step5UseCB: TCheckBox;
    Step6TS: TTabSheet;
    Step6UseCB: TCheckBox;
    Step7TS: TTabSheet;
    Step7UseCB: TCheckBox;
    ConnectionMI: TMenuItem;
    MiscellaneousMI: TMenuItem;
    ConnComPortLE: TLabeledEdit;
    MainMenu: TMainMenu;
    OverallTimer: TTimer;
    RepeatTimer: TTimer;
    Unit1RBh: TRadioButton;
    Unit2RBh: TRadioButton;
    Unit3RBh: TRadioButton;
    Unit4RBh: TRadioButton;
    Unit5RBh: TRadioButton;
    Unit6RBh: TRadioButton;
    Unit7RBh: TRadioButton;
    Unit1RBmin: TRadioButton;
    Unit2RBmin: TRadioButton;
    Unit3RBmin: TRadioButton;
    Unit4RBmin: TRadioButton;
    Unit5RBmin: TRadioButton;
    Unit6RBmin: TRadioButton;
    Unit7RBmin: TRadioButton;
    Unit1RBs: TRadioButton;
    Unit2RBs: TRadioButton;
    Unit3RBs: TRadioButton;
    Unit4RBs: TRadioButton;
    Unit5RBs: TRadioButton;
    Unit6RBs: TRadioButton;
    Unit7RBs: TRadioButton;
    procedure AboutMIClick(Sender: TObject);
    procedure ConnectionMIClick(Sender: TObject);
    procedure ConnectionStart(Sender: TObject; Connect: Boolean);
    procedure DriverConnectBBClick(Sender: TObject);
    procedure DutyCycleXFSEChange(Sender: TObject);
    procedure FirmwareUpdateMIClick(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const {%H-}FileNames: array of String);
    procedure GenerateCommandBBClick(Sender: TObject);
    procedure GetFirmwareVersionMIClick(Sender: TObject);
    procedure HaveSerialCBChange(Sender: TObject);
    procedure LiveModeCBChange(Sender: TObject);
    procedure LoadActionMIClick(Sender: TObject);
    procedure FirmwareResetMIClick(Sender: TObject);
    procedure OverallTimerStartTimer(Sender: TObject);
    procedure OverallTimerStopTimer(Sender: TObject);
    procedure PumpNumberSEChange(Sender: TObject);
    procedure PumpVoltageFSChange(Sender: TObject);
    procedure PumpGBDblClick(Sender: TObject);
    procedure PumpOnOffCBLoopChange(Sender: TObject);
    procedure RepeatPCChange(Sender: TObject);
    procedure RunBBClick(Sender: TObject);
    procedure RunEndlessCBChange(Sender: TObject);
    procedure RunFreeBBClick(Sender: TObject);
    procedure SaveActionMIClick(Sender: TObject);
    procedure StepXUseCBChange(Sender: TObject);
    procedure StepTimerXFinished(Sender: TObject);
    procedure StepTimerLastFinished(Sender: TObject);
    procedure StopBBClick(Sender: TObject);
    procedure StopTimerFinished;
    procedure OverallTimerFinished;
    procedure RepeatTimerFinished;
  private

  public
    procedure FirmwareUpdate(forced: Boolean);
    function GenerateCommand(out command: string): Boolean;
    procedure RunImmediate;
    function ParseCommand(command: string): Boolean;
    function DialogWithPos(const Message: string; DialogType: TMsgDlgType;
              Buttons: TMsgDlgButtons; AX, AY: Integer): TModalResult;
    function OpenFile(InputName: string): Boolean;
    function SaveHandling(InName: string; const Calculation: Boolean): string;
    procedure CloseSerialConn;
    procedure SendRepeatToPump;
    procedure COMPortScan;
    procedure DisconnectPumpDriver;
    procedure LoadAppearance(iniFile: string);
    procedure SaveAppearance(iniFile: string);

  end;

var
  MainForm : TMainForm;
  Version : string = '';
  FirmwareVersion : string = 'unknown';
  RequiredFirmwareVersion : float = 2.0;
  ser: TBlockSerial;
  CurrentRepeat : integer;
  GlobalTime : Double = 0;
  GlobalRepeatTime : Double = 0;
  RepeatTime : Double = 0;
  COMList : array of Int32; // list with available pump drivers (list index is COM port number)
  InName : string = ''; // name of load file
  DropfileName : string = ''; // name of dropped file
  StepNum : integer = 7; // number of steps
  PumpNum : integer = 8; // number of pumps
  PumpNumFile : integer = 4; // number of pumps defined in a loaded action file
  PumpPrefix : string = 'Pump: '; // line prefix for action files
  connectedPumpName : string = ''; // name of connected pump (COM ore ID)
  connectedPumpDriver : longint = 0; // ID of the connected pump driver
  commandForRepeat : string; // stores the command sent on every repeat
  oneDay : longint = 86400000; // time of one day in ms
  const AppearanceFile : string = 'Appearance-JT-PD.ini'; // filename to store appearance

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
var
 iniFile : string;
 FileVerInfo: TFileVersionInfo;
begin
 try
  FileVerInfo:= TFileVersionInfo.Create(nil);
  FileVerInfo.ReadFileInfo;
  Version:= FileVerInfo.VersionStrings.Values['ProductVersion'];
 finally
  FileVerInfo.Free;
 end;
 MainForm.Caption:= Application.Title + ' ' + Version;
 DefaultFormatSettings.DecimalSeparator:= '.'; // we use English numbers

 // explicitly set there because the IDE always
 // stores initial values with trailing LineEnding
 LoadedActionFileM.Text:= 'None';

 // load file directly if it was provided via command line
 if ParamStr(1) <> '' then
  begin
   DropfileName:= ParamStr(1);
   LoadActionMIClick(Sender);
   DropfileName:= '';
  end;

 // load the current appearance settings
 // we load from the same folder than the program .exe
 iniFile:= ExtractFilePath(Application.ExeName) + AppearanceFile;
 if FileExists(iniFile) then
  LoadAppearance(iniFile);

end;

procedure TMainForm.ConnectionMIClick(Sender: TObject);
begin
 ConnectionStart(Sender, true); // always call to connect
end;

procedure TMainForm.DisconnectPumpDriver;
var
 command : string;
 i : integer;
begin
 ConnComPortLE.Color:= clHighlight;
 ConnComPortLE.Text:= 'Not connected';
 IndicatorPanelP.Caption:= '';
 IndicatorPanelP.Color:= clDefault;
 // disable all buttons
 RunBB.Enabled:= false;
 StopBB.Enabled:= false;
 if HaveSerialCB.Checked then
 begin
  // stop pumps
  command:= '/0I';
  for i:= 1 to PumpNum do
   command:= command + '0';
  // blink 3 times
  command:= command + 'gLM500lM500G2R' + LineEnding;
  ser.SendString(command);
  CloseSerialConn;
  IndicatorPanelP.Caption:= 'Pumps stopped';
  IndicatorPanelP.Color:= clHighlight;
 end;
end;

procedure TMainForm.ConnectionStart(Sender: TObject; Connect: Boolean);
// opens the connection settings dialog and opens a connections according
// to the dialog input
var
 command, COMPort : string;
 Reg : TRegistry;
 i, k, COMNumber, Channel, COMIndex : integer;
 FirmwareNumber : double = 0.0;
 MousePointer : TPoint;
 gotFirmwareNumber : Boolean = false;
 COMArray : array of string;
begin
 // initialize
 MousePointer:= Mouse.CursorPos;
 COMArray:= [''];
 // enable all menus because they would be disabled when formerly
 // connected to an unknown device
 GetFirmwareVersionMI.Enabled:= true;
 FirmwareUpdateMI.Enabled:= true;
 FirmwareResetMI.Enabled:= true;

 if not Connect then
 begin
  DisconnectPumpDriver;
  exit;
 end;

 // determine all possible COM ports
 Reg:= TRegistry.Create;
 try
  Reg.RootKey:= HKEY_LOCAL_MACHINE;
  if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
  begin
   with SerialUSBSelectionF do
   begin
    SerialUSBPortCB.Items.Clear;
    SerialUSBPortCB.Sorted:= false;
    Reg.GetValueNames(SerialUSBPortCB.Items);
    for i:= 0 to SerialUSBPortCB.Items.Count - 1 do
     SerialUSBPortCB.Items[i]:= Reg.ReadString(SerialUSBPortCB.Items[i]);
    SerialUSBPortCB.Sorted:= true;
   end;
  end;
 finally
  Reg.Free;
 end;

 // scan for pump drivers
 COMPortScan;

 with SerialUSBSelectionF do
 begin
  // remove all entries that are no pump drivers
  i:= 0;
  While i < SerialUSBPortCB.Items.Count do
  begin
   COMNumber:= StrToInt(Copy(SerialUSBPortCB.Items[i], 4, 4));
   if COMList[COMNumber] < 1 then
    SerialUSBPortCB.Items.Delete(i)
   else
    inc(i);
  end;

  // output driver ID
  SerialUSBPortCB.Sorted:= false;
  SetLength(COMArray, SerialUSBPortCB.Items.Count);
  for i:= 0 to SerialUSBPortCB.Items.Count-1 do
  begin
   COMNumber:= StrToInt(Copy(SerialUSBPortCB.Items[i], 4, 4));
   COMArray[i]:= SerialUSBPortCB.Items[i];
   if COMList[COMNumber] > 1 then
    SerialUSBPortCB.Items[i]:= 'Driver SN ' +
     IntToStr(COMList[COMNumber]);
  end;

  ConnectBB.Enabled:= true;
  SerialUSBPortCB.Text:= '';
  if SerialUSBPortCB.Items.Count = 0 then
  begin
   ConnectBB.Enabled:= false;
   SerialUSBPortCB.Text:= 'No driver found';
  end
  // if there is only one COM port, preselect it
  else if SerialUSBPortCB.Items.Count = 1 then
   SerialUSBPortCB.ItemIndex:= 0
  else
  begin
   // if there is already a connection, display its port
   if HaveSerialCB.Checked then
     SerialUSBPortCB.ItemIndex:=
      SerialUSBPortCB.Items.IndexOf(ConnComPortLE.Text)
   else
    SerialUSBPortCB.ItemIndex:= -1;
  end;
  // update the text since this will be displayed
  // as proposal when the connection dialog is shown
  if SerialUSBPortCB.ItemIndex > -1 then
   SerialUSBPortCB.Text:= SerialUSBPortCB.Items[SerialUSBPortCB.ItemIndex];
  if SerialUSBPortCB.Text = '' then
    COMPort:= '';

  if Connect then
  begin
   // open connection dialog
   ShowModal;
   if ModalResult = mrOK then
   begin
    COMPort:= SerialUSBPortCB.Text;
    COMIndex:= SerialUSBPortCB.ItemIndex;
   end;
  end
  else
   ModalResult:= mrNo;

 end; // end with with SerialUSBSelectionF

 if SerialUSBSelectionF.ModalResult = mrNo then // user pressed Cancel
 begin
  DisconnectPumpDriver;
  exit;
 end;

 if COMPort = '' then // user set no COM port or canceled
 begin
  if SerialUSBSelectionF.ModalResult = mrCancel then
   exit; // nothing needs to be done
  MessageDlgPos('Error: No COM port selected.',
   mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
  // disable all buttons
  RunBB.Enabled:= false;
  StopBB.Enabled:= false;
  if HaveSerialCB.Checked then
  begin
   // stop pumps
   command:= '/0I';
   for k:= 1 to PumpNum do
    command:= command + '0';
   command:= command + 'gLM500lM500G2R' + LineEnding;
   ser.SendString(command);
   CloseSerialConn;
   IndicatorPanelP.Caption:= 'Pumps stopped';
   IndicatorPanelP.Color:= clHighlight;
  end;
  exit;
 end;

 COMPort:= COMArray[COMIndex];
 // open new connection if not already available
 if not (HaveSerialCB.Checked and (connectedPumpName = ConnComPortLE.Text)) then
 try
  if HaveSerialCB.Checked then
   CloseSerialConn;
  ConnComPortLE.Color:= clHighlight;
  ser:= TBlockSerial.Create;
  ser.DeadlockTimeout:= 3000; //set timeout to 3 s
  ser.Connect(COMPort);
  // the config must be set after the connection
  ser.config(9600, 8, 'N', SB1, False, False);
  if ser.LastError <> 0 then
  begin
   MessageDlgPos(connectedPumpName + ' error: '
    + ser.LastErrorDesc, mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   // disable all buttons
   RunBB.Enabled:= false;
   StopBB.Enabled:= false;
   IndicatorPanelP.Caption:= 'Connection failure';
   IndicatorPanelP.Color:= clRed;
   if ser.LastError = 9997 then
    exit; // we cannot close socket or free when the connection timed out
   CloseSerialConn;
   exit;
  end;

  // blink 5 times
  command:= '/0gLM500lM500G4R' + LineEnding;
  ser.SendString(command);
 finally
  if ser.LastError <> 0 then
  begin
   MessageDlgPos(COMPort + ' error: ' + ser.LastErrorDesc,
    mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   ConnComPortLE.Color:= clRed;
   // disable all buttons
   RunBB.Enabled:= false;
   StopBB.Enabled:= false;
   IndicatorPanelP.Caption:= 'Connection failure';
   IndicatorPanelP.Color:= clRed;
   if ser.LastError = 9997 then
    exit; // we cannot close socket or free when the connection timed out
   CloseSerialConn;
   exit;
  end;
  HaveSerialCB.Checked:= True;
  // output connected port
  ConnComPortLE.Color:= clDefault;
  ConnComPortLE.Text:= SerialUSBSelectionF.SerialUSBPortCB.Text;
  connectedPumpName:= SerialUSBSelectionF.SerialUSBPortCB.Text;
  Channel:= StrToInt(Copy(COMPort, 4, 4));
  connectedPumpDriver:= COMList[Channel];
  IndicatorPanelP.Caption:= 'Connection successful';
  IndicatorPanelP.Color:= clDefault;
  // no matter if the firmware might be the right one, we can allow to save and
  // load action files
  LoadActionMI.Enabled:= True;
  SaveActionMI.Enabled:= True;
  // get Firmware version
  try
   FirmwareVersion:= ser.Recvstring(1000);
  finally
   if ser.LastError <> 0 then
   begin
    MessageDlgPos(COMPort + ' error on reading firmware version: '
     + ser.LastErrorDesc, mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    ConnComPortLE.Color:= clRed;
    IndicatorPanelP.Caption:= 'Wrong device';
    IndicatorPanelP.Color:= clRed;
    GetFirmwareVersionMI.Enabled:= false;
    FirmwareUpdateMI.Enabled:= false;
    FirmwareResetMI.Enabled:= false;
    // disable all buttons
    RunBB.Enabled:= false;
    StopBB.Enabled:= false;
    if ser.LastError = 9997 then
     exit; // we cannot close socket or free when the connection timed out
    CloseSerialConn;
    exit;
   end;
   // FirmwareVersion has now this format:
   // "JT-PumpDriver-Firmware x.y\n Received command: ..."
   // but on old versions the firmware does not have any number,
   // only "received command" is sent back
   // therefore check for a number dot
   if Pos('JT-PumpDriver-Firmware', FirmwareVersion) > 0 then
    FirmwareVersion:= copy(FirmwareVersion, Pos('.', FirmwareVersion) - 1, 3)
   // omit the 'r' because some versions used a capital letter 'R'
   else if Pos('eceived command:', FirmwareVersion) > 0 then
    FirmwareVersion:= 'unknown'
   else
   begin
    MessageDlgPos('Not connected to a supported pump driver.',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    IndicatorPanelP.Caption:= 'Wrong device';
    CloseSerialConn;
    IndicatorPanelP.Color:= clRed;
    ConnComPortLE.Color:= clRed;
    exit;
   end;
   // JT Pump Driver requires a certain firmware version
   if FirmwareVersion = 'unknown' then
   begin
    MessageDlgPos('JT Pump Driver ' + Version + ' requires firmware version '
     + FloatToStr(RequiredFirmwareVersion) + ' or newer!'
     + LineEnding + 'You have an unknown old firmware version installed.'
     + LineEnding + 'Please use the menu Miscellaneous -> Firmware Update.',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    CloseSerialConn;
    IndicatorPanelP.Caption:= 'Firmware too old';
    IndicatorPanelP.Color:= clRed;
    exit;
   end;
   // when the USB connection got lost, the software is sometimes in a state
   // that Windows set the number format back to Windows' default
   // therefore set here explicitly the number format again
   DefaultFormatSettings.DecimalSeparator:= '.'; // we use English numbers
   gotFirmwareNumber:= TryStrToFloat(FirmwareVersion, FirmwareNumber);

   if (gotFirmwareNumber and (FirmwareNumber < RequiredFirmwareVersion))
    or (not gotFirmwareNumber) then
   begin
    MessageDlgPos('JT Pump Driver ' + Version + ' requires firmware version '
     + FloatToStr(RequiredFirmwareVersion) + ' or newer!'
     + LineEnding + 'You have firmware version ' + FirmwareVersion + ' installed.'
     + LineEnding + 'Please use the menu Miscellaneous -> Firmware Update.',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    CloseSerialConn;
    IndicatorPanelP.Caption:= 'Firmware too old';
    IndicatorPanelP.Color:= clRed;
    exit;
   end;
   // enable all buttons
   RunBB.Enabled:= true;
   StopBB.Enabled:= true;
  end; //end inner finally
 end; //end outer finally
end;

procedure TMainForm.DriverConnectBBClick(Sender: TObject);
begin
 if HaveSerialCB.Checked then
  ConnectionStart(Sender, false) // call to disconnect
 else
  ConnectionStart(Sender, true);
end;

procedure TMainForm.FirmwareUpdateMIClick(Sender: TObject);
begin
 FirmwareUpdate(false); // no forced update
end;

procedure TMainForm.FirmwareResetMIClick(Sender: TObject);
begin
 FirmwareUpdate(true); // forced update
end;

procedure TMainForm.OverallTimerStartTimer(Sender: TObject);
begin
 Application.Icon.Assign(IconImageGreen.Picture.Icon);
 IndicatorPanelP.Caption:= 'Pumps are running';
 IndicatorPanelP.Color:= clLime;
 RunBB.Caption:= 'Pumps running';
 RunBB.Enabled:= False;
 GenerateCommandBB.Enabled:= False;
 // disable menu to load and save action files
 MainForm.LoadActionMI.Enabled:= False;
 MainForm.SaveActionMI.Enabled:= False;
 // disable all setting possibilities
 RunSettingsGB.Enabled:= False;
 LiveModeCB.Enabled:= False;
 // disable the connection menu that the user cannot close
 // the conenction while the pumps are running
 ConnectionMI.Enabled:= False;
 DriverConnectBB.Enabled:= False;
 FirmwareUpdateMI.Enabled:= False;
 FirmwareResetMI.Enabled:= False;
end;

procedure TMainForm.OverallTimerStopTimer(Sender: TObject);
begin
 Application.Icon.Assign(IconImageYellow.Picture.Icon);
end;

procedure TMainForm.PumpNumberSEChange(Sender: TObject);
var
 j, k, l : integer;
begin
 PumpNum:= PumpNumberSE.Value;

 for j:= 1 to StepNum do
 begin
  k:= 0;
  // enable the specified number of pumps if the step is used
  for k:= 1 to PumpNum do
  begin
   (FindComponent('Pump' + IntToStr(k) + 'GB' + IntToStr(j))
    as TGroupBox).Enabled:= (FindComponent('Step'
                             + IntToStr(j) + 'UseCB') as TCheckBox).checked;
   (FindComponent('Pump' + IntToStr(k) + 'GB' + IntToStr(j))
    as TGroupBox).ShowHint:= true;
  end;
  // disable non-existent pumps
  if k < 8 then
  begin
   for l:= PumpNum + 1 to 8 do // currently we only support 8 pumps
   begin
    (FindComponent('Pump' + IntToStr(l) + 'OnOffCB' + IntToStr(j))
     as TCheckBox).Checked:= false;
    (FindComponent('Pump' + IntToStr(l) + 'GB' + IntToStr(j))
     as TGroupBox).Enabled:= false;
    (FindComponent('Pump' + IntToStr(l) + 'GB' + IntToStr(j))
     as TGroupBox).ShowHint:= false;
   end;
  end;
  // show/hide the pumps 5-8 tab
  if k < 5 then
   (FindComponent('S' + IntToStr(j) + 'P58')
    as TTabSheet).TabVisible:= false
  else
   (FindComponent('S' + IntToStr(j) + 'P58')
    as TTabSheet).TabVisible:= true;
  // show/hide the pumps 1-4 tab
  if k < 1 then
   (FindComponent('S' + IntToStr(j) + 'P14')
    as TTabSheet).TabVisible:= false
  else
   (FindComponent('S' + IntToStr(j) + 'P14')
    as TTabSheet).TabVisible:= true;
 end;
end;

procedure TMainForm.FirmwareUpdate(forced: Boolean);
// flashes the program cache in the TinyZero controller with a new firmware
var
 COMListStart, COMListBoot : TStringList;
 Reg : TRegistry;
 BootCOM, BossacOut, FirmwareFile, bossacPath, command,
   COMPort, driverFeedback : string;
 i, YesNo : integer;
 MousePointer : TPoint;
 exited : Boolean = false;
begin
{ the flashing works the following way:
1. Closing the connection
 2. Reopening the connection but with 1200 baud.
 This sets the controller to boot mode and gives the controller a new COM
  port number, therefore
 3. Wait until the new COM port is available
 4. Execute the bossac.exe to send the firmware
 This will change the COM port again.
 5. Reconnect to the new COM port with normal baud rate   }

 MousePointer:= Mouse.CursorPos; // store mouse position

 // at first check if the bossac.exe is in the same folder than the executable
 // get path to the bossac.exe which is the same as the application
 bossacPath:= ExtractFileDir(Application.ExeName);
 bossacPath:= bossacPath + '\bossac.exe';
 if not FileExists(bossacPath) then
 begin
  MessageDlgPos('The file "bossac.exe" is not in the same folder as this program.'
   + LineEnding + 'No firmware update possible.',
   mtError, [mbOK], 0 , MousePointer.X, MousePointer.Y);
  exit;
 end;

 // basic info
 MessageDlgPos('Specify now the COM port of the pump driver' + LineEnding
  + 'and select then the firmware file.',
  mtInformation, [mbOK], 0, MousePointer.X, MousePointer.Y);

 // disable all buttons
 RunBB.Enabled:= false;
 StopBB.Enabled:= false;
 ConnComPortLE.Text:= 'Not connected';
 ConnComPortLE.Color:= clHighlight;
 IndicatorPanelP.Caption:= '';
 IndicatorPanelP.Color:= clDefault;

 try // to free finally the TStringLists
  // determine all possible COM ports
  COMListStart:= TStringList.Create;
  COMListBoot:= TStringList.Create;
  Reg:= TRegistry.Create;
  try
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
   begin
    with SerialUSBSelectionF do
    begin
     SerialUSBPortCB.Text:= '';
     SerialUSBPortCB.Items.Clear;
     SerialUSBPortCB.Sorted:= false;
     Reg.GetValueNames(SerialUSBPortCB.Items);
     for i:= 0 to SerialUSBPortCB.Items.Count - 1 do
     begin
      SerialUSBPortCB.Items[i]:= Reg.ReadString(SerialUSBPortCB.Items[i]);
      // store the list
      COMListStart.Add(SerialUSBPortCB.Items[i]);
     end;
     SerialUSBPortCB.Sorted:= true;
    end;
   end;
  finally
   Reg.Free;
  end;

  // open connection dialog
  SerialUSBSelectionF.ShowModal;
  if SerialUSBSelectionF.ModalResult = mrCancel then
   exit;
  if SerialUSBSelectionF.ModalResult = mrOK then
    COMPort:= SerialUSBSelectionF.SerialUSBPortCB.Text;
  if SerialUSBSelectionF.ModalResult = mrNo then // user pressed Disconnect
  begin
   MessageDlgPos('No connection, no firmware update possible.',
    mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   exit;
  end;
  if (COMPort = '') then // user forgot to set a COM port
  begin
   MessageDlgPos('Error: No COM port selected, no firmware update possible.',
    mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   exit;
  end;
  // check if we are connected to a pump driver
  try
   // for some odd reason not all pump driver output gets received,
   // therefore establish a new connection
   if HaveSerialCB.Checked then
   begin
    ser.CloseSocket;
    ser.Free;
   end;
   ser:= TBlockSerial.Create;
   ser.DeadlockTimeout:= 10; //set timeout to 10 s
   ser.Connect(COMPort);
   ser.config(9600, 8, 'N', SB1, False, False);
   if not forced then
   begin
    // send now a simple command to get the firmware version back
    // blink 1 time
    command:= '/0LM500lM500R' + LineEnding;
    ser.SendString(command);
    // receive firmware version
    FirmwareVersion:= ser.Recvstring(1000);
   end;
  finally
   if ser.LastError <> 0 then
   begin
    MessageDlgPos(COMPort + ' error: ' + ser.LastErrorDesc,
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    ConnComPortLE.Color:= clRed;
    IndicatorPanelP.Caption:= 'Connection error';
    IndicatorPanelP.Color:= clRed;
    if ser.LastError = 9997 then
    begin
     exited:= true;
     exit; // we cannot close socket or free when the connection timed out
    end;
    MessageDlgPos('The selected COM port is not the one of a pump driver!',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    CloseSerialConn;
    exited:= true;
    exit;
   end;
   // in case of successful data exchange but not a pump driver
   if (Pos('eceived command:', FirmwareVersion) = 0) and (not forced) then
   // (omit the 'r' because some versions used a capital letter 'R')
   begin
    MessageDlgPos('The selected COM port is not the one of a pump driver!',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    IndicatorPanelP.Caption:= 'Wrong device';
    IndicatorPanelP.Color:= clRed;
   end;
  end;

  // if connected to wrong device, exit; only jumps out of try..finally block
  if exited then
   exit;

  HaveSerialCB.Checked:= True;
  // allow the user to flush the device anyway
  if forced then
  begin
   with CreateMessageDialog // MessageDlg
       ('Do you really want to force the firmware update anyway on your own risk (guarantee void)?'
        + LineEnding +
        'NOTE: Assure that then no other device is connected to a COM port!',
             mtWarning, [mbYes]+[mbNo]) do
   try
    ActiveControl:= FindComponent('NO') as TWinControl;
    YesNo:= ShowModal;
   finally
    Free;
   end;
   if YesNo = mrNo then // if No
    exit;
  end;
  // open the firmware binary file
  if FirmwareFileDialog.Execute then
  begin
   FirmwareFile := FirmwareFileDialog.Filename;
   if not FileExists(FirmwareFile) then
   begin
    MessageDlgPos('Selected file does not exist, no firmware update possible.',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    exit;
   end;
  end
  else
  begin
   MessageDlgPos('No firmware file selected, no firmware update possible.',
    mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   exit;
  end;

  // closing open connections
  // we don't call CloseSerialConn because we need the COMPort info
  if HaveSerialCB.Checked then
  begin
   ser.CloseSocket;
   ser.Free;
   HaveSerialCB.Checked:= False;
  end;

  // open new connection with 1200 baud,
  // this rate is mandatory to set the Arduino into boot mode
  try
   ser:= TBlockSerial.Create;
   ser.DeadlockTimeout:= 10000; //set timeout to 10 s
   ser.Connect(COMPort);
   ser.config(1200, 8, 'N', SB1, False, False);
  except
   MessageDlgPos('Error: A connection to ' + COMPort + ' cannot be opened.',
    mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   exit;
  end;
  // since the process will need more than 10 seconds, show a note
  // at the position where the initial info message was output
  if forced then
  begin
   FirmwareNote.Text:= 'Firmware reset is in progress';
   FirmwareNote.Title:= 'Firmware reset';
  end
  else
  begin
   FirmwareNote.Text:= 'Firmware update is in progress';
   FirmwareNote.Title:= 'Firmware update';
  end;
  FirmwareNote.ShowAtPos(MousePointer.X, MousePointer.Y);
  Application.ProcessMessages; // to show the note before going to delay
  Delay(2000); // some time until the connection is in every case established
  Application.ProcessMessages; // keep the program alive to Windows
  // Close the connection
  try
   ser.CloseSocket;
   ser.Free;
  except
   MessageDlgPos('Error: ' + COMPort + ' cannot be closed.',
    mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   exit;
  end;
  // now the microcontroller gets to boot mode and establishes two times a
  // connection with Windows. This needs several seconds:
  Application.ProcessMessages;
  Delay(4000);
  Application.ProcessMessages;

  // we need to find out what the new COM port is
  // The number of COM ports have not changed, so we can just read out the
  // current list and compare
  Reg:= TRegistry.Create;
  try
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
   begin
    Reg.GetValueNames(COMListBoot);
    for i:= 0 to COMListBoot.Count - 1 do
     COMListBoot[i]:= Reg.ReadString(COMListBoot[i]);
   end;
  finally
   Reg.Free;
  end;
  // compare with prior list
  BootCOM:= 'x';
  for i:= 0 to COMListBoot.Count - 1 do
   if COMListBoot[i] <> COMListStart[i] then
   begin
    BootCOM:= COMListBoot[i];
    break;
   end;
  if BootCOM = 'x' then
   BootCOM:= COMPort;

  // upload the new firmware
  RunCommand(bossacPath,
   ['-i', '-d', '-p' , BootCOM, '-U', 'true', '-e', '-w', '-v', FirmwareFile, '-R'],
   BossacOut, [poNoConsole]);

  Application.ProcessMessages;
  Delay(5000); // wait 5s because the microcontroller needs time
  Application.ProcessMessages;
  FirmwareNote.Hide; // hide the note

  // the COM port might now be different than at the start
  Reg:= TRegistry.Create;
  try
   Reg.RootKey:= HKEY_LOCAL_MACHINE;
   if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
   begin
    Reg.GetValueNames(COMListBoot);
    for i:= 0 to COMListBoot.Count - 1 do
     COMListBoot[i]:= Reg.ReadString(COMListBoot[i]);
   end;
  finally
   Reg.Free;
  end;
  // compare with start COM list
  BootCOM:= 'x';
  for i:= 0 to COMListBoot.Count - 1 do
   if COMListBoot[i] <> COMListStart[i] then
   begin
    BootCOM:= COMListBoot[i];
    break;
   end;
  if BootCOM = 'x' then
   BootCOM:= COMPort;

  // reconnect
  try
   ser:= TBlockSerial.Create;
   HaveSerialCB.Checked:= True;
   ser.DeadlockTimeout:= 10; //set timeout to 10 s
   ser.Connect(BootCOM);
   ser.config(9600, 8, 'N', SB1, False, False);
   // send now a simple command to get the firmware version back
   // blink 1 time
   command:= '/0LM500lM500R' + LineEnding;
   ser.SendString(command);
   // receive firmware version
   driverFeedback:= ser.Recvstring(1000);
  finally
   if ser.LastError <> 0 then
   begin
    MessageDlgPos(BootCOM + ' error: ' + ser.LastErrorDesc,
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    ConnComPortLE.Color:= clRed;
    if ser.LastError = 9997 then
     exit; // we cannot close socket or free when the connection timed out
    CloseSerialConn;
    exit;
   end;
   if Pos('JT-PumpDriver-Firmware', driverFeedback) > 0 then
    FirmwareVersion:= copy(driverFeedback, Pos('.', driverFeedback) - 1, 3)
   else
    FirmwareVersion:= 'unknown';
   // output connected port
   // determine the driver ID: from first space to first #10
   // (driver uses only #10 for the line ending)
   i:= Length('JT-PumpDriver-ID');
   if copy(driverFeedback, 0, i) = 'JT-PumpDriver-ID' then
   begin
    driverFeedback:= copy(driverFeedback, i + 2,
                          (Pos(#10, driverFeedback) - 1) - (i + 1));
    // get rid of leading zeros by a str - int back and forth conversion
    ConnComPortLE.Text:= 'Driver SN ' + IntToStr(StrToInt(driverFeedback));
   end
   else
    ConnComPortLE.Text:= BootCOM;
   ConnComPortLE.Color:= clDefault;
   IndicatorPanelP.Caption:= 'Firmware updated';
   // inform the user
   if (AnsiContainsStr(BossacOut, 'Verify successful'))
     and (FirmwareVersion <> 'unknown') then
    MessageDlgPos('The firmware has been updated sucessfully to version '
     + FirmwareVersion + '.', mtInformation, [mbOK], 0, MousePointer.X,
     MousePointer.Y)
   else if FirmwareVersion = 'unknown' then
    begin
     MessageDlgPos('The firmware has been updated sucessfully but to an unknown'
      + LineEnding + 'old version that is not supported by JT Pump Driver '
      + Version + '.' + LineEnding + 'JT Pump Driver ' + Version
      + ' requires firmware version ' + FloatToStr(RequiredFirmwareVersion)
      + ' or newer!' , mtInformation, [mbOK], 0, MousePointer.X, MousePointer.Y);
     IndicatorPanelP.Caption:= 'Firmware too old';
     IndicatorPanelP.Color:= clRed;
     exit;
    end
   else
   begin
    MessageDlgPos('The firmware could not be updated sucessfully.' + LineEnding
     + 'Here is the full output of the failed firmware update attempt:' + LineEnding
     + BossacOut, mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    exit;
   end;
   if StrToFloat(FirmwareVersion) < RequiredFirmwareVersion then
   begin
    MessageDlgPos('JT Pump Driver ' + Version + ' requires firmware version '
     + FloatToStr(RequiredFirmwareVersion) + ' or newer!'
     + LineEnding + 'You have firmware version ' + FirmwareVersion + ' installed.'
     + LineEnding + 'Please use the menu Miscellaneous -> Firmware Update.',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
     IndicatorPanelP.Caption:= 'Firmware too old';
     IndicatorPanelP.Color:= clRed;
    exit;
   end;
   // enable all buttons
   RunBB.Enabled:= true;
   StopBB.Enabled:= true;
   IndicatorPanelP.Color:= clDefault;
  end;

 finally
  FreeAndNil(COMListStart);
  FreeAndNil(COMListBoot);
 end;
end;

function TMainForm.DialogWithPos(const Message: string; DialogType: TMsgDlgType;
           Buttons: TMsgDlgButtons; AX, AY: Integer): TModalResult;
// creates a dialog that will appear with its upper left edge
// at the current mouse position
var
  MessageForm: TForm;
begin
 MessageForm:= CreateMessageDialog(Message, DialogType, Buttons);
 try
   MessageForm.FormStyle:= fsStayOnTop;
   MessageForm.Position:= poDefaultSizeOnly;
   MessageForm.Left:= AX;
   MessageForm.Top:= AY;
   Result:= MessageForm.ShowModal;
 finally
   MessageForm.Free
 end;
end;

procedure TMainForm.GetFirmwareVersionMIClick(Sender: TObject);
// reads the firmware version from the pump driver board
var
 MousePointer : TPoint;
begin
 MousePointer:= Mouse.CursorPos; // store mouse position

 if not HaveSerialCB.Checked then // connect first
  ConnectionMIClick(Sender);

 if FirmwareVersion <> 'unknown' then
 begin
  MessageDlgPos('Firmware version: ' + FirmwareVersion,
   mtInformation, [mbOK], 0, MousePointer.X, MousePointer.Y)
 end
 else
 begin
  MessageDlgPos('Error: No connection to a pump driver',
   mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
  exit;
 end;
end;

procedure TMainForm.HaveSerialCBChange(Sender: TObject);
begin
 if HaveSerialCB.Checked then
 begin
  DriverConnectBB.Caption:= 'Disconnect Driver';
  DriverConnectBB.Hint:= 'Disconnects from the pump driver';
 end
 else
 begin
  DriverConnectBB.Caption:= 'Connect Driver';
  DriverConnectBB.Hint:= 'Connects to a pump driver';
  ConnComPortLE.Color:= clHighlight;
  ConnComPortLE.Text:= 'Not connected';
 end;
end;

procedure TMainForm.AboutMIClick(Sender: TObject);
begin
 with AboutFormF do
 begin
  // set version number
  NameL.Caption:= Application.Title + ' version ';
  VersionNumberL.Caption:= Version;
  Caption:= Application.Title;
  // open the dialog
  ShowModal;
 end;
end;

procedure TMainForm.LiveModeCBChange(Sender: TObject);
// changes the program to transmit every pump settings change immediately
var
j : integer;
begin
 if LiveModeCB.Checked then
 begin
  // make all steps invisible and rename step 1
  for j:= 2 to StepNum do
   (FindComponent('Step' + IntToStr(j) + 'TS')
    as TTabSheet).TabVisible:= false;
  // assure that step 2 is not used
  Step2UseCB.Checked:= false;
  RunSettingsGB.Enabled:= false;
  Step1TS.Caption:= 'Live';
  // set that run until stop pressed
  RunEndlessCB.Checked:= true;
  // en/disable pump setting elements
  PumpOnOffCBLoopChange(Sender);
 end
 else
 begin
  RunSettingsGB.Enabled:= true;
  // rename step 1 back and show step 2
  Step1TS.Caption:= 'Step 1';
  Step2TS.TabVisible:= true;
  RunEndlessCB.Checked:= false;
  // en/disable pump setting elements
  PumpOnOffCBLoopChange(Sender);
 end;

end;

procedure TMainForm.FormClose(Sender: TObject);
// Close serial connection
var
 command, iniFile : string;
 k : integer;
begin
 // stop the pumps and blink 3 times
 command:= '/0I';
 for k:= 1 to PumpNum do
  command:= command + '0';
 command:= command + 'gLM500lM500G2R' + LineEnding;
 if HaveSerialCB.Checked then // the user set a COM port
  try
   ser.SendString(command);
   // purposely don't emit an error that the serial connection is no longer
   // since the program is closed anyway
  finally
   // close connection
    if HaveSerialCB.Checked and (ser.LastError <> 9997) then
     // we cannot close socket or free when the connection timed out
     CloseSerialConn;
  end;

 // save the current chart appearance settings
 // we write into the same folder than the program .exe
 iniFile:= ExtractFilePath(Application.ExeName) + AppearanceFile;
 SaveAppearance(iniFile);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 // if action is running, ask
 if OverallTimer.Enabled then
 begin
  if MessageDlg('An action is currently running, do you really want to close?',
                mtConfirmation, [mbYes]+[mbNo], 0, mbNo) = mrNo then
   CanClose:= False
  else
   CanClose:= True;
 end;
end;

procedure TMainForm.GenerateCommandBBClick(Sender: TObject);
// call function to collect data and generate command
var
 command : string;
 i, j : integer;
begin
 GenerateCommand(command);
 CommandM.Text:= command;
 // the button re-enables editing after an action file was loaded
 // enable all setting possibilities
 LiveModeCB.Enabled:= True;
 PumpSetupGB.Enabled:= True;
 RunSettingsGB.Enabled:= not LiveModeCB.Checked;
 // check all possible steps
 for j:= 1 to StepNum do
 begin
  (FindComponent('Step' + IntToStr(j) + 'UseCB')
   as TCheckBox).Enabled:= True;
  (FindComponent('ActionTime' + IntToStr(j) + 'GB')
   as TGroupBox).Enabled:= True;
  (FindComponent('DutyCycle' + IntToStr(j) + 'GB')
   as TGroupBox).Enabled:= True;
  (FindComponent('S' + IntToStr(j) + 'P14')
   as TTabSheet).Enabled:= True;
  (FindComponent('S' + IntToStr(j) + 'P58')
   as TTabSheet).Enabled:= True;
  if j = 1 then
   // enable tooltips for pump name
   for i:= 1 to PumpNum do
    (FindComponent('Pump' + IntToStr(i) + 'GB' + IntToStr(j))
     as TGroupBox).ShowHint:= True;
 end;
 // view tab after last used step
 for j:= 2 to StepNum-1 do
 begin
  if (FindComponent('Step' + IntToStr(j) + 'UseCB')
      as TCheckBox).Checked then
   (FindComponent('Step' + IntToStr(j+1) + 'TS')
    as TTabSheet).TabVisible:= True
  else
   break;
 end;
 // tab 2 must always be visible except when in live mode
 if not LiveModeCB.Checked then
  Step2TS.TabVisible:= True;
 // loaded settings are no longer valid
 LoadedActionFileM.Text:= 'None';
 LoadedActionFileM.Color:= clDefault;
 LoadedActionFileM.Hint:= 'No action file loaded';
 // enable saving
 SaveActionMI.Enabled:= True;
end;

function TMainForm.GenerateCommand(out command: string): Boolean;
// collect data an generate command to be sent
var
 voltage, jStr, commandSplit, commandSave, commandOriginal : string;
 SOrder : array of char;
 timeFactor, DutyRepeats, XTime, OnTime, OffTime, i, j, k, j2, k2,
   voltageCalc, countPump, countPumpNumber, posS: integer;
 timeCalc, timeOut, timeStep : Double;
 HaveS : Boolean = False;
begin
 timeFactor:= 1; timeCalc:= 0; voltageCalc:= 0;
 command:= ''; commandSplit:= ''; voltage:= '';
 if not LiveModeCB.Checked then
 begin
  IndicatorPanelP.Color:= clDefault;
  IndicatorPanelP.Caption:= '';
 end;
 IndicatorPanelP.Hint:= '';
 setLength(SOrder{%H-}, PumpNum);
 posS:= 1; // 1 and not 0 because we use it to access chars in strings

 // address
 command:= '/0';
 // turn on LED
 command:= command + 'L';

 if (StrToInt(RepeatSE.Text) > 0) or (RunEndlessCB.Checked) then
  // begin loop flag
  command:= command + 'g';

 // step through all tabs
 for j:= 1 to StepNum do
 begin
  // initialize
  for k:= 0 to PumpNum-1 do
   SOrder[k]:= '0';
  jStr:= IntToStr(j);
  voltageCalc:= 0;
  if (FindComponent('Step' + jStr + 'UseCB') as TCheckBox).Checked
   and (FindComponent('Step' + jStr + 'TS') as TTabSheet).TabVisible then
  begin
   // speed and direction flag
   if (FindComponent('Pump1OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump2OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump3OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump4OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump5OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump6OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump7OnOffCB' + jStr)
        as TCheckBox).Checked
    or (FindComponent('Pump8OnOffCB' + jStr)
        as TCheckBox).Checked
    then
    begin
     // first check the duty cycle, if it is not 100 we need an on-off loop
     if (FindComponent('DutyCycle' + jStr + 'FSE')
         as TFloatSpinEdit).Value < 100 then
      command:= command + 'g';
     // syntax ist: Sxyyy, x = pump number, y = speed
     command:= command + 'S';
     HaveS:= True;
    end
    else
     HaveS:= False;
    // voltage, only write if pump is active
   if (FindComponent('Pump1OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    SOrder[0]:= '1';
    command:= command + '1';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump1VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump2OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '2'
    else
     SOrder[1]:= '2';
    command:= command + '2';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump2VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump3OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '3'
    else if SOrder[1] = '0' then
     SOrder[1]:= '3'
    else
     SOrder[2]:= '3';
    command:= command + '3';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump3VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump4OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '4'
    else if SOrder[1] = '0' then
     SOrder[1]:= '4'
    else if SOrder[2] = '0' then
     SOrder[2]:= '4'
    else
     SOrder[3]:= '4';
    command:= command + '4';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump4VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump5OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '5'
    else if SOrder[1] = '0' then
     SOrder[1]:= '5'
    else if SOrder[2] = '0' then
     SOrder[2]:= '5'
    else if SOrder[3] = '0' then
     SOrder[3]:= '5'
    else
     SOrder[4]:= '5';
    command:= command + '5';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump5VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump6OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '6'
    else if SOrder[1] = '0' then
     SOrder[1]:= '6'
    else if SOrder[2] = '0' then
     SOrder[2]:= '6'
    else if SOrder[3] = '0' then
     SOrder[3]:= '6'
    else if SOrder[4] = '0' then
     SOrder[4]:= '6'
    else
     SOrder[5]:= '6';
    command:= command + '6';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump6VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump7OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '7'
    else if SOrder[1] = '0' then
     SOrder[1]:= '7'
    else if SOrder[2] = '0' then
     SOrder[2]:= '7'
    else if SOrder[3] = '0' then
     SOrder[3]:= '7'
    else if SOrder[4] = '0' then
     SOrder[4]:= '7'
    else if SOrder[5] = '0' then
     SOrder[5]:= '7'
    else
     SOrder[6]:= '7';
    command:= command + '7';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump7VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   if (FindComponent('Pump8OnOffCB' + jStr) as TCheckBox).Checked then
   begin
    if SOrder[0] = '0' then
     SOrder[0]:= '8'
    else if SOrder[1] = '0' then
     SOrder[1]:= '8'
    else if SOrder[2] = '0' then
     SOrder[2]:= '8'
    else if SOrder[3] = '0' then
     SOrder[3]:= '8'
    else if SOrder[4] = '0' then
     SOrder[4]:= '8'
    else if SOrder[5] = '0' then
     SOrder[5]:= '8'
    else if SOrder[6] = '0' then
     SOrder[6]:= '8'
    else
     SOrder[7]:= '8';
    command:= command + '8';
    // 3.3 V is the maximum
    voltage:= FloatToStr(ceil(
     (FindComponent('Pump8VoltageFS' + jStr)
      as TFloatSpinEdit).Value / 3.3 * 999));
    // we need to write always 3 characters
    case length(voltage) of
     2 : voltage:= '0' + voltage;
     1 : voltage:= '00' + voltage;
    end;
    command:= command + voltage;
    voltageCalc:= voltageCalc + StrToInt(voltage);
   end;
   // direction
   if HaveS then // only if there is any pump running
   begin
    command:= command + 'D';
    for k:= 1 to PumpNum do
    begin
     if SOrder[k-1] <> '0' then
      command:= command +
       IntToStr((FindComponent('Pump' + SOrder[k-1] + 'DirectionRG' + jStr)
        as TRadioGroup).ItemIndex);
    end;
   end;
   // action
   command:= command + 'I';
   for k:= 1 to PumpNum do
    command:= command +
     BoolToStr((FindComponent('Pump' + IntToStr(k) + 'OnOffCB' + jStr)
        as TCheckBox).Checked, '1', '0');
   // calculate action time in ms
   timeStep:= 0;
   if (FindComponent('Unit' + jStr + 'RBs')
       as TRadioButton).Checked then
    timeFactor:= 1000
   else if (FindComponent('Unit' + jStr + 'RBmin')
            as TRadioButton).Checked then
    timeFactor:= 1000 * 60
   else if (FindComponent('Unit' + jStr + 'RBh')
            as TRadioButton).Checked then
    timeFactor:= 1000 * 3600;

   // if we have not 100% duty cycle we need 2 steps
   if ((FindComponent('DutyCycle' + jStr + 'FSE')
      as TFloatSpinEdit).Value < 100) and HaveS then
   begin
    if ((FindComponent('DutyCycle' + jStr + 'FSE')
      as TFloatSpinEdit).Value / 100) >= 0.05 then
     XTime:= 1000 // base time is 1s
    else // calculate a base time so that the OnTime is 50 ms
     XTime:= round(0.05 / ((FindComponent('DutyCycle' + jStr + 'FSE')
      as TFloatSpinEdit).Value / 100) * 1000);
    OnTime:= round((FindComponent('DutyCycle' + jStr + 'FSE')
      as TFloatSpinEdit).Value / 100 * XTime); // time in ms
    OffTime:= XTime - OnTime;
    DutyRepeats:= round((FindComponent('RunTime' + jStr + 'FSE')
      as TFloatSpinEdit).Value * timeFactor / XTime) - 1;
    // DutyRepeats can now be -1 if time is smaller than necessary OffTime
    if DutyRepeats < 0 then
     DutyRepeats:= 0;
    command:= command + 'M' + FloatToStr(OnTime);
    command:= command + 'I';
    for k:= 1 to PumpNum do
     command:= command + '0';
    command:= command + 'M' + FloatToStr(OffTime);
    command:= command + 'G' + IntToStr(DutyRepeats);
    timeStep:= XTime * (DutyRepeats + 1);
   end
   else // output the time directly
   begin
    command:= command + 'M'
     + FloatToStr((FindComponent('RunTime' + jStr + 'FSE')
                   as TFloatSpinEdit).Value * timeFactor);
    timeStep:= (FindComponent('RunTime' + jStr + 'FSE')
                as TFloatSpinEdit).Value * timeFactor;
   end;
   timeCalc:= timeCalc + timeStep;

   // When the sum of the S values is larger than 3*999 we must
   // split the step into substeps because the pump driver cannot
   // deliver enough current to start all pumps at once
   // In this case we will first start up to 3 pumps, then 10 ms later
   // the next up to 3 and so on

   if voltageCalc > (3*999) then
   begin
    // we take blocks of pumps vith a voltage below 3*999 thus restart counting
    voltageCalc:= 0; k2:= 1;
    countPump:= 0; countPumpNumber:= 0;
    commandOriginal:= command;
    commandSave:= ''; commandSplit:= '';
    for i:= posS to Length(commandOriginal) do
    begin
     if commandOriginal[i] = 'S' then
     begin
      // store the position of the first 'S' for this step
      posS:= i;
      k2:= i + 1;
     end;
     // parse now until the first 'D' is found
     while isDigit(commandOriginal[k2]) and (posS > 1) do
     begin
     voltageCalc:= voltageCalc + StrToInt(Copy(commandOriginal, k2+1, 3));
      if voltageCalc > (3*999) then
      begin // we have our first commandSplit
       commandSave:= commandSave + commandSplit;
       commandSplit:= commandSave;
       // add the direction
       commandSplit:= 'S' + commandSplit + 'D';
       for j2:= 1 to countPump do
       begin
        if SOrder[j2-1] <> '0' then
         commandSplit:= commandSplit +
          IntToStr((FindComponent('Pump' + SOrder[j2-1] + 'DirectionRG' + jStr)
           as TRadioGroup).ItemIndex);
       end;
       // add the action
       commandSplit:= commandSplit + 'I';
       for j2:= 1 to countPumpNumber do
        commandSplit:= commandSplit +
         BoolToStr((FindComponent('Pump' + IntToStr(j2) + 'OnOffCB' + jStr)
          as TCheckBox).Checked, '1', '0');
       for j2:= countPumpNumber + 1 to PumpNum do
        commandSplit:= commandSplit + '0';
       // eventually add the 10 ms
       commandSplit:= commandSplit + 'M10';
       // insert commandSplit to command
       Insert(commandSplit, command, posS);
       // move position and start collecting again
       posS:= posS + length(commandSplit);
       commandSplit:= '';
       // we start with the voltage of the currently not yet added pump
       voltageCalc:= StrToInt(Copy(commandOriginal, k2+1, 3));
      end; // end if voltageCalc
      // we can add another pump
      commandSplit:= commandSplit + Copy(commandOriginal, k2, 4);
      inc(countPump);
      countPumpNumber:= StrToInt(commandOriginal[k2]);
      k2:= k2 + 4;

     end; // end while
     // when voltageCalc is here > 0 we already parsed enough
     if voltageCalc > 0 then
      break;
    end; // end for i
    // set position to end of command for next step
    posS:= length(command);
   end; // end if voltageCalc > (3*999)

   // if the direction changes, wait 999 ms to protect the pumps
   // only if the next step is actually used and we have 100% duty cylce
   // only necessary if DutyCycle = 100
   if (FindComponent('DutyCycle' + jStr + 'FSE')
       as TFloatSpinEdit).Value = 100 then
   begin
    if (j < StepNum) and (FindComponent('Step' + IntToStr(j+1) + 'UseCB')
        as TCheckBox).checked then
    begin
     if ((FindComponent('Pump1OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump1OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump1DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump1DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump2OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump2OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump2DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump2DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump3OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump3OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump3DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump3DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump4OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump4OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump4DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump4DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump5OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump5OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump5DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump5DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump6OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump6OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump6DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump6DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump7OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump7OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump7DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump7DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump8OnOffCB' + jStr) as TCheckBox).Checked
       and (FindComponent('Pump8OnOffCB' + IntToStr(j+1)) as TCheckBox).Checked
       and ((FindComponent('Pump8DirectionRG' + jStr) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump8DirectionRG' + IntToStr(j+1)) as TRadioGroup).ItemIndex))
     then
     begin
      // stop for 999 ms
      command:= command + 'I';
      for k:= 1 to PumpNum do
       command:= command + '0';
      command:= command + 'M999';
      timeStep:= timeStep + 999;
      timeCalc:= timeCalc + 999;
     end;
    end
    // next step could be step 1
    else if ((RepeatSE.Value > 0) or (RunEndlessCB.Checked)) and (j > 1) then
    begin
     if ((FindComponent('Pump1OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump1OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump1DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump1DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump2OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump2OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump2DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump2DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump3OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump3OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump3DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump3DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump4OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump4OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump4DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump4DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump5OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump5OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump5DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump5DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump6OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump6OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump6DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump6DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump7OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump7OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump7DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump7DirectionRG' + jStr) as TRadioGroup).ItemIndex))
      or ((FindComponent('Pump8OnOffCB' + IntToStr(j-1)) as TCheckBox).Checked
       and (FindComponent('Pump8OnOffCB' + jStr) as TCheckBox).Checked
       and ((FindComponent('Pump8DirectionRG' + IntToStr(j-1)) as TRadioGroup).ItemIndex
        <> (FindComponent('Pump8DirectionRG' + jStr) as TRadioGroup).ItemIndex))
     then
     begin
      // only output if there is no single run
      if (RepeatSE.Value > 0) or (RunEndlessCB.Checked) then
      begin
       // stop for 999 ms
       command:= command + 'I';
       for k:= 1 to PumpNum do
        command:= command + '0';
       command:= command + 'M999';
       timeStep:= timeStep + 999;
       timeCalc:= timeCalc + 999;
      end;
     end;
    end; // end if if ((RepeatSE.Value > 0)
   end; // end if DutyCycle(JStr)FSE.Value = 100

   // a timer in Lazarus or can only run for 2^31-1 milliseconds
   // the timer in the Arduino could in principle run the double time, but
   // allowing this is not worth the effort (that under all circumstances
   // unsigned 32bit int is used) and we can expect an action within 24 days
   if timeStep > 2147483646 then
   begin
    IndicatorPanelP.Color:= clRed;
    IndicatorPanelP.Caption:= 'Step time ' + jStr + 'too long!';
    IndicatorPanelP.Hint:= 'time for one step must not exceed 596 h';
    result:= False;
    exit;
   end;
   // set timer interval
   (FindComponent('StepTimer' + jStr) as TTimer).Interval:= trunc(timeStep);

  end; // end if (FindComponent('Step' + jStr + 'UseCB') as TCheckBox).Checked
 end; // end for j:=1 to StepNum

 // end loop flag
 if RunEndlessCB.Checked then
 begin
  command:= command + 'G';
  timeCalc:= MAXINT; // set maximal possible int for infinite repeats
 end;
 // if repeated run
 if (StrToInt(RepeatSE.Text) > 0) and (not RunEndlessCB.Checked) then
 begin
  command:= command + 'G' + IntToStr(RepeatSE.Value);
  timeCalc:= timeCalc * (RepeatSE.Value + 1);
 end;

  // explicitly turn off all pumps, turn off LED and execute flag
  // the explicite turn off is important because the Arduino command
  // execution loop needs several 100 ms. But when an explicit stop is sent,
  // the loop will end immediately
  command:= command + 'I';
  for k:= 1 to PumpNum do
   command:= command + '0';
  command:= command + 'lR';

  // calculate the total time
  if not RunEndlessCB.Checked then
  begin
   // output time in sensible unit
   if timeCalc <= 1e6 then
   begin
    TotalTimeLE.Text:= FloatToStr(RoundTo(timeCalc /1000, -1));
    TotalTimeLE.EditLabel.Caption:= 'Total Time in s';
   end
   else if timeCalc <= 60e6 then
   begin
    timeOut:= timeCalc /1000/60;
    TotalTimeLE.Text:= FloatToStr(RoundTo(timeOut, -2));
    TotalTimeLE.EditLabel.Caption:= 'Total Time in min';
   end
   else if timeCalc > 60e6 then
   begin
    timeOut:= timeCalc /1000/60/60;
    TotalTimeLE.Text:= FloatToStr(RoundTo(timeOut, -2));
    TotalTimeLE.EditLabel.Caption:= 'Total Time in h';
   end;
  end
  else
   TotalTimeLE.Text:= 'Until Stop pressed';

  // output the time and result
  GlobalTime:= trunc(timeCalc);
  result:= True;
end;

procedure TMainForm.PumpOnOffCBLoopChange(Sender: TObject);
var
  i, step : integer;
begin
for step:= 1 to StepNum do
  for i:= 1 to PumpNum do
  begin
   // when in live mode the pump direction must be kept disabled when pump
   // is on and all elements must be enabled when the pump if off
   if LiveModeCB.Checked then
   begin
   (FindComponent('Pump' + IntToStr(i) + 'DirectionRG' + IntToStr(step))
     as TRadioGroup).Enabled:= not (FindComponent('Pump' + IntToStr(i) + 'OnOffCB' + IntToStr(step))
     as TCheckBox).Checked;
   (FindComponent('Pump' + IntToStr(i) + 'VoltageFS' + IntToStr(step))
     as TFloatSpinEdit).Enabled:= True;
   end
   else // outside live mode, disable all elements when pump is off
   begin
   (FindComponent('Pump' + IntToStr(i) + 'DirectionRG' + IntToStr(step))
     as TRadioGroup).Enabled:= (FindComponent('Pump' + IntToStr(i) + 'OnOffCB' + IntToStr(step))
     as TCheckBox).Checked;
   (FindComponent('Pump' + IntToStr(i) + 'VoltageFS' + IntToStr(step))
     as TFloatSpinEdit).Enabled:= (FindComponent('Pump' + IntToStr(i) + 'OnOffCB' + IntToStr(step))
     as TCheckBox).Checked;
   end;
  end;
  // if in live mode send trigger command generation and sending
  if LiveModeCB.Checked and OverallTimer.Enabled then
   RunImmediate;
end;

procedure TMainForm.PumpVoltageFSChange(Sender: TObject);
var
 Step, PumpNumber : integer;
 SenderName : string;
begin
 SenderName:= (Sender as TComponent).Name;
 // SenderName is in the form "PumpXVoltageFSY" and we need the X and Y
 // so get the 5th and 15th character of the name
 Step:= StrToInt(Copy(SenderName, 15, 1));
 PumpNumber:= StrToInt(Copy(SenderName, 5, 1));
 // update the resulting speed
 (FindComponent('Pump' + IntToStr(PumpNumber) + 'ResultLE' + IntToStr(Step))
  as TLabeledEdit).Text:= FloatToStr(RoundTo(
  (FindComponent('DutyCycle' + IntToStr(Step) + 'FSE')
   as TFloatSpinEdit).Value *
  (FindComponent('Pump' + IntToStr(PumpNumber) + 'VoltageFS' + IntToStr(Step))
   as TFloatSpinEdit).Value / 3.3 , -2));

 // if in live mode send trigger command generation and sending
 if LiveModeCB.Checked and OverallTimer.Enabled then
  RunImmediate;
end;

procedure TMainForm.RepeatPCChange(Sender: TObject);
// set visibility of repeat tabs
var
  i : integer;
begin
  for i:= 2 to StepNum-1 do
   if (FindComponent('Step' + IntToStr(i) + 'TS')
      as TTabSheet).TabVisible = False then
    (FindComponent('Step' + IntToStr(i+1) + 'TS')
      as TTabSheet).TabVisible:= False;
  for i:= 2 to StepNum-1 do
   if ((FindComponent('Step' + IntToStr(i) + 'UseCB')
      as TCheckBox).Checked and
      (FindComponent('Step' + IntToStr(i) + 'TS')
      as TTabSheet).TabVisible) then
    (FindComponent('Step' + IntToStr(i+1) + 'TS')
      as TTabSheet).TabVisible:= True;
end;

procedure TMainForm.RunImmediate;
// execute generated command
var
  command : string;
  CommandResult : Boolean = False;
begin
 // generate command
 CommandResult:= GenerateCommand(command);
 // if GenerateCommand returns e.g. a too long time stop
 if not CommandResult then
 begin
  StopBBClick(StopBB);
  exit;
 end;
 CommandM.Text:= command;
 commandForRepeat:= command;
 // The TinyZero has an input buffer of 512 characters, if it is full, the
 // COM connection will break (no communication posible).
 // There is a special case (in my opinion a bug) that if the input string has
 // modulo 64 characters, the TinyZero will not accept it directly. First with
 // the next command it will be executed (e.g. when pressing the Stop button).
 // The solution is to vary in this case the string termination since the
 // Arduino code checks only for the #10 char.
 if (Length(command) + 2) mod 64 = 0 then
  command:= command + #10
 else
  command:= command + LineEnding;
  // if we have an open serial connection, execute
 if HaveSerialCB.Checked then
 begin
  // disable the connection menu that the user cannot close
  // the conenction while the pumps are running
  ConnectionMI.Enabled:= False;
  DriverConnectBB.Enabled:= False;
  FirmwareUpdateMI.Enabled:= False;
  FirmwareResetMI.Enabled:= False;
  // disable menu to load and save action files
  LoadActionMI.Enabled:= False;
  SaveActionMI.Enabled:= False;
  // send the command
  ser.SendString(command);
  if ser.LastError <> 0 then
  begin
   with Application do
    MessageBox(PChar(connectedPumpName + ' error: ' + ser.LastErrorDesc),
                     'Error', MB_ICONERROR+MB_OK);
   ConnComPortLE.Color:= clRed;
   ConnComPortLE.Text:= 'Try to reconnect';
   IndicatorPanelP.Caption:= 'Connection failure';
   IndicatorPanelP.Color:= clRed;
   ConnectionMI.Enabled:= True;
   DriverConnectBB.Enabled:= True;
   RunBB.Enabled:= False;
   if ser.LastError = 9997 then
   begin
    StopBB.Enabled:= False;
    exit; // we cannot close socket or free if the connection timed out
   end;
   CloseSerialConn;
   exit;
  end;
 end
 else // no serial connection
 begin
  RunBB.Enabled:= False;
  exit;
 end;

end;

procedure TMainForm.RunBBClick(Sender: TObject);
// execute generated command
var
  command, StartTime : string;
  i, j : integer;
  CommandResult : Boolean = False;
begin
  // generate command
  CommandResult:= GenerateCommand(command);
  // if GenerateCommand returns e.g. a too long time do nothing
  if not CommandResult then
   exit;
  StopTimer.Enabled:= False;
  // whatever might happen, there must be a way to stop
  StopBB.Enabled:= True;
  CommandM.Text:= command;
  // The TinyZero has an input buffer of 512 characters, if it is full, the
  // COM connection will break (no communication posible).
  // There is a special case (in my opinion a bug) that if the input string has
  // modulo 64 characters, the TinyZero will not accept it directly. First with
  // the next command it will be executed (e.g. when pressing the Stop button).
  // The solution is to vary in this case the string termination since the
  // Arduino code checks only for the #10 char.
  if (Length(command) + 2) mod 64 = 0 then
   command:= command + #10
  else
   command:= command + LineEnding;

  // save command to be resend on every repeat if running with SIX
  commandForRepeat:= command;

  // if no serial connection, we can stop here
  if not HaveSerialCB.Checked then
  begin
   RunBB.Enabled:= False;
   exit;
  end;

  // send the command
  ser.SendString(command);
  if ser.LastError <> 0 then
  begin
   with Application do
    MessageBox(PChar(connectedPumpName + ' error: ' + ser.LastErrorDesc),
               'Error', MB_ICONERROR + MB_OK);
   ConnComPortLE.Color:= clRed;
   ConnComPortLE.Text:= 'Try to reconnect';
   IndicatorPanelP.Caption:= 'Connection failure';
   IndicatorPanelP.Color:= clRed;
   ConnectionMI.Enabled:= True;
   DriverConnectBB.Enabled:= True;
   RunBB.Enabled:= False;
   if ser.LastError = 9997 then
   begin
    StopBB.Enabled:= False;
    exit; // we cannot close socket or free if the connection timed out
   end;
   CloseSerialConn;
   exit;
  end;

  // not the pump settings when in live mode
  if not LiveModeCB.Checked then
  begin
   // the user must be able to see if the pumps 5 - 8 are set
   // therefore we cannot just disable the StepXTS component but its
   // child components except of SXPC
   for j:= 1 to StepNum do
   begin
    (FindComponent('Step' + IntToStr(j) + 'UseCB')
     as TCheckBox).Enabled:= False;
    (FindComponent('ActionTime' + IntToStr(j) + 'GB')
     as TGroupBox).Enabled:= False;
    (FindComponent('DutyCycle' + IntToStr(j) + 'GB')
     as TGroupBox).Enabled:= False;
    (FindComponent('S' + IntToStr(j) + 'P14')
     as TTabSheet).Enabled:= False;
    (FindComponent('S' + IntToStr(j) + 'P58')
     as TTabSheet).Enabled:= False;
    if j = 1 then
     // disable tooltips for pump name
     for i:= 1 to PumpNum do
      (FindComponent('Pump' + IntToStr(i) + 'GB' + IntToStr(j))
       as TGroupBox).ShowHint:= False;
   end;
  end;
  RepeatOutputLE.Visible:= False;
  // set timers
  if (StrToInt(RepeatSE.Text) > 0) and (RunEndlessCB.Checked = False) then
  begin
   RepeatOutputLE.Visible:= True;
   RepeatTime:= trunc(GlobalTime / (StrToFloat(RepeatSE.Text) + 1));
   if RepeatTime < oneDay then
    RepeatTimer.Interval:= trunc(RepeatTime)
   else // to restart timer every day
    RepeatTimer.Interval:= oneDay;
   RepeatTimer.Enabled:= True;
   CurrentRepeat:= 0;
   RepeatOutputLE.Text:= '0';
   // set time that will later be evaluated when the timer ends
  GlobalRepeatTime:= RepeatTime;
  end;
  // delete finish time
  FinishTimeLE.Text:= '';
  // output start time
  startTime := FormatDateTime('dd.mm.yyyy, hh:nn:ss', now);
  StartTimeLE.Text:= startTime;

  // start OverallTimer to indicate running state
  if GlobalTime < oneDay then
   OverallTimer.Interval:= trunc(GlobalTime)
  else // to restart timer every day
   OverallTimer.Interval:= oneDay;
  OverallTimer.Enabled:= True;
  // show first tab and start its timer
  RepeatPC.ActivePage:= Step1TS;
  StepTimer1.Enabled:= true;
  // if there are more steps, highlight the first one as being active
  // by adding an asterisk to the step name
  if Step2UseCB.Checked then
   Step1TS.Caption:= 'Step 1 *';
  // do not show unused steps
  for j:= 2 to StepNum do
  begin
   if (FindComponent('Step' + IntToStr(j) + 'UseCB')
     as TCheckBox).Checked = False then
    (FindComponent('Step' + IntToStr(j) + 'TS')
     as TTabSheet).TabVisible:= False;
  end;

end;

procedure TMainForm.SendRepeatToPump;
// sends command to pump driver
var
 errorMsg, savePumpName : string;
 MousePointer : TPoint;
begin
 if HaveSerialCB.Checked then
 begin
  ser.SendString(commandForRepeat);
  if ser.LastError <> 0 then
  begin
   // store message and COMPort because CloseSerialConn will empty them
   errorMsg:= ser.LastErrorDesc;
   savePumpName:= connectedPumpName;
   ConnComPortLE.Color:= clRed;
   ConnComPortLE.Text:= 'Try to reconnect';
   IndicatorPanelP.Caption:= 'Connection failiure';
   IndicatorPanelP.Color:= clRed;
   ConnectionMI.Enabled:= True;
   DriverConnectBB.Enabled:= True;
   RunBB.Enabled:= False;
   CloseSerialConn;
   MousePointer:= Mouse.CursorPos;
   // since the dialog will interrupt the code execution
   // it must be after ClosePumpSerialConn
   MessageDlgPos(savePumpName + ' error: '
   + errorMsg, mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   exit;
  end;
 end
 else // no serial connection
 begin
  RunBB.Enabled:= False;
  exit;
 end;
end;

procedure TMainForm.RepeatTimerFinished;
// Actions after repeat time interval ends
begin
 // if one day has passed but the pumps must run longer
 if GlobalRepeatTime > oneDay then
 begin
  GlobalRepeatTime:= GlobalRepeatTime - oneDay;
  if GlobalRepeatTime < oneDay then
   RepeatTimer.Interval:= trunc(GlobalRepeatTime)
  else // to restart timer every day
   RepeatTimer.Interval:= oneDay;
  RepeatTimer.Enabled:= True;
  exit;
 end;
 if StrToInt(RepeatSE.Text) > StrToInt(RepeatOutputLE.Text) then
 begin
  inc(CurrentRepeat);
  GlobalRepeatTime:= RepeatTime;
  RepeatTimer.Enabled:= True;
  // only increase shown repeat if not already stopped
  if IndicatorPanelP.Caption <> 'Manually stopped' then
   RepeatOutputLE.Text:= IntToStr(CurrentRepeat);
 end
 else
  RepeatTimer.Enabled:= False;
end;

procedure TMainForm.OverallTimerFinished;
// Actions after time interval ends
var
  finishTime, command : string;
  i, j : integer;
begin
 // if one day has passed but the pumps must run longer
 if GlobalTime > oneDay then
 begin
  GlobalTime:= GlobalTime - oneDay;
  if GlobalTime < oneDay then // if less than one day
   OverallTimer.Interval:= trunc(GlobalTime)
  else // to restart timer every day
   OverallTimer.Interval:= oneDay;
  OverallTimer.Enabled:= True;
  exit;
 end;
 // output finish time
 finishTime := FormatDateTime('dd.mm.yyyy, hh:nn:ss', now);
 FinishTimeLE.Text:= finishTime;
 OverallTimer.Enabled:= False;
 ConnectionMI.Enabled:= True;
 DriverConnectBB.Enabled:= True;
 FirmwareUpdateMI.Enabled:= True;
 FirmwareResetMI.Enabled:= True;
 LoadActionMI.Enabled:= True;
 SaveActionMI.Enabled:= True;
 RunBB.Caption:= 'Run Pumps';
 RunBB.Enabled:= True;
 GenerateCommandBB.Enabled:= True;
 IndicatorPanelP.Caption:= 'Run finished';
 IndicatorPanelP.Color:= clInfoBk;
 RepeatOutputLE.Visible:= False;

 // stop all pumps and valves
 command:= '/0';
 // disable all pumps
 command:= command + 'I';
 for j:= 1 to PumpNum do
  command:= command + '0';
 // execute flag and turn off LED
 command:= command + 'lR';
 // execute
 command:= command + LineEnding;
 if HaveSerialCB.Checked then
  ser.SendString(command);

 // stop all timers and reset captions
 for j:= 1 to StepNum do
 begin
  (FindComponent('StepTimer' + IntToStr(j))
   as TTimer).Enabled:= False;
  (FindComponent('Step' + IntToStr(j) + 'TS')
   as TTabSheet).Caption:= 'Step ' + IntToStr(j);
 end;
 // enable all setting possibilities only if no file is loaded
 if (LoadedActionFileM.Text = 'None')
  or (LoadedActionFileM.Text = 'Free Pumps') then
 begin
  LiveModeCB.Enabled:= True;
  RunSettingsGB.Enabled:= not LiveModeCB.Checked;
  for j:= 1 to StepNum do
  begin
   (FindComponent('Step' + IntToStr(j) + 'UseCB')
    as TCheckBox).Enabled:= True;
   (FindComponent('ActionTime' + IntToStr(j) + 'GB')
    as TGroupBox).Enabled:= True;
   (FindComponent('DutyCycle' + IntToStr(j) + 'GB')
    as TGroupBox).Enabled:= True;
   (FindComponent('S' + IntToStr(j) + 'P14')
    as TTabSheet).Enabled:= True;
   (FindComponent('S' + IntToStr(j) + 'P58')
    as TTabSheet).Enabled:= True;
   if j = 1 then
    // enable tooltips for pump name
    for i:= 1 to PumpNum do
    (FindComponent('Pump' + IntToStr(i) + 'GB' + IntToStr(j))
     as TGroupBox).ShowHint:= True;
  end;
  // view tab after last used step
  for j:= 2 to StepNum-1 do
  begin
   if (FindComponent('Step' + IntToStr(j) + 'UseCB')
       as TCheckBox).Checked then
    (FindComponent('Step' + IntToStr(j+1) + 'TS')
     as TTabSheet).TabVisible:= True
  else
   break;
  end;
  // tab 2 must always be visible except when in live mode
  if not LiveModeCB.Checked then
   Step2TS.TabVisible:= True;
 end;
 // after a Free Pums run we must reset the LoadedActionFileM
 if LoadedActionFileM.Text = 'Free Pumps' then
 begin
  LoadedActionFileM.Text:= 'None';
  LoadedActionFileM.Color:= clDefault;
  LoadedActionFileM.Hint:= 'No action file loaded';
 end;
end;

procedure TMainForm.StepTimerXFinished(Sender: TObject);
var
 Step : integer;
 SenderName : string;
begin
 SenderName:= (Sender as TComponent).Name;
 // SenderName is in the form "StepTimerX" and we need the X
 // so get the 10th character of the name
 Step:= StrToInt(Copy(SenderName, 10, 1));
 // if there is a step+1, start its timer and show its tab
 if (FindComponent('Step' + IntToStr(Step+1) + 'UseCB')
     as TCheckBox).checked then
 begin
  // the interval is calculated in GenerateCommand
  (FindComponent('StepTimer' + IntToStr(Step+1))
   as TTimer).Enabled:= True;
  RepeatPC.ActivePage:= (FindComponent('Step' + IntToStr(Step+1) + 'TS')
                         as TTabSheet);
  // highlight the new active step by adding an asterisk to the step name
  (FindComponent('Step' + IntToStr(Step+1) + 'TS')
   as TTabSheet).Caption:= 'Step ' + IntToStr(Step+1) + ' *';
 end
 else // there might be a repeat
 begin
  // switch to step 1
  StepTimer1.Enabled:= True;
  if HaveSerialCB.Checked and
   (RunEndlessCB.Checked or (RepeatSE.Value > 0)) then
   // send repeat sequence to pump driver
   SendRepeatToPump;
  RepeatPC.ActivePage:= Step1TS;
  // highlight it as active by adding an asterisk to the step name
  Step1TS.Caption:= 'Step 1 *';
 end;

 // only when there is only step 1 we must not stop the timer
 if not ((Step = 1) and (not (MainForm.FindComponent('Step' + IntToStr(Step+1) + 'UseCB')
     as TCheckBox).checked)) then
 begin
  (MainForm.FindComponent('StepTimer' + IntToStr(Step))
   as TTimer).Enabled:= False;
  // remove asterisk from current step caption
  (MainForm.FindComponent('Step' + IntToStr(Step) + 'TS')
   as TTabSheet).Caption:= 'Step ' + IntToStr(Step);
 end;
end;

procedure TMainForm.StepTimerLastFinished(Sender: TObject);
begin
 // switch to step 1
 StepTimer1.Enabled:= True;

 // send repeat sequence to pump driver
 if HaveSerialCB.Checked and
  (RunEndlessCB.Checked or (RepeatSE.Value > 0)) then
  SendRepeatToPump;

 // remove asterisk from step caption
 Step7TS.Caption:= 'Step 7';
 (FindComponent('StepTimer' + IntToStr(StepNum))
        as TTimer).Enabled:= False;

 RepeatPC.ActivePage:= Step1TS;
end;

procedure TMainForm.StopBBClick(Sender: TObject);
// stop all pumps
var
 command, stopTime : string;
 i, j, k : integer;
 MousePointer : TPoint;
begin
 // re-enable the connection menu in every case
 ConnectionMI.Enabled:= True;
 DriverConnectBB.Enabled:= True;
 FirmwareUpdateMI.Enabled:= True;
 FirmwareResetMI.Enabled:= True;
 // re-enable menu to load and save action files
 LoadActionMI.Enabled:= True;
 SaveActionMI.Enabled:= True;
 // address
 command:= '/0';
 // disable all pumps
 command:= command + 'I';
 for k:= 1 to PumpNum do
  command:= command + '0';
 // execute flag and turn off LED
 command:= command + 'lR';
 // execute
 CommandM.Text:= command;
 command:= command + LineEnding;
 if HaveSerialCB.Checked then
 begin
  ser.SendString(command);
  if ser.LastError <> 0 then
  begin
   MousePointer:= Mouse.CursorPos;
   MessageDlgPos(connectedPumpName + ' error: ' + ser.LastErrorDesc,
                 mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
   ConnComPortLE.Color:= clRed;
   ConnComPortLE.Text:= 'Try to reconnect';
   IndicatorPanelP.Caption:= 'Connection failure';
   IndicatorPanelP.Color:= clRed;
   ConnectionMI.Enabled:= True;
   DriverConnectBB.Enabled:= True;
   if ser.LastError = 9997 then
   begin
    StopBB.Enabled:= False;
    exit; // we cannot close socket or free when the connection timed out
   end;
   CloseSerialConn;
   exit;
  end;
 end;
 // output stop time only when there was actually a run
 if IndicatorPanelP.Caption = 'Pumps are running' then
 begin
  stopTime:= FormatDateTime('dd.mm.yyyy, hh:nn:ss', now);
  FinishTimeLE.Text:= stopTime;
  IndicatorPanelP.Caption:= 'Manually stopped';
  IndicatorPanelP.Color:= clHighlight;
 end;
 OverallTimer.Enabled:= False;
 RepeatTimer.Enabled:= False;
 // we must prevent that too long commands overflow the Arduino command buffer
 // therefore block the enabing to start a new action for a second
 StopTimer.Enabled:= True;
 RunBB.Enabled:= False;
 GenerateCommandBB.Enabled:= True;
 // stop all timers and reset captions
 for j:= 1 to StepNum do
 begin
  (FindComponent('StepTimer' + IntToStr(j))
   as TTimer).Enabled:= False;
  (FindComponent('Step' + IntToStr(j) + 'TS')
   as TTabSheet).Caption:= 'Step ' + IntToStr(j);
 end;
 // enable all setting possibilities only if no file is loaded
 if (LoadedActionFileM.Text = 'None')
  or (LoadedActionFileM.Text = 'Free Pumps') then
 begin
  LiveModeCB.Enabled:= True;
  RunSettingsGB.Enabled:= not LiveModeCB.Checked;
  for j:= 1 to StepNum do
  begin
   (FindComponent('Step' + IntToStr(j) + 'UseCB')
    as TCheckBox).Enabled:= True;
   // only enable action time when not run endless
   if not RunEndlessCB.Checked then
    (FindComponent('ActionTime' + IntToStr(j) + 'GB')
     as TGroupBox).Enabled:= True;
   (FindComponent('DutyCycle' + IntToStr(j) + 'GB')
    as TGroupBox).Enabled:= True;
   (FindComponent('S' + IntToStr(j) + 'P14')
    as TTabSheet).Enabled:= True;
   (FindComponent('S' + IntToStr(j) + 'P58')
    as TTabSheet).Enabled:= True;
   if j = 1 then
    // enable tooltips for pump name
    for i:= 1 to PumpNum do
     (FindComponent('Pump' + IntToStr(i) + 'GB' + IntToStr(j))
      as TGroupBox).ShowHint:= True;
  end;
  // view tab after last used step
  for j:= 2 to StepNum-1 do
  begin
   if (FindComponent('Step' + IntToStr(j) + 'UseCB')
       as TCheckBox).Checked then
    (FindComponent('Step' + IntToStr(j+1) + 'TS')
     as TTabSheet).TabVisible:= True
   else
    break;
  end;
  // tab 2 must always be visible except when in live mode
  if not LiveModeCB.Checked then
   Step2TS.TabVisible:= True;
 end;
 // after a Free Pums run we must reset the LoadedActionFileM
 if LoadedActionFileM.Text = 'Free Pumps' then
 begin
  LoadedActionFileM.Text:= 'None';
  LoadedActionFileM.Color:= clDefault;
  LoadedActionFileM.Hint:= 'No action file loaded';
 end;
end;

procedure TMainForm.StopTimerFinished;
// enable to execute new commands
begin
 RunBB.Caption:= 'Run Pumps';
 RunBB.Enabled:= True;
 StopTimer.Enabled:= False;
end;

procedure TMainForm.RunFreeBBClick(Sender: TObject);
// starts free running cycle:
// run 30 seconds in each direction 10 times
// this is like loading a *.PDAction file, therefore use the file load routines
var
 i, j : integer;
 command : string;
 ParseSuccess : Boolean;
begin
 LoadedActionFileM.Text:= 'Free Pumps';
 LoadedActionFileM.Color:= clInfoBK;
 LoadedActionFileM.Hint:= 'Free Pumps';
 // start the pumps in blocks of 3 pumps at once
 // input the action as command
 // '/0LgS199929993999D000I11100000M10
 //      S199929993999499959996999D000000I11111100M10
 //      S19992999399949995999699979998999D00000000I11111111M30000
 //      I00000000M999
 //      S199929993999D111I11100000M10
 //      S199929993999499959996999D111111I11111100M10
 //      S19992999399949995999699979998999D11111111I11111111M30000
 //      I00000000M999G9I00000000lR
 command:= '/0Lg';
 command:= command + 'S199929993999D000I11100000M10';
 command:= command + 'S199929993999499959996999D000000I11111100M10';
 command:= command + 'S19992999399949995999699979998999D00000000I11111111M30000';
 command:= command + 'I00000000M999';
 command:= command + 'S199929993999D111I11100000M10';
 command:= command + 'S199929993999499959996999D111111I11111100M10';
 command:= command + 'S19992999399949995999699979998999D11111111I11111111M30000';
 command:= command + 'I00000000M999G9I00000000lR';

 CommandM.Text:= command;
 // we set values for 8 pumps
 PumpNumFile:= 8;
 // parse the command
 ParseSuccess:= ParseCommand(command);
 if ParseSuccess then
  // call command generation just to get the action time calculated
  GenerateCommand(command);
 // disable all setting possibilities
 RunSettingsGB.Enabled:= False;
 LiveModeCB.Enabled:= False;
 for j:= 1 to StepNum do
 begin
  // the user must be able to see if the pumps 5 - 8 are set
  // therefore we cannot just disable the StepXTS component but its
  // child components except of SXPC
  (FindComponent('Step' + IntToStr(j) + 'UseCB')
   as TCheckBox).Enabled:= False;
  (FindComponent('ActionTime' + IntToStr(j) + 'GB')
   as TGroupBox).Enabled:= False;
  (FindComponent('DutyCycle' + IntToStr(j) + 'GB')
   as TGroupBox).Enabled:= False;
  (FindComponent('S' + IntToStr(j) + 'P14')
   as TTabSheet).Enabled:= False;
  (FindComponent('S' + IntToStr(j) + 'P58')
   as TTabSheet).Enabled:= False;
  if j = 1 then
   for i:= 1 to PumpNum do
   (FindComponent('Pump' + IntToStr(i) + 'GB' + IntToStr(j))
    as TGroupBox).ShowHint:= False;
 end;
 RepeatOutputLE.Visible:= False;
 // do not show unused steps
 for j:= 2 to StepNum do
 begin
  if (FindComponent('Step' + IntToStr(j) + 'UseCB')
      as TCheckBox).Checked = False then
   (FindComponent('Step' + IntToStr(j) + 'TS')
    as TTabSheet).TabVisible:= False;
 end;
 // disable saving, will be re-enabled by GererateCommand
 SaveActionMI.Enabled:= False;
 // show step 1
 RepeatPC.ActivePage:= Step1TS;
 // run
 RunBBClick(Sender);
end;

procedure TMainForm.RunEndlessCBChange(Sender: TObject);
// if the pumps should run forever
begin
  if RunEndlessCB.Checked then
  begin
   RepeatSE.Enabled:= False;
   RepeatOutputLE.Visible:= False;
   // disable runtime only, if there is only one step or in live mode
   if (not Step2UseCB.Checked) or LiveModeCB.Checked then
    ActionTime1GB.Enabled:= False;
  end
  else
  begin
   RepeatSE.Enabled:= True;
   if not Step2UseCB.Checked then
    ActionTime1GB.Enabled:= True;
  end;
end;

procedure TMainForm.StepXUseCBChange(Sender: TObject);
var
 Step, j : integer;
 SenderName : string;
begin
 SenderName:= (Sender as TComponent).Name;
 // SenderName is in the form "StepxTS" and we need the x
 // so get the 5th character of the name
 Step:= StrToInt(Copy(SenderName, 5, 1));
 if (FindComponent('Step' + IntToStr(Step) + 'UseCB')
     as TCheckBox).Checked then
 begin
  if Step <> StepNum then
   (FindComponent('Step' + IntToStr(Step+1) + 'TS')
    as TTabSheet).TabVisible:= True;
  (FindComponent('ActionTime' + IntToStr(Step) + 'GB')
   as TGroupBox).Enabled:= True;
  (FindComponent('DutyCycle' + IntToStr(Step) + 'GB')
   as TGroupBox).Enabled:= True;
  for j:= 1 to PumpNum do
   (FindComponent('Pump' + IntToStr(j) + 'GB' + IntToStr(Step))
    as TGroupBox).Enabled:= True;
  // in case it was disabled on unchecking step 2
  if (Step = 2) and (not ActionTime1GB.Enabled) then
   ActionTime1GB.Enabled:= True;
 end
 else
 begin
  if Step <> StepNum then
   (FindComponent('Step' + IntToStr(Step+1) + 'TS')
    as TTabSheet).TabVisible:= False;
  (FindComponent('ActionTime' + IntToStr(Step) + 'GB')
   as TGroupBox).Enabled:= False;
  (FindComponent('DutyCycle' + IntToStr(Step) + 'GB')
   as TGroupBox).Enabled:= False;
  for j:= 1 to PumpNum do
   (FindComponent('Pump' + IntToStr(j) + 'GB' + IntToStr(Step))
    as TGroupBox).Enabled:= False;
  // if there is only one step and endless repeat disable time settings
  if (Step = 2) and (RunEndlessCB.Checked) then
   ActionTime1GB.Enabled:= False;
 end;
 RepeatPCChange(Sender);
end;

procedure TMainForm.DutyCycleXFSEChange(Sender: TObject);
var
 DutyTime, StepTime : Double;
 j, Step : integer;
 SenderName : string;
begin
 SenderName:= (Sender as TComponent).Name;
 // SenderName is in the form "DutyCyclexFSE" and we need the x
 // so get the 10th character of the name
 Step:= StrToInt(Copy(SenderName, 10, 1));
 // reset increment to 1. If this is not sufficent,
 // it will be reset later in this procedure
 (FindComponent('RunTime' + IntToStr(Step) + 'FSE')
   as TFloatSpinEdit).Increment:= 1;
 // if the duty cycle is not 100% we must require 1.1 V for the pumps
 // otherwise the voltage would be too low to start a short movement
 if (FindComponent('DutyCycle' + IntToStr(Step) + 'FSE')
       as TFloatSpinEdit).Value < 100 then
  for j:= 1 to PumpNum do
   (FindComponent('Pump' + IntToStr(j) + 'VoltageFS' + IntToStr(Step))
     as TFloatSpinEdit).MinValue:= 1.1
 else
 begin
  for j:= 1 to PumpNum do
   (FindComponent('Pump' + IntToStr(j) + 'VoltageFS' + IntToStr(Step))
     as TFloatSpinEdit).MinValue:= 0.1;
  // also allow 50 ms OnTime because this might have been changed previously
  (FindComponent('RunTime' + IntToStr(Step) + 'FSE')
   as TFloatSpinEdit).MinValue:= 0.05;
 end;
 // calculate necessary time increment
 if ((FindComponent('DutyCycle' + IntToStr(Step) + 'FSE')
       as TFloatSpinEdit).Value / 100) >= 0.05 then
  DutyTime:= 1 // base time is 1s
 else // calculate a base time so that the OnTime is 50 ms
  DutyTime:= 0.05 / ((FindComponent('DutyCycle' + IntToStr(Step) + 'FSE')
        as TFloatSpinEdit).Value / 100);
 // if the unit is s, we can also set a new increment
 // and we must adjust the MinValue if duty is < 100 %
 if (FindComponent('Unit' + IntToStr(Step) + 'RBs')
      as TRadioButton).Checked then
 begin
  (FindComponent('RunTime' + IntToStr(Step) + 'FSE')
    as TFloatSpinEdit).Increment:= round(DutyTime);
  if (FindComponent('DutyCycle' + IntToStr(Step) + 'FSE')
       as TFloatSpinEdit).Value < 100 then
   (FindComponent('RunTime' + IntToStr(Step) + 'FSE')
     as TFloatSpinEdit).MinValue:= round(DutyTime);
 end;
 // the set time might be smaller than necessary
 StepTime:= 1; // 1s
 if (FindComponent('Unit' + IntToStr(Step) + 'RBmin')
      as TRadioButton).Checked then
  StepTime:= 60
 else if (FindComponent('Unit' + IntToStr(Step) + 'RBh')
           as TRadioButton).Checked then
  StepTime:= 3600;
 StepTime:= (FindComponent('RunTime' + IntToStr(Step) + 'FSE')
        as TFloatSpinEdit).Value * StepTime; // time in s
 if StepTime < DutyTime then
  // the maximal DutyTime is 50 s, thus the unit is already s
  (FindComponent('RunTime' + IntToStr(Step) + 'FSE')
        as TFloatSpinEdit).Value:= DutyTime;

 // update the resulting speed
 for j:= 1 to PumpNum do
  (FindComponent('Pump' + IntToStr(j) + 'ResultLE' + IntToStr(Step))
    as TLabeledEdit).Text:= FloatToStr(RoundTo(
     (FindComponent('DutyCycle' + IntToStr(Step) + 'FSE')
       as TFloatSpinEdit).Value *
     (FindComponent('Pump' + IntToStr(j) + 'VoltageFS' + IntToStr(Step))
       as TFloatSpinEdit).Value / 3.3 , -2));

 // if in live mode send trigger command generation and sending
 if LiveModeCB.Checked and OverallTimer.Enabled then
  RunImmediate;
end;

procedure TMainForm.PumpGBDblClick(Sender: TObject);
var
 j, Pump : integer;
 SenderName : string;
begin
 SenderName:= (Sender as TComponent).Name;
 // SenderName is in the form "PumpxGBy" and we need the x
 // so get the 5th character of the name
 Pump:= StrToInt(Copy(SenderName, 5, 1));
 // show in dialog always the name from the first step
 PumpNameSettingF.PumpNameE.Text:=
   (FindComponent('Pump' + IntToStr(Pump) + 'GB1') as TGroupBox).Caption;
 // open connection dialog
 PumpNameSettingF.ShowModal;
 if PumpNameSettingF.ModalResult = mrCancel then
  exit
 else
  for j:= 1 to StepNum do
   (FindComponent('Pump' + IntToStr(Pump) + 'GB' + IntToStr(j))
    as TGroupBox).Caption:= PumpNameSettingF.PumpNameE.Text;
end;

// opening --------------------------------------------------------------------

procedure TMainForm.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
begin
 DropfileName:= FileNames[0];
 LoadActionMIClick(Sender);
 DropfileName:= '';
end;

procedure TMainForm.LoadActionMIClick(Sender: TObject);
var
 FileSuccess : Boolean = false;
 ParseSuccess : Boolean = false;
 MousePointer : TPoint;
 command, DummyString : string;
 i, j : integer;
begin
 MousePointer:= Mouse.CursorPos; // store mouse position
 DummyString:= '';

 if DropFileName <> '' then // a file was dropped into the main window
  FileSuccess:= OpenFile(DropFileName)
 else
 begin
  OpenDialog.InitialDir:= '';
  OpenDialog.FileName:= '';
  if OpenDialog.Execute then
  begin
   if not FileExists(OpenDialog.FileName) then
   begin
    MessageDlgPos('The file' + LineEnding + OpenDialog.FileName + LineEnding
     + 'cannot be opened or does not exist.',
     mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
    exit;
   end;
   FileSuccess:= OpenFile(OpenDialog.FileName);
  end
  else
   exit; // user aborted the loading
 end;
 if not FileSuccess then
  MessageDlgPos('Error while attempting to open file',
   mtError, [mbOK], 0, MousePointer.X, MousePointer.Y)
 else
 begin
  // an action file is never live mode
  if LiveModeCB.Checked then
   LiveModeCB.Checked:= False;
  // make all steps visible because they might be invisible due to a prior loading
  for j:= 2 to StepNum do
   (FindComponent('Step' + IntToStr(j) + 'TS')
    as TTabSheet).TabVisible:= True;
  if DropFileName <> '' then
   InName:= DropFileName
  else
   InName:= OpenDialog.FileName;
  SaveDialog.FileName:= ''; // will be re-set in TMainForm.SaveHandling
  // show the full path as tooltip
  LoadedActionFileM.Hint:= InName;
  // display file name without suffix
  DummyString:= ExtractFileName(InName);
  SetLength(DummyString, Length(DummyString) - 9);
  LoadedActionFileM.Text:= DummyString;
  LoadedActionFileM.Color:= clActiveCaption;
  command:= CommandM.Text;
  // parse the command
  ParseSuccess:= ParseCommand(command);
  if ParseSuccess then
   // call command generation to get the action time calculated and to add
   // time steps in case many pumps have to be started at once
   GenerateCommand(command);

  // disable all setting possibilities
  RunSettingsGB.Enabled:= False;
  LiveModeCB.Enabled:= False;
  PumpSetupGB.Enabled:= False;
  for j:= 1 to StepNum do
  begin
   // the user must be able to see if the pumps 5 - 8 are set
   // therefore we cannot just disable the StepXTS component but its
   // child components except of SXPC
   (FindComponent('Step' + IntToStr(j) + 'UseCB')
    as TCheckBox).Enabled:= False;
   (FindComponent('ActionTime' + IntToStr(j) + 'GB')
    as TGroupBox).Enabled:= False;
   (FindComponent('DutyCycle' + IntToStr(j) + 'GB')
    as TGroupBox).Enabled:= False;
   (FindComponent('S' + IntToStr(j) + 'P14')
    as TTabSheet).Enabled:= False;
   (FindComponent('S' + IntToStr(j) + 'P58')
    as TTabSheet).Enabled:= False;
   if j = 1 then
    for i:= 1 to PumpNum do
    (FindComponent('Pump' + IntToStr(i) + 'GB' + IntToStr(j))
     as TGroupBox).ShowHint:= False;
  end;
  RepeatOutputLE.Visible:= False;
  // do not show unused steps
  for j:= 2 to StepNum do
  begin
   if (FindComponent('Step' + IntToStr(j) + 'UseCB')
       as TCheckBox).Checked = False then
    (FindComponent('Step' + IntToStr(j) + 'TS')
     as TTabSheet).TabVisible:= False;
  end;
 // disable saving, will be re-enabled by GererateCommand
 SaveActionMI.Enabled:= False;
 // show step 1
 RepeatPC.ActivePage:= Step1TS;
 end; // else if not FileSuccess
end;

function TMainForm.OpenFile(InputName: string): Boolean;
// read file content
var
 StringList : TStringList;
 j, k : integer;
begin
 // initialize
 result:= False;
 PumpNumFile:= 0;

 try
  StringList:= TStringList.Create;
  k:= StringList.Count;
  // add all file lines to the string list
  StringList.LoadFromFile(InputName);

  CommandM.Text:= StringList[0];

  // get the number of pumps
  for j:= 1 to StringList.Count - 1 do
  begin
   // if a line begins with 'Pump' we know it defines a pump
   if LeftStr(StringList[j], 4) = 'Pump' then
    inc(PumpNumFile);
  end;

  if StringList.Count = 1 then // no pump names defined (in old files)
  begin
   for k:= 1 to PumpNum do
    (FindComponent('Pump' + IntToStr(k) + 'GB1')
     as TGroupBox).Caption:= 'Pump ' + IntToStr(k);
  end
  else
  begin
   // read the pump names
   for k:= 1 to PumpNumFile do
    (FindComponent('Pump' + IntToStr(k) + 'GB1')
     as TGroupBox).Caption:= Copy(StringList[k], Length(PumpPrefix) + 1,
                                  Length(StringList[k])); // omit the prefix
   if PumpNumFile < PumpNum then // reset names of undefined pumps
   begin
    for k:= PumpNumFile + 1 to PumpNum do
     (FindComponent('Pump' + IntToStr(k) + 'GB1')
      as TGroupBox).Caption:= 'Pump ' + IntToStr(k);
   end;
  end;

  // set the pump names for all other steps
  for j:= 2 to StepNum do
  begin
   for k:= 1 to PumpNum do
   begin
    (FindComponent('Pump' + IntToStr(k) + 'GB' + IntToStr(j))
     as TGroupBox).Caption:= (FindComponent('Pump' + IntToStr(k) + 'GB1')
     as TGroupBox).Caption;
   end;
  end;

  // update available pumps
  PumpNumberSE.Value:= PumpNumFile;

  result:= True;
 finally
  StringList.Free;
 end;
end;

function TMainForm.ParseCommand(command: string): Boolean;
// parses the input command
var
 address : string;
 SOrder : array of char;
 LastParsed : char = 'X';
 StepCounter, MCounter, ICounter, i, j, k, G1, p,
   posSfirst, posSlast : integer;
 MousePointer : TPoint;
 StepTime, M1, M2, DutyStepTime : Double;
 Have2M : Boolean;
begin
 MousePointer:= Mouse.CursorPos; // store mouse position
 StepCounter:= 0; MCounter:= 0; ICounter:= 0;
 M1:= 0; M2:= 0; G1:= 0;
 result:= false; Have2M:= false; StepTime:= 0;
 setLength(SOrder{%H-}, PumpNumFile);
 for k:= 0 to PumpNumFile-1 do
  SOrder[k]:= '0';

 // first check address
 address:= Copy(command, 0, 2);
 if address <> '/0' then
 begin
  MessageDlgPos('Error: Loaded file does not begin with ''/0''.',
   mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
  LoadedActionFileM.Text:= 'None';
  LoadedActionFileM.Color:= clDefault;
  LoadedActionFileM.Hint:= 'No action file loaded';
  CommandM.Text:= '';
  exit;
 end;

 // disable all steps, will be re-enabled while parsing
 for j:= 2 to StepNum do
  (FindComponent('Step' + IntToStr(j) + 'UseCB')
   as TCheckBox).Checked:= false;

 // set default values
 RepeatSE.Value:= 0;
 RunEndlessCB.Checked:= false;
 // set all duty cylces to 100%
 for j:= 1 to StepNum do
  (FindComponent('DutyCycle' + IntToStr(j) + 'FSE')
   as TFloatSpinEdit).Value:= 100;

 // before we can parse the command, we need to clean it up
 // there might be 10 ms long steps in it used to start many motors at once
 // we ignore these because they will automatically be re-added at the
 // next pump run
 i:= 2;
 posSfirst:= 0;
 posSlast:= 0;
 // parse from 'S' to the next 'S'
 while i < length(command) do
 begin
  if command[i] = 'S' then
  begin
   if posSfirst = 0 then
    posSfirst:= i
   else
    posSlast:= i;
  end;
  // check if the M command is 'M10' and only then cut out from the command
  if (posSfirst > 0) and (posSlast > 0)
   and (Copy(command, posSlast - 3, 3) = 'M10') then
  begin
   Delete(command, posSfirst, posSlast - posSfirst);
   i:= posSfirst;
   posSfirst:= 0;
   posSlast:= 0;
  end
  else if (posSfirst > 0) and (posSlast > 0) then
  begin
   posSfirst:= 0;
   posSlast:= 0;
  end
  else
   inc(i);
 end;

 // parse the command
 for i:= 2 to Length(command) do
 begin

  // parse step 'S'
  if command[i] = 'S' then
  begin
   // syntax is "Sxyyy" with yyy/1000 * 3.3 = voltage
   inc(StepCounter);
   MCounter:= 0; // there can be several occurrences of 'M' for every step
   ICounter:= 0; // there can be several occurrences of 'I' for every step
   // initialize
   for k:= 0 to PumpNumFile-1 do
    SOrder[k]:= '0';
   LastParsed:= 'S';
   // determine the length
   j:= i;
   repeat
    inc(j)
   until IsDigit(command[j]) = false;
   // set the direction according to the SOrder command[i+k+1]
   k:= 1;
   while k < j-i do
   begin
    for p:= 1 to PumpNumFile do
     if command[i+k] = IntToStr(p) then
     begin
     (FindComponent('Pump' + IntToStr(p) + 'VoltageFS' + IntToStr(StepCounter))
      as TFloatSpinEdit).Text:= FloatToStr((StrToInt(Copy(command, i+k+1, 3))) / 999 * 3.3);
      SOrder[trunc((k-1)/4)]:= IntToStr(p)[1];
     end;
    k:= k + 4; // after number are 3 digits
   end; // end while
  end; // end parse 'S'

  // parse step 'D'
  if command[i] = 'D' then
  begin
   // D is always connected to 'S', thus use the same StepCounter
   // syntax is Dxxxx, with x = [0,1] and there might only be one x
   // this is also possible: S39991999D11, then the first 1 belongs to pump 3
   LastParsed:= 'D';
   // determine the length
   j:= i;
   repeat
    inc(j)
   until IsDigit(command[j]) = false;
   // set the direction according to the SOrder
   for k:= 1 to j-i-1 do
   begin
    if command[i+k] = '1' then
    (FindComponent('Pump' + SOrder[k-1] + 'DirectionRG' + IntToStr(StepCounter))
     as TRadioGroup).ItemIndex:= 1
    else
    (FindComponent('Pump' + SOrder[k-1] + 'DirectionRG' + IntToStr(StepCounter))
     as TRadioGroup).ItemIndex:= 0;
   end;
  end; // end parse 'D'

  // parse step 'I'
  if command[i] = 'I' then
  begin
   // syntax is Ixxxx, with x = [0,1] and there might only be one x
   // 'I' can occur twice in one step, thus use StepCounter but only
   // parse the first occurence
   // there might also be no 'S' before 'I', then we must increase StepCounter
   // this is the case if:
   //  - the last parsed command is 'G'
   //  - the last parsed command is 'M' >= 1s and the next 'M' is >= 1 s
   //  - StepCounter is -1
   if (LastParsed = 'M') and (StepTime >= 1) then
   begin
    // check if there is a next 'M' with 1s
    if (command[i+PumpNumFile+1] = 'M') then
    begin
     // determine the length
     j:= i + PumpNumFile + 1;
     repeat
      inc(j)
     until IsDigit(command[j]) = false;
     StepTime:= StrToFloat(Copy(command, i+PumpNumFile+2, j-i-(PumpNumFile+2))) / 1000;
     if (StepTime >= 1) then
     begin
      inc(StepCounter);
      ICounter:= 0;
      MCounter:= 0;
     end;
    end;
   end;
   if (StepCounter = 0)
    or ((LastParsed = 'G') and (command[i+PumpNumFile+2] <> 'R')) then // not if last 'I'
   begin
    inc(StepCounter);
    ICounter:= 0;
    MCounter:= 0;
   end;
   inc(ICounter);
   LastParsed:= 'I';
   // only output if it is the first occurence in a step
   if ICounter = 1 then
   begin
    // enable the step
    (FindComponent('Step' + IntToStr(StepCounter) + 'UseCB')
     as TCheckBox).Checked:= true;
    // set the pumps
    if command[i+1] = '1' then
    (FindComponent('Pump1OnOffCB' + IntToStr(StepCounter))
      as TCheckBox).Checked:= true
    else
     (FindComponent('Pump1OnOffCB' + IntToStr(StepCounter))
      as TCheckBox).Checked:= false;
    for p:= 2 to PumpNumFile do
    begin
     if (command[i+p] = '0') or (command[i+p] = '1') then
      if command[i+p] = '1' then
       (FindComponent('Pump' + IntToStr(p) + 'OnOffCB' + IntToStr(StepCounter))
        as TCheckBox).Checked:= true
      else
       (FindComponent('Pump' + IntToStr(p) + 'OnOffCB' + IntToStr(StepCounter))
        as TCheckBox).Checked:= false;
    end;
   end;
  end; // end parse 'I'

  // parse step 'M'
  if command[i] = 'M' then
  begin
   // M can occur twice in one step, thus use StepCounter
   // but only parse the first occurence
   // syntax is Mxxxx, with x = time in milliseconds
   inc(MCounter);
   LastParsed:= 'M';
   // determine the length
   j:= i;
   repeat
    inc(j)
   until IsDigit(command[j]) = false;
   StepTime:= StrToFloat(Copy(command, i+1, j-i-1)) / 1000;
   // only output if it is the first occurence in a step
   if MCounter = 1 then
   begin
    if (StepTime >= 1000) and (StepTime < 60000) then
    begin
     (FindComponent('RunTime' + IntToStr(StepCounter) + 'FSE')
      as TFloatSpinEdit).Value:= StepTime / 60;
     (FindComponent('Unit' + IntToStr(StepCounter) + 'RBmin')
      as TRadioButton).Checked:= true;
     end;
    if (StepTime > 60000) then
    begin
     (FindComponent('RunTime' + IntToStr(StepCounter) + 'FSE')
      as TFloatSpinEdit).Value:= StepTime / 3600;
     (FindComponent('Unit' + IntToStr(StepCounter) + 'RBh')
      as TRadioButton).Checked:= true;
    end;
    if (StepTime < 1000) then
    begin
     (FindComponent('RunTime' + IntToStr(StepCounter) + 'FSE')
      as TFloatSpinEdit).Value:= StepTime;
     (FindComponent('Unit' + IntToStr(StepCounter) + 'RBs')
      as TRadioButton).Checked:= true;
    end;
    // store the time for a possible duty cycle calculation
    M1:= StepTime;
   end
   else if MCounter = 2 then
   begin
    // store the second time for the duty cycle
    M2:= StepTime;
    Have2M:= true;
   end;
  end; // end parse 'M'

  // parse step 'G'
  if command[i] = 'G' then
  // the frontend only supports maximal one loop nesting level e.g. ggXGAgXGBGC
  begin
   LastParsed:= 'G';
   // if we have 2 'M' statements and M1 < 1, then 'G' is for the duty cycle
   // if there is no digit, it is the overall loop run forever
   if not isDigit(command[i+1]) then
    RunEndlessCB.Checked:= true
   else
   begin
    // determine the length
    j:= i;
    repeat
     inc(j)
    until IsDigit(command[j]) = false;
    if Have2M and (M1 < 1) then
     G1:= StrToInt(Copy(command, i+1, j-i-1))
    else
     RepeatSE.Text:= Copy(command, i+1, j-i-1);
    RunEndlessCB.Checked:= false;
   end;
   if Have2M and (M1 < 1) then
   begin
    // calculate duty cycle
    (FindComponent('DutyCycle' + IntToStr(StepCounter) + 'FSE')
     as TFloatSpinEdit).Value:= M1 / (M1 + M2) * 100;
    // calculate step time
    DutyStepTime:= (M1 + M2) * (G1 + 1);
    if (DutyStepTime >= 1000) and (DutyStepTime < 60000) then
    begin
     (FindComponent('RunTime' + IntToStr(StepCounter) + 'FSE')
      as TFloatSpinEdit).Value:= DutyStepTime / 60;
     (FindComponent('Unit' + IntToStr(StepCounter) + 'RBmin')
      as TRadioButton).Checked:= true;
     end;
    if (DutyStepTime > 60000) then
    begin
     (FindComponent('RunTime' + IntToStr(StepCounter) + 'FSE')
      as TFloatSpinEdit).Value:= DutyStepTime / 3600;
     (FindComponent('Unit' + IntToStr(StepCounter) + 'RBh')
      as TRadioButton).Checked:= true;
    end;
    if (DutyStepTime < 1000) then
    begin
     (FindComponent('RunTime' + IntToStr(StepCounter) + 'FSE')
      as TFloatSpinEdit).Value:= DutyStepTime;
     (FindComponent('Unit' + IntToStr(StepCounter) + 'RBs')
      as TRadioButton).Checked:= true;
    end;
    Have2M:= false;
   end;
  end; // end parse 'G'

 end; // end parse the command

 result:= true;

end;

// saving ---------------------------------------------------------------------

procedure TMainForm.SaveActionMIClick(Sender: TObject);
 // writes serial command and pump names into a text file
var
 OutName, command : string;
 SaveFileStream : TFileStream;
 CommandResult : Boolean;
 k : integer;
 MousePointer : TPoint;
begin
 MousePointer:= Mouse.CursorPos; // store mouse position

 // generate command according to current settings
 CommandResult:= GenerateCommand(command);
 // if GenerateCommand returns e.g. a too long time do nothing
 if not CommandResult then
  exit;
 CommandM.Text:= command;
 OutName:= '';
 OutName:= SaveHandling(InName, false); // opens file dialog
 if OutName <> '' then
 begin
  if FileExists(OutName) then
  begin
   try
    SaveFileStream:= TFileStream.Create(OutName, fmOpenReadWrite);
   except
    on EFOpenError do
    begin
     MessageDlgPos('Action file is used by another program and cannot be opened.',
                   mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
     exit;
    end;
   end;
   // the new command might be shorter, therefore delete its content
   SaveFileStream.Size:= 0;
  end
  else
  begin
   try
    SaveFileStream:= TFileStream.Create(OutName, fmCreate);
   except
    on EFOpenError do
    begin
     MessageDlgPos('Action file could not be created.' + LineEnding +
                   'Probably you don''t have write access to the specified folder.',
                   mtError, [mbOK], 0, MousePointer.X, MousePointer.Y);
     exit;
    end;
   end;
  end;

  try
   // write the command
   SaveFileStream.Write(command[1], Length(command));
   SaveFileStream.Write(LineEnding, 2); // line break
   // write the pump names
   // only do this if there are pumps
   if PumpNum > 0 then
   begin
    for k:= 1 to PumpNum do
    begin
     SaveFileStream.Write(PumpPrefix[1], Length(PumpPrefix)); // prefix
     if (FindComponent('Pump' + IntToStr(k) + 'GB1')
       as TGroupBox).Caption <> '' then // one cannot output an empty name via FileStream.Write
      SaveFileStream.Write((FindComponent('Pump' + IntToStr(k) + 'GB1')
       as TGroupBox).Caption[1],
       Length((FindComponent('Pump' + IntToStr(k) + 'GB1') as TGroupBox).Caption));
     SaveFileStream.Write(LineEnding, 2);
    end;
   end;
  finally
   SaveFileStream.Free;
  end; //end finally
 end; //end if OutName <> ''
end;

function TMainForm.SaveHandling(InName: string; const Calculation: Boolean): string;
// handles the save dialog
var YesNo : integer;
    OutNameTemp : string;
begin
 result:= '';
 // propose a file name
 if (InName <> '') and (SaveDialog.FileName = '') then
  SaveDialog.FileName:= ExtractFileName(InName);
 if SaveDialog.FileName <> '' then
  SaveDialog.FileName:= ExtractFileName(SaveDialog.FileName);
 if SaveDialog.Execute then
 begin
  OutNameTemp:= SaveDialog.FileName;
  // add file extension '.PDAction' if it is missing
  if (ExtractFileExt(OutNameTemp) <> '.PDAction') then
   Insert('.PDAction', OutNameTemp, Length(OutNameTemp) + 1);
  if FileExists(OutNameTemp) then
  begin
   with CreateMessageDialog // MessageDlg with mbNo as default
       ('Do you want to overwrite the existing file' + LineEnding
             + ExtractFileName(OutNameTemp) + ' ?',
             mtWarning, [mbYes]+[mbNo]) do
   try
    ActiveControl:= FindComponent('NO') as TWinControl;
    YesNo:= ShowModal;
   finally
    Free;
   end;
   if YesNo = mrNo then // if No
   begin
    SaveHandling(InName, Calculation);
    exit;
   end
   else // if Yes
   begin
    result:= OutNameTemp;
    // store last used name
    SaveDialog.FileName:= ExtractFileName(OutNameTemp);
    exit;
   end;
  end; // end if FileExists

  result:= OutNameTemp;
  // store last used name
  SaveDialog.FileName:= ExtractFileName(OutNameTemp);
 end; // end if TabelleSpeichernDialog.Execute

end;

procedure TMainForm.CloseSerialConn;
begin
 if HaveSerialCB.Checked then
 begin
  // close connection
  ser.CloseSocket;
  ser.Free;
  HaveSerialCB.Checked:= False;
  connectedPumpName:= '';
  connectedPumpDriver:= 0;
  StopBBClick(StopBB as TObject);
 end;

end;

procedure TMainForm.COMPortScan;
// this routine scanes all open COM ports for pump drivers
var
 Reg : TRegistry;
 RegStrings : TStrings;
 PortName, connectedPortNameDriver, command,
   FirmwareVersion, driverFeedback : string;
 serTest : TBlockSerial;
 i, k, ErrorCount, Channel : integer;
begin
 // determine all possible COM ports
 Reg:= TRegistry.Create;
 RegStrings:= TStringList.Create;
 try
  Reg.RootKey:= HKEY_LOCAL_MACHINE;
  if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
  begin
   // if connected, get the port number to exclude it from beeing connected
   if HaveSerialCB.Checked then
    for i:= 1 to Length(COMList) - 1 do
    begin
     if COMList[i] = connectedPumpDriver then
      begin
       connectedPortNameDriver:= 'COM' + IntToStr(i);
       break;
      end;
     end;
   SetLength(COMList, 0); // delete array
   SetLength(COMList, 999); // a PC cannot have more than 999 COM ports
   Reg.GetValueNames(RegStrings);
  end;

  // since the COM port scan can take some time depending on how many SIX/pumps
  // are connected, display a progess bar
  ScanningProgressF:= TScanningProgressF.Create(Nil);
  if RegStrings.Count > 2 then
  begin
   ScanningProgressF.ScanningPB.Max:= RegStrings.Count;
   ScanningProgressF.Show;
   // that the OS can refresh its window list
   Application.ProcessMessages;
  end;

  // now test all COM ports
  for i:= 0 to RegStrings.Count - 1 do
  begin
   PortName:= Reg.ReadString(RegStrings[i]);
   ScanningProgressF.ScanningPB.Position:= i;

   // that the application is alive and to assure the changed
   // progress bar is shown
   Application.ProcessMessages;

   // the pump drivers emits on every received command the firmware
   // this is how we can detect them
   FirmwareVersion:= '';
   ErrorCount:= 0;

   // when there is a connection, we must first test if this is still alive
   // - if yes, we must directly take the driver number
   // since we cannot connect to an already connected port
   // - if not we must close the connection
   if HaveSerialCB.Checked and (PortName = connectedPortNameDriver) then
   begin
    // to check the live state send a command
    try
     ser.SendString('/0lR' + LineEnding);
    finally
     if ser.LastError <> 0 then
     begin
      ConnComPortLE.Color:= clRed;
      ConnComPortLE.Text:= 'Try to reconnect';
      IndicatorPanelP.Caption:= 'Connection failure';
      IndicatorPanelP.Color:= clRed;
      ConnectionMI.Enabled:= True;
      RunBB.Enabled:= False;
      StopBB.Enabled:= False;
      CloseSerialConn;
      inc(ErrorCount);
     end;
    end;
    if ErrorCount > 0 then
     continue;
    Channel:= StrToInt(Copy(connectedPortNameDriver, 4, 4));
    COMList[Channel]:= connectedPumpDriver;
    continue;
   end;

   // open the connection
   try
    try
     serTest:= TBlockSerial.Create;
     serTest.DeadlockTimeout:= 1000; //set timeout to 1 s
     serTest.Connect(PortName);
     // the config must be set after the connection
     serTest.config(9600, 8, 'N', SB1, False, False);
    except
     continue;
    end;

    // get Firmware version by first sending a command and receiving the reply
    try
     // if another pump driver is currently running, don't send it a command
     if serTest.LastError = 0 then
     begin
      command:= '/0lR' + LineEnding;
      serTest.SendString(command);
      driverFeedback:= serTest.Recvstring(1000);
     end;
    finally
     if serTest.LastError <> 0 then
      inc(ErrorCount);
    end;

   finally
    serTest.Free;
   end;

   if ErrorCount > 0 then
    continue;

   // driverFeedback has now either this format:
   // "JT-PumpDriver-ID zz\nJT-PumpDriver-Firmware x.y\n Received command:..."
   // or this format:
   // "JT-PumpDriver-Firmware x.y\n Received command:..."
   // on very old firmware this format:
   // "received command:..."

   // check for a number dot to get the firmware version
   if Pos('JT-PumpDriver-Firmware', driverFeedback) > 0 then
    FirmwareVersion:= copy(driverFeedback, Pos('.', driverFeedback) - 1, 3)
   // omit the 'r' because some versions used a capital letter 'R'
   else if Pos('eceived command:', FirmwareVersion) > 0 then
    FirmwareVersion:= 'unknown'
   else // no pump driver
    continue;

   Channel:= StrToInt(Copy(PortName, 4, 4));
   // determine the driver ID: from first space to first #10
   // (driver uses only #10 for the line ending)
   k:= Length('JT-PumpDriver-ID');
   if copy(driverFeedback, 0, k) = 'JT-PumpDriver-ID' then
   begin
    driverFeedback:= copy(driverFeedback, k + 2,
                          (Pos(#10, driverFeedback) - 1) - (k + 1));
    COMList[Channel]:= StrToInt(driverFeedback);
   end;
   if COMList[Channel] = 0 then // no driver ID
    COMList[Channel]:= 1;

  end; // test all COM ports
 finally
  Reg.Free;
  RegStrings.Free;
  ScanningProgressF.Close;
  ScanningProgressF.Free;
 end;

end;

procedure TMainForm.LoadAppearance(iniFile: string);
var
 i, m : integer;
 List : TStringList;
begin

 try
  List:= TStringList.Create;
  List.LoadFromFile(iniFile);
  m:= 0;
  // first readout the number of pumps
  PumpNumberSE.Value:= StrToInt(
   Copy(List[m], Pos(' ', List[m]) + 1, List[m].Length));
  inc(m);
  // readout the last pump names
  for i:= 1 to 8 do
  begin
   (FindComponent('Pump' + IntToStr(i) + 'GB1')
     as TGroupBox).Caption:=
         Copy(List[m], Pos(' ', List[m]) + 1, List[m].Length);
   inc(m);
  end;

 finally
  List.Free;
 end;
end;

procedure TMainForm.SaveAppearance(iniFile: string);
var
 i : integer;
 List: TStringList;
begin

try
 List:= TStringList.Create;

 // first store pump setup
 List.Add('PumpNumberSE.Value ' + IntToStr(PumpNumberSE.Value));

 // store pump names
 for i:= 1 to 8 do
 begin
  List.Add('Pump' + IntToStr(i) + 'GB1.Caption ' +
   (FindComponent('Pump' + IntToStr(i) + 'GB1')
     as TGroupBox).Caption);
 end;

 // save the list
 List.SaveToFile(iniFile);

finally
 List.Free;
end;

end;

end.

