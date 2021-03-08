
pageextension 60018 "FA Depreciation Books Ext" extends "FA Depreciation Books"
{
    layout
    {
        addlast(Control1)
        {
            field(Derogatory; Derogatory)
            {
                ApplicationArea = All;
            }
            field("Last Derogatory Date"; "Last Derogatory Date")
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
    }
}