unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, TAGraph, TASources, TASeries, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart2LineSeries1: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart6LineSeries2: TLineSeries;
    Image_Correlation_Coefficient_of_Source_1: TImage;
    Image_Correlation_Coefficient_of_Source_2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label_Correlation_Coefficient_of_Source_1: TLabel;
    Label_AvgSource1: TLabel;
    Label_AvgSource2: TLabel;
    Label_AvgSource3: TLabel;
    Label_AvgSource4: TLabel;
    Label_CloseOrderPriceSource1: TLabel;
    Label_CloseOrderPriceSource2: TLabel;
    Label_CloseOrderPriceSource3: TLabel;
    Label_CloseOrderPriceSource4: TLabel;
    Label_Correlation_Coefficient_of_Source_2: TLabel;
    Label_Source2_r: TLabel;
    Label_Source1_Summation_X: TLabel;
    Label_Correlation: TLabel;
    Label_Correlation1: TLabel;
    Label_Correlation2: TLabel;
    Label_Correlation2__: TLabel;
    Label_Correlation2__1: TLabel;
    Label_Correlation3: TLabel;
    Label_Correlation_: TLabel;
    Label_Correlation_1: TLabel;
    Label_Dif_Source1_AvgSource1: TLabel;
    Label_Dif_Source1_AvgSource2: TLabel;
    Label_Dif_Source2_AvgSource2: TLabel;
    Label_Dif_Source2_AvgSource3: TLabel;
    Label_I1: TLabel;
    Label_I1_: TLabel;
    Label_I1_1: TLabel;
    Label_I2: TLabel;
    Label_S1: TLabel;
    Label_S1_: TLabel;
    Label_S1_1: TLabel;
    Label_S2: TLabel;
    Label_Serquent: TLabel;
    Label_Counter: TLabel;
    Label_Source1: TLabel;
    Label_Source2_Summation_X: TLabel;
    Label_Source2_Summation_X_power: TLabel;
    Label_Source2_Summation_X_Y: TLabel;
    Label_Source1_Summation_Y: TLabel;
    Label_Source1_Summation_X_power: TLabel;
    Label_Source1_Summation_X_Y: TLabel;
    Label_Source2_Summation_Y: TLabel;
    Label_Source1_Summation_Y_power: TLabel;
    Label_Source1_r: TLabel;
    Label_Source2_Summation_Y_power: TLabel;
    Label_Source2: TLabel;
    Label_Source3: TLabel;
    Label_Source4: TLabel;
    Label_Source5: TLabel;
    Label_Source6: TLabel;
    Label_Source7: TLabel;
    Label_Source8: TLabel;
    Label_Sqrt_I1_S1: TLabel;
    Label_Sqrt_I1_S2: TLabel;
    Label_U: TLabel;
    Label_U1: TLabel;
    Label_U_: TLabel;
    Label_U_1: TLabel;
    PageControl2: TPageControl;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Source1_1: TEdit;
    Source1_10: TEdit;
    Source1_2: TEdit;
    Source1_3: TEdit;
    Source1_4: TEdit;
    Source1_5: TEdit;
    Source1_6: TEdit;
    Source1_7: TEdit;
    Source1_8: TEdit;
    Source1_9: TEdit;
    Source2_1: TEdit;
    Source2_10: TEdit;
    Source2_2: TEdit;
    Source2_3: TEdit;
    Source2_4: TEdit;
    Source2_5: TEdit;
    Source2_6: TEdit;
    Source2_7: TEdit;
    Source2_8: TEdit;
    Source2_9: TEdit;
    TabSheet_Correlation_Coefficient_of_Source_2: TTabSheet;
    TabSheet_Correlation_Coefficient_of_Source_1: TTabSheet;
    TabSheet_Equation01: TTabSheet;
    TabSheet_Equation02: TTabSheet;
    _Source1_: TListChartSource;
    _Base_: TListChartSource;
    _Source2_: TListChartSource;
    PageControl1: TPageControl;
    TTabSheet_Database: TTabSheet;
    TTabSheet_Chart: TTabSheet;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Cal_();
    procedure Cal_CorrelationCoefficient();
    procedure DisplayStatus();
    procedure Source1_Up_To_TargetSource1(Loop_: integer);
    procedure Source1_Down_To_Base(Loop_: integer);
    procedure Source1_Down_To_TargetSource2(Loop_: integer);
    procedure Source1_Up_To_Base(Loop_: integer);
    procedure Source2_Down_To_TarrgetSource2(Loop_: integer);
    procedure Source2_Up_To_Base(Loop_: integer);
    procedure Source2_Up_To_TargetSource1(Loop_: integer);
    procedure Source2_Down_To_Base(Loop_: integer);
    procedure Source1_Up_To_TargetSource1_Source2_Down_To_TargetSource2(Loop_: integer);
    procedure Source1_Down_To_TargetSource2_Source2_Up_To_TargetSource1(Loop_: integer);
    procedure Source1_Up_To_Base_Source2_Down_To_Base(Loop_: integer);
  private

  public

  end;
  Type
  CalFunction = Record
    AvgSource1_:double;
    AvgSource2_:double;
    CloseOrderPriceSource1:double;
    CloseOrderPriceSource2:double;
    Dif_Source1_AvgSource1:double;
    Dif_Source2_AvgSource2:double;
    U_:double;
    I1_:double;
    S1_:Double;
    Sqrt_I1_S1:Double;
    Correlation_:double;
    Correlation2_:double;
  end;

  Type
  Correlation_Coefficient = Record
    Summation_X:double;
    Summation_Y:double;
    Summation_X_Y:double;
    Summation_X_power:double;
    Summation_Y_power:double;
    r_:double;
  end;

