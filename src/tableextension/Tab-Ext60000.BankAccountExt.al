tableextension 60000 "Bank Account Ext" extends "Bank Account"
{
    fields
    {
        field(10851; "Agency Code"; Text[5])
        {
            Caption = 'Agency Code';
            InitValue = '00000';

            trigger OnValidate()
            begin
                if StrLen("Agency Code") < 5 then
                    "Agency Code" := PadStr('', 5 - StrLen("Agency Code"), '0') + "Agency Code";
                "RIB Checked" := RIBKey.Check("Bank Branch No.", "Agency Code", "Bank Account No.", "RIB Key");
            end;
        }
        field(10852; "RIB Key"; Integer)
        {
            Caption = 'RIB Key';

            trigger OnValidate()
            begin
                "RIB Checked" := RIBKey.Check("Bank Branch No.", "Agency Code", "Bank Account No.", "RIB Key");
            end;
        }
        field(10853; "RIB Checked"; Boolean)
        {
            Caption = 'RIB Checked';
            Editable = false;
        }
        field(10854; "National Issuer No."; Code[6])
        {
            Caption = 'National Issuer No.';
            Numeric = true;

            trigger OnValidate()
            begin
                if (StrLen("National Issuer No.") > 0) and (StrLen("National Issuer No.") < 6) then
                    Error(Text10800);
            end;
        }
    }
    var
        Text10800: Label 'You must enter 6 positions in this field.';
        RIBKey: Codeunit "RIB Key";

}