
pageextension 60015 "G/L Account Card Ext" extends "G/L Account Card"
{
    layout
    {
        addlast(General)
        {


            field("Detailed Balance"; Rec."Detailed Balance")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}