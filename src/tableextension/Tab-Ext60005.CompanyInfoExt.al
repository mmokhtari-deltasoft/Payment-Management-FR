tableextension 60005 "CompanyInfoExt" extends "Company Information"
{
    fields
    {
        field(10801; "Trade Register"; Text[30])
        {
            Caption = 'Trade Register';
        }
        field(10802; "APE Code"; Code[10])
        {
            Caption = 'APE Code';
        }
        field(10803; "Legal Form"; Text[30])
        {
            Caption = 'Legal Form';
        }
        field(10804; "Stock Capital"; Text[30])
        {
            Caption = 'Stock Capital';
        }
        field(10810; "Default Bank Account No."; Code[20])
        {
            Caption = 'Default Bank Account No.';
            TableRelation = "Bank Account";
        }
        field(10811; CISD; Code[10])
        {
            Caption = 'CISD';
        }
        field(10812; "Last Intrastat Declaration ID"; Integer)
        {
            Caption = 'Last Intrastat Declaration ID';
        }
    }
    [Scope('OnPrem')]
    procedure GetPartyID(): Code[18]
    begin
        exit("Country/Region Code" + GetControlSum + "Registration No.");
    end;

    local procedure GetControlSum(): Text[2]
    var
        ControlSum: Integer;
    begin
        ControlSum := (12 + 3 * (GetSIREN mod 97)) mod 97;
        exit(Format(ControlSum, 0, '<Integer,2><Filler,0>'));
    end;

    [Scope('OnPrem')]
    procedure GetSIREN() Result: Integer
    begin
        Evaluate(Result, CopyStr(DelChr("Registration No."), 1, 9));
    end;
}