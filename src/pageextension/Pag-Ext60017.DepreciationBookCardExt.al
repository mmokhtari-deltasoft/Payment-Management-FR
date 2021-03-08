pageextension 60017 "Depreciation Book Card Ext" extends "Depreciation Book Card"
{
    layout
    {
        addlast(General)
        {

            field("Derogatory Calculation"; Rec."Derogatory Calculation")
            {
                ApplicationArea = All;
            }
            field("Used with Derogatory Book"; Rec."Used with Derogatory Book")
            {
                ApplicationArea = All;
            }
            field("G/L Integration - Derogatory"; Rec."G/L Integration - Derogatory")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}