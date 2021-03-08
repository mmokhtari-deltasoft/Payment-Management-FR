
pageextension 60016 "FA Ledger Entries Ext" extends "FA Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Exclude Derogatory"; "Exclude Derogatory")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
    }
}