var
  Form1: TForm1;
  Base_: array of integer;
  CurrentSource1: array of integer;
  TargetSource1: array of integer;
  CurrentSource2: array of integer;
  TargetSource2: array of integer;
  Counter_: integer;
  Serquent_:integer;

  CalFunction1:CalFunction;
  CalFunction2:CalFunction;

  CorrelationCoefficient1:Correlation_Coefficient;
  CorrelationCoefficient2:Correlation_Coefficient;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
  TotalBase:integer;
  //TotalTargetSource:integer;
  //Finlish_:boolean;
  Gain_:integer;

begin
  Randomize();
  Setlength(Base_,10);
  Setlength(CurrentSource1,10);
  Setlength(TargetSource1,10);
  Setlength(CurrentSource2,10);
  Setlength(TargetSource2,10);
  Counter_:=0;
  Serquent_:=0;

  CalFunction1.AvgSource1_:=0;
  CalFunction1.AvgSource2_:=0;
  CalFunction1.CloseOrderPriceSource1:=0;
  CalFunction1.CloseOrderPriceSource2:=0;
  CalFunction1.Dif_Source1_AvgSource1:=0;
  CalFunction1.Dif_Source2_AvgSource2:=0;
  CalFunction1.U_:=0;
  CalFunction1.I1_:=0;
  CalFunction1.S1_:=0;
  CalFunction1.Correlation_:=0;
  CalFunction1.Correlation2_:=0;

  CalFunction2.AvgSource1_:=0;
  CalFunction2.AvgSource2_:=0;
  CalFunction2.CloseOrderPriceSource1:=0;
  CalFunction2.CloseOrderPriceSource2:=0;
  CalFunction2.Dif_Source1_AvgSource1:=0;
  CalFunction2.Dif_Source2_AvgSource2:=0;
  CalFunction2.U_:=0;
  CalFunction2.I1_:=0;
  CalFunction2.S1_:=0;
  CalFunction2.Correlation_:=0;
  CalFunction2.Correlation2_:=0;

  CorrelationCoefficient1.Summation_X:=0;
  CorrelationCoefficient1.Summation_Y:=0;
  CorrelationCoefficient1.Summation_X_Y:=0;
  CorrelationCoefficient1.Summation_X_power:=0;
  CorrelationCoefficient1.Summation_Y_power:=0;
  CorrelationCoefficient1.r_:=0;

  CorrelationCoefficient2.Summation_X:=0;
  CorrelationCoefficient2.Summation_Y:=0;
  CorrelationCoefficient2.Summation_X_Y:=0;
  CorrelationCoefficient2.Summation_X_power:=0;
  CorrelationCoefficient2.Summation_Y_power:=0;
  CorrelationCoefficient2.r_:=0;

  TotalBase:=0;
  for i:=0 to 9 do
  begin
   Base_[i]:=random(50)+30;
   TotalBase:=TotalBase+Base_[i];
  end;

  Gain_:=0;
  for i:=0 to 9 do
  begin
    Gain_:=Gain_+9;
    TargetSource1[i]:=Round((((100-Base_[i])/100)*Gain_)+Base_[i]);
    TargetSource2[i]:=Round(Base_[i]-(((Base_[i]-0)/100)*Gain_));
  end;

  //Finlish_:=false;
  //while Finlish_=false do
  //begin
  //  TotalTargetSource:=0;
  //  for i:=0 to 9 do
  //  begin
  //   TargetSource1[i]:=random(101);
  //   TotalTargetSource:=TotalTargetSource+TargetSource1[i];
  //  end;
  //  if(TotalTargetSource>TotalBase+30)then Finlish_:=true;
  //end;
  //showmessage(TotalTargetSource.ToString+'>'+TotalBase.ToString);

  //Finlish_:=false;
  //while Finlish_=false do
  //begin
  //  TotalTargetSource:=0;
  //  for i:=0 to 9 do
  //  begin
  //   TargetSource2[i]:=random(101);
  //   TotalTargetSource:=TotalTargetSource+TargetSource2[i];
  //  end;
  //  if(TotalTargetSource<TotalBase-30)then Finlish_:=true;
  //end;
  //showmessage(TotalTargetSource.ToString+'<'+TotalBase.ToString);

  CurrentSource1[0]:=Base_[0];
  CurrentSource1[1]:=Base_[1];
  CurrentSource1[2]:=Base_[2];
  CurrentSource1[3]:=Base_[3];
  CurrentSource1[4]:=Base_[4];
  CurrentSource1[5]:=Base_[5];
  CurrentSource1[6]:=Base_[6];
  CurrentSource1[7]:=Base_[7];
  CurrentSource1[8]:=Base_[8];
  CurrentSource1[9]:=Base_[9];

  CurrentSource2[0]:=Base_[0];
  CurrentSource2[1]:=Base_[1];
  CurrentSource2[2]:=Base_[2];
  CurrentSource2[3]:=Base_[3];
  CurrentSource2[4]:=Base_[4];
  CurrentSource2[5]:=Base_[5];
  CurrentSource2[6]:=Base_[6];
  CurrentSource2[7]:=Base_[7];
  CurrentSource2[8]:=Base_[8];
  CurrentSource2[9]:=Base_[9];

  _Source1_.Clear;
  _Base_.Clear;
  _Source2_.Clear;
  for i:=0 to 9 do
  begin
    _Source1_.Add(i,Base_[i] );
    _Base_.Add(i,Base_[i] );
    _Source2_.Add(i,Base_[i] );
  end;

  Cal_();
  Cal_CorrelationCoefficient();
  DisplayStatus();
  //Chart6.LeftAxis.Range.UseMax:=True;
  //Chart6.LeftAxis.Range.UseMin:=True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Loop_:integer;
