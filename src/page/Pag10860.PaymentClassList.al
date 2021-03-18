page 10860 "Payment Class List"
{
    Caption = 'Payment Class List';
    Editable = false;
    PageType = List;
    SourceTable = "Payment Class";
    SourceTableView = WHERE(Enable = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a payment class code.';
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies text to describe the payment class.';
                }
                field(Enable; Rec.Enable)
                {
                    ApplicationArea = All;
                }
                field("Header No. Series"; Rec."Header No. Series")
                {
                    ApplicationArea = All;
                }
                field("Line No. Series"; Rec."Line No. Series")
                {
                    ApplicationArea = All;
                }
                field(Suggestions; Rec.Suggestions)
                {
                    ApplicationArea = All;
                }
                field("Is Create Document"; Rec."Is Create Document")
                {
                    ApplicationArea = All;
                }
                field("SEPA Transfer Type"; Rec."SEPA Transfer Type")
                {
                    ApplicationArea = All;
                }
                field("Unrealized VAT Reversal"; Rec."Unrealized VAT Reversal")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

