page 10861 "Payment Status List"
{
    AutoSplitKey = true;
    Caption = 'Payment Status List';
    PageType = List;
    SourceTable = "Payment Status";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Name; Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies text to describe the payment status.';
                }
                field(Look; Look)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that lines of payment documents with this status may be looked up and edited through the View/Edit Payment Line window.';
                }
                field(ReportMenu; ReportMenu)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that documents with this status may be printed.';
                }
                field(RIB; RIB)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies all information involving the bank identifier (RIB) statement of the customer or vendor be displayed on the payment lines.';
                }
                field("Acceptation Code"; "Acceptation Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the acceptation code will displayed on the payment lines.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the amount will displayed on the payment lines.';
                }
                field(Debit; Debit)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the debit amount will displayed on the payment lines.';
                }
                field(Credit; Credit)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the credit amount will displayed on the payment lines.';
                }
                field("Payment in Progress"; "Payment in Progress")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies if you want to take into account all billing and payment lines with this status, when calculating the payments in progress.';
                }
            }
        }
    }

    actions
    {
    }
}