begin
  Loop_:=40;
  if(Serquent_=0)then   //Source 1 move up to source 1
  begin
    Source1_Up_To_TargetSource1(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=1)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=2)then   //Source 1 move down to base
  begin
    Source1_Down_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=3)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=4)then  //Source 1 move down to source 2
  begin
    Source1_Down_To_TargetSource2(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=5)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=6)then  //Source 1 move up to base
  begin
    Source1_Up_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=7)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=8)then  //Source 2 move down to source 2
  begin
    Source2_Down_To_TarrgetSource2(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=9)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=10)then   //Source 2 move up to Base
  begin
    Source2_Up_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=11)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=12)then   //Source 2 move up to source 1
  begin
    Source2_Up_To_TargetSource1(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=13)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=14)then   //Source 2 move down to base
  begin
    Source2_Down_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=15)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=16)then   //Source 1 move up to source 1 and Source 2 move down to source 2
  begin
    Source1_Up_To_TargetSource1_Source2_Down_To_TargetSource2(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=17)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=18)then   //Source 1 move down to source 2 and Source 2 move up to source 1
  begin
    Source1_Down_To_TargetSource2_Source2_Up_To_TargetSource1(Loop_*2);
    Application.ProcessMessages;
  end;

  if(Serquent_=19)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=20)then   //Source 1 move up to base and Source 2 move down to base
  begin
    Source1_Up_To_Base_Source2_Down_To_Base(Loop_);
    Application.ProcessMessages;
  end;

  if(Serquent_=21)then
  begin
    Counter_:=Counter_+1;
    if Counter_>=(Loop_/4) then begin Serquent_:=Serquent_+1; Counter_:=0; end;
    Application.ProcessMessages;
  end;

  if(Serquent_=22)then
  begin
    Counter_:=0;
    Serquent_:=0;
    Application.ProcessMessages;
  end;

  Cal_();
  Cal_CorrelationCoefficient();
  DisplayStatus();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled:= not Timer1.Enabled;

  if Timer1.Enabled then Button1.Caption:='Stop';
  if Not Timer1.Enabled then Button1.Caption:='Start';
