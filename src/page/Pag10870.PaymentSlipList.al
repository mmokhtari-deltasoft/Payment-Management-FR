page 10870 "Payment Slip List"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Payment Slips';
    CardPageID = "Payment Slip";
    Editable = false;
    PageType = List;
    SourceTable = "Payment Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the payment header.';
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the currency code to be used on the payment lines.';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date when the payment slip should be posted.';
                }
                field("Payment Class"; "Payment Class")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment class used when creating this payment slip.';
                }
                field("Status Name"; "Status Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the status the payment is in.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Create Payment Slip")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Create Payment Slip';
                Image = NewDocument;
                RunObject = Codeunit "Payment Management";
                ToolTip = 'Manage information about customer and vendor payments.';
            }
        }
    }
}

