tableextension 60001 "Customer Bank Account Ext" extends "Customer Bank Account"
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
    }
    var
        RIBKey: Codeunit "RIB Key";
}