end;

procedure TForm1.Cal_();
var
  i: integer;
begin
  CalFunction1.AvgSource1_:=0;
  for i:=0 to 9 do
  begin
    CalFunction1.AvgSource1_:=CalFunction1.AvgSource1_+CurrentSource1[i];
  end;
  CalFunction1.AvgSource1_:=CalFunction1.AvgSource1_/10;

  CalFunction1.AvgSource2_:=0;
  for i:=0 to 9 do
  begin
    CalFunction1.AvgSource2_:=CalFunction1.AvgSource2_+CurrentSource2[i];
  end;
  CalFunction1.AvgSource2_:=CalFunction1.AvgSource2_/10;


  CalFunction1.CloseOrderPriceSource1:=CurrentSource1[9];
  CalFunction1.CloseOrderPriceSource2:=CurrentSource2[9];
  CalFunction1.Dif_Source1_AvgSource1:=CalFunction1.CloseOrderPriceSource1-CalFunction1.AvgSource1_;
  CalFunction1.Dif_Source2_AvgSource2:=CalFunction1.CloseOrderPriceSource2-CalFunction1.AvgSource2_;

  CalFunction1.U_:=CalFunction1.Dif_Source1_AvgSource1+CalFunction1.Dif_Source2_AvgSource2;

  CalFunction1.I1_:=Math.Power(CalFunction1.Dif_Source1_AvgSource1,2);
  if(CalFunction1.I1_=0)then CalFunction1.I1_:=0.000001;

  CalFunction1.S1_:=Math.Power(CalFunction1.Dif_Source2_AvgSource2,2);
  if(CalFunction1.S1_=0)then CalFunction1.S1_:=0.000001;

  CalFunction1.Sqrt_I1_S1:=Sqrt(CalFunction1.I1_+CalFunction1.S1_);

  CalFunction1.Correlation_:=CalFunction1.U_/Sqrt(CalFunction1.I1_+CalFunction1.S1_);
  CalFunction1.Correlation2_:= Math.Power(CalFunction1.Correlation_,2)/2;




  CalFunction2.AvgSource1_:=0;
  CalFunction2.AvgSource2_:=0;
  CalFunction2.U_:=0;
  CalFunction2.I1_:=0;
  CalFunction2.S1_:=0;
  for i:=0 to 9 do
  begin
    CalFunction2.AvgSource1_:=CalFunction2.AvgSource1_+CurrentSource1[i];
    CalFunction2.AvgSource1_:=CalFunction2.AvgSource1_/(i+1);

    CalFunction2.AvgSource2_:=CalFunction2.AvgSource2_+CurrentSource2[i];
    CalFunction2.AvgSource2_:=CalFunction2.AvgSource2_/(i+1);

    CalFunction2.CloseOrderPriceSource1:=CurrentSource1[i];
    CalFunction2.CloseOrderPriceSource2:=CurrentSource2[i];

    CalFunction2.Dif_Source1_AvgSource1:=CalFunction2.CloseOrderPriceSource1-CalFunction2.AvgSource1_;
    CalFunction2.Dif_Source2_AvgSource2:=CalFunction2.CloseOrderPriceSource2-CalFunction2.AvgSource2_;

    CalFunction2.U_:=CalFunction2.U_+CalFunction2.Dif_Source1_AvgSource1*CalFunction2.Dif_Source2_AvgSource2;

    CalFunction2.I1_:=CalFunction2.I1_+Math.Power(CalFunction2.Dif_Source1_AvgSource1,2);
    if(CalFunction2.I1_=0)then CalFunction2.I1_:=0.000001;

    CalFunction2.S1_:=CalFunction2.S1_+Math.Power(CalFunction2.Dif_Source2_AvgSource2,2);
    if(CalFunction2.S1_=0)then CalFunction2.S1_:=0.000001;

    CalFunction2.Sqrt_I1_S1:=Sqrt(CalFunction2.I1_*CalFunction2.S1_);

    CalFunction2.Correlation_:=CalFunction2.U_/Sqrt(CalFunction2.I1_*CalFunction2.S1_);
    CalFunction2.Correlation2_:= Math.Power(CalFunction2.Correlation_,2)/2;
  end;
