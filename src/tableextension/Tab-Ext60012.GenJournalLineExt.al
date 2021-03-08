tableextension 60012 "Gen. Journal Line Ext" extends "Gen. Journal Line"
{
    fields
    {
        field(10801; "Bank Account Name"; Text[100])
        {
            Caption = 'Bank Account Name';
        }
        field(10810; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            ObsoleteReason = 'Discontinued feature';
            ObsoleteState = Removed;
            OptionCaption = 'Definitive,Simulation';
            OptionMembers = Definitive,Simulation;
            ObsoleteTag = '15.0';
        }
        field(10860; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            Editable = false;
        }
        field(10861; "Derogatory Line"; Boolean)
        {
            Caption = 'Derogatory Line';
            Editable = false;
        }
        field(10862; "Delayed Unrealized VAT"; Boolean)
        {
            Caption = 'Delayed Unrealized VAT';
        }
        field(10863; "Realize VAT"; Boolean)
        {
            Caption = 'Realize VAT';
        }
        field(10864; "Created from No."; Code[20])
        {
            Caption = 'Created from No.';
        }
    }

}