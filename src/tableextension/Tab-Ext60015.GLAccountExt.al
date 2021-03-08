tableextension 60015 "G/L Account Ext" extends "G/L Account"
{
    fields
    {
        field(10810; "G/L Entry Type Filter"; Option)
        {
            Caption = 'G/L Entry Type Filter';
            FieldClass = FlowFilter;
            ObsoleteReason = 'Discontinued feature';
            ObsoleteState = Removed;
            OptionCaption = 'Definitive,Simulation';
            OptionMembers = Definitive,Simulation;
            ObsoleteTag = '15.0';
        }
        field(10811; "Detailed Balance"; Boolean)
        {
            Caption = 'Detailed Balance';
        }
    }

}