end;

procedure TForm1.Cal_CorrelationCoefficient();
var
  i: integer;
begin

  CorrelationCoefficient1.Summation_X:=0;
  CorrelationCoefficient1.Summation_Y:=0;
  CorrelationCoefficient1.Summation_X_Y:=0;
  CorrelationCoefficient1.Summation_X_power:=0;
  CorrelationCoefficient1.Summation_Y_power:=0;
  CorrelationCoefficient1.r_:=0;
  for i:=0 to 9 do
  begin
    CorrelationCoefficient1.Summation_X:=CorrelationCoefficient1.Summation_X+(i+1);
    CorrelationCoefficient1.Summation_Y:=CorrelationCoefficient1.Summation_Y+CurrentSource1[i];
    CorrelationCoefficient1.Summation_X_Y:=CorrelationCoefficient1.Summation_X_Y+((i+1)*CurrentSource1[i]);
    CorrelationCoefficient1.Summation_X_power:=CorrelationCoefficient1.Summation_X_power+Math.Power(i+1,2);
    CorrelationCoefficient1.Summation_Y_power:=CorrelationCoefficient1.Summation_Y_power+Math.Power(CurrentSource1[i],2);
  end;
  i:=9;
  CorrelationCoefficient1.r_:=((i+1)*CorrelationCoefficient1.Summation_X_Y)-(CorrelationCoefficient1.Summation_X*CorrelationCoefficient1.Summation_Y);
  CorrelationCoefficient1.r_:=CorrelationCoefficient1.r_/Sqrt((((i+1)*CorrelationCoefficient1.Summation_X_power)-Math.Power(CorrelationCoefficient1.Summation_X,2))*(((i+1)*CorrelationCoefficient1.Summation_Y_power)-Math.Power(CorrelationCoefficient1.Summation_Y,2)));


  CorrelationCoefficient2.Summation_X:=0;
  CorrelationCoefficient2.Summation_Y:=0;
  CorrelationCoefficient2.Summation_X_Y:=0;
  CorrelationCoefficient2.Summation_X_power:=0;
  CorrelationCoefficient2.Summation_Y_power:=0;
  CorrelationCoefficient2.r_:=0;
  for i:=0 to 9 do
  begin
    CorrelationCoefficient2.Summation_X:=CorrelationCoefficient2.Summation_X+(i+1);
    CorrelationCoefficient2.Summation_Y:=CorrelationCoefficient2.Summation_Y+CurrentSource2[i];
    CorrelationCoefficient2.Summation_X_Y:=CorrelationCoefficient2.Summation_X_Y+((i+1)*CurrentSource2[i]);
    CorrelationCoefficient2.Summation_X_power:=CorrelationCoefficient2.Summation_X_power+Math.Power(i+1,2);
    CorrelationCoefficient2.Summation_Y_power:=CorrelationCoefficient2.Summation_Y_power+Math.Power(CurrentSource2[i],2);
  end;
  i:=9;
  CorrelationCoefficient2.r_:=((i+1)*CorrelationCoefficient2.Summation_X_Y)-(CorrelationCoefficient2.Summation_X*CorrelationCoefficient2.Summation_Y);
  CorrelationCoefficient2.r_:=CorrelationCoefficient2.r_/Sqrt((((i+1)*CorrelationCoefficient2.Summation_X_power)-Math.Power(CorrelationCoefficient2.Summation_X,2))*(((i+1)*CorrelationCoefficient2.Summation_Y_power)-Math.Power(CorrelationCoefficient2.Summation_Y,2)));
end;

procedure TForm1.DisplayStatus();
var
  i: integer;
