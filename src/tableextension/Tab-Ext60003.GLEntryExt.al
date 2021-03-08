tableextension 60003 "GLEntryExt" extends "G/L Entry"
{
    fields
    {
        field(10810; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            ObsoleteReason = 'Discountinued feature';
            ObsoleteState = Removed;
            OptionCaption = 'Definitive,Simulation';
            OptionMembers = Definitive,Simulation;
            ObsoleteTag = '15.0';
        }
        field(10811; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';
            Editable = false;
        }
        field(10812; Letter; Text[10])
        {
            Caption = 'Letter';
            Editable = false;
        }
        field(10813; "Letter Date"; Date)
        {
            Caption = 'Letter Date';
            Editable = false;
        }
    }

}