begin
  Label_Serquent.Caption:='Serquent='+Serquent_.ToString;
  if(Serquent_=1)then Label_Serquent.Caption:=Label_Serquent.Caption+'  Maximum Source1';
  if(Serquent_=5)then Label_Serquent.Caption:=Label_Serquent.Caption+'  Minimum Source1';
  if(Serquent_=9)then Label_Serquent.Caption:=Label_Serquent.Caption+'  Minimum Source2';
  if(Serquent_=13)then Label_Serquent.Caption:=Label_Serquent.Caption+'  Maximum Source2';
  if(Serquent_=17)then Label_Serquent.Caption:=Label_Serquent.Caption+'  Maximum Source1 + Minimum Source2';
  if(Serquent_=19)then Label_Serquent.Caption:=Label_Serquent.Caption+'  Minimum Source1 + Maximum Source2';
  Label_Counter.Caption:='Counter='+Counter_.ToString;

  Source1_1.Caption:=CurrentSource1[0].ToString;
  Source1_2.Caption:=CurrentSource1[1].ToString;
  Source1_3.Caption:=CurrentSource1[2].ToString;
  Source1_4.Caption:=CurrentSource1[3].ToString;
  Source1_5.Caption:=CurrentSource1[4].ToString;
  Source1_6.Caption:=CurrentSource1[5].ToString;
  Source1_7.Caption:=CurrentSource1[6].ToString;
  Source1_8.Caption:=CurrentSource1[7].ToString;
  Source1_9.Caption:=CurrentSource1[8].ToString;
  Source1_10.Caption:=CurrentSource1[9].ToString;

  Source2_1.Caption:=CurrentSource2[0].ToString;
  Source2_2.Caption:=CurrentSource2[1].ToString;
  Source2_3.Caption:=CurrentSource2[2].ToString;
  Source2_4.Caption:=CurrentSource2[3].ToString;
  Source2_5.Caption:=CurrentSource2[4].ToString;
  Source2_6.Caption:=CurrentSource2[5].ToString;
  Source2_7.Caption:=CurrentSource2[6].ToString;
  Source2_8.Caption:=CurrentSource2[7].ToString;
  Source2_9.Caption:=CurrentSource2[8].ToString;
  Source2_10.Caption:=CurrentSource2[9].ToString;

  for i:=0 to 9 do
  begin
    _Source1_.SetXValue(i,i);
    _Source1_.SetYValue(i,CurrentSource1[i]);
    //_Base_.SetXValue(i,i);
    //_Base_.SetYValue(i,Base_[i]);
    _Source2_.SetXValue(i,i);
    _Source2_.SetYValue(i,CurrentSource2[i]);
  end;

  Label_AvgSource1.Caption:='AvgSource1='+CalFunction1.AvgSource1_.ToString;
  Label_AvgSource2.Caption:='AvgSource2='+CalFunction1.AvgSource2_.ToString;
  Label_CloseOrderPriceSource1.Caption:='CloseOrderPriceSource1='+CalFunction1.CloseOrderPriceSource1.ToString;
  Label_CloseOrderPriceSource2.Caption:='CloseOrderPriceSource2='+CalFunction1.CloseOrderPriceSource2.ToString;
  Label_Dif_Source1_AvgSource1.Caption:='Source1-AvgSource1='+CalFunction1.Dif_Source1_AvgSource1.ToString;
  Label_Dif_Source2_AvgSource2.Caption:='Source2-AvgSource2='+CalFunction1.Dif_Source2_AvgSource2.ToString;
  Label_U.Caption:='U='+CalFunction1.U_.ToString;
  Label_I1.Caption:='I1='+CalFunction1.I1_.ToString;
  Label_S1.Caption:='S1='+CalFunction1.S1_.ToString;
  Label_Sqrt_I1_S1.Caption:=' Sqrt( I1 + S1 )='+ CalFunction1.Sqrt_I1_S1.ToString;
  Label_Correlation.Caption:='Correlation='+CalFunction1.Correlation_.ToString;
  Label_Correlation2.Caption:='Correlation2='+CalFunction1.Correlation2_.ToString;

  Label_AvgSource3.Caption:='AvgSource1='+CalFunction2.AvgSource1_.ToString;
  Label_AvgSource4.Caption:='AvgSource2='+CalFunction2.AvgSource2_.ToString;
  Label_CloseOrderPriceSource3.Caption:='CloseOrderPriceSource1='+CalFunction2.CloseOrderPriceSource1.ToString;
  Label_CloseOrderPriceSource4.Caption:='CloseOrderPriceSource2='+CalFunction2.CloseOrderPriceSource2.ToString;
  Label_Dif_Source1_AvgSource2.Caption:='Source1-AvgSource1='+CalFunction2.Dif_Source1_AvgSource1.ToString;
  Label_Dif_Source2_AvgSource3.Caption:='Source2-AvgSource2='+CalFunction2.Dif_Source2_AvgSource2.ToString;
  Label_U1.Caption:='U='+CalFunction2.U_.ToString;
  Label_I2.Caption:='I1='+CalFunction2.I1_.ToString;
  Label_S2.Caption:='S1='+CalFunction2.S1_.ToString;
  Label_Sqrt_I1_S2.Caption:=' Sqrt( I1 * S1 )='+ CalFunction2.Sqrt_I1_S1.ToString;
  Label_Correlation1.Caption:='Correlation='+CalFunction2.Correlation_.ToString;
  Label_Correlation3.Caption:='Correlation2='+CalFunction2.Correlation2_.ToString;

  Label_Source1_Summation_X.Caption:='Sum of X='+CorrelationCoefficient1.Summation_X.ToString;
  Label_Source1_Summation_Y.Caption:='Sum of Y='+CorrelationCoefficient1.Summation_Y.ToString;
  Label_Source1_Summation_X_Y.Caption:='Sum of X*Y='+CorrelationCoefficient1.Summation_X_Y.ToString;
  Label_Source1_Summation_X_power.Caption:='Sum of X^2='+CorrelationCoefficient1.Summation_X_power.ToString;
  Label_Source1_Summation_Y_power.Caption:='Sum of Y^2='+CorrelationCoefficient1.Summation_Y_power.ToString;
  Label_Source1_r.Caption:='r='+CorrelationCoefficient1.r_.ToString;

  Label_Source2_Summation_X.Caption:='Sum of X='+CorrelationCoefficient2.Summation_X.ToString;
  Label_Source2_Summation_Y.Caption:='Sum of Y='+CorrelationCoefficient2.Summation_Y.ToString;
  Label_Source2_Summation_X_Y.Caption:='Sum of X*Y='+CorrelationCoefficient2.Summation_X_Y.ToString;
  Label_Source2_Summation_X_power.Caption:='Sum of X^2='+CorrelationCoefficient2.Summation_X_power.ToString;
  Label_Source2_Summation_Y_power.Caption:='Sum of Y^2='+CorrelationCoefficient2.Summation_Y_power.ToString;
  Label_Source2_r.Caption:='r='+CorrelationCoefficient2.r_.ToString;
end;

procedure TForm1.Source1_Up_To_TargetSource1(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((TargetSource1[i]-Base_[i])/Loop_)*Counter_)+Base_[i]);
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Down_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-Base_[i])/Loop_)*Counter_));
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Down_To_TargetSource2(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=(Base_[i]-(((Base_[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Up_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((Base_[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource1[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Down_To_TarrgetSource2(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=(Base_[i]-(((Base_[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Up_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((Base_[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource2[i]:=Round(Tempo_);
  end;
    Counter_:=Counter_+1;
    if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Up_To_TargetSource1(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((TargetSource1[i]-Base_[i])/Loop_)*Counter_)+Base_[i]);
    CurrentSource2[i]:=Round(Tempo_);
  end;
    Counter_:=Counter_+1;
    if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source2_Down_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
begin
  for i:=0 to 9 do
  begin
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-Base_[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Up_To_TargetSource1_Source2_Down_To_TargetSource2(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((TargetSource1[i]-Base_[i])/Loop_)*Counter_)+Base_[i]);
    CurrentSource1[i]:=Round(Tempo_);

    Tempo_:=(Base_[i]-(((Base_[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Down_To_TargetSource2_Source2_Up_To_TargetSource1(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-TargetSource2[i])/Loop_)*Counter_));
    CurrentSource1[i]:=Round(Tempo_);

    Tempo_:=((((TargetSource1[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

procedure TForm1.Source1_Up_To_Base_Source2_Down_To_Base(Loop_: integer);
var
  Tempo_:double;
  i:integer;
Begin
  for i:=0 to 9 do
  begin
    Tempo_:=((((Base_[i]-TargetSource2[i])/Loop_)*Counter_)+TargetSource2[i]);
    CurrentSource1[i]:=Round(Tempo_);
    Tempo_:=(TargetSource1[i]-(((TargetSource1[i]-Base_[i])/Loop_)*Counter_));
    CurrentSource2[i]:=Round(Tempo_);
  end;
  Counter_:=Counter_+1;
  if Counter_>=Loop_+1 then begin Serquent_:=Serquent_+1; Counter_:=0; end;
end;

end.

