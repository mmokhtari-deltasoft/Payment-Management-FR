page 10877 "Payment Slip Archive"
{
    Caption = 'Payment Slip Archive';
    Editable = false;
    PageType = Document;
    SourceTable = "Payment Header Archive";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    AssistEdit = false;
                    ToolTip = 'Specifies the number of the payment slip.';
                }
                field("Payment Class"; "Payment Class")
                {
                    ApplicationArea = Basic, Suite;
                    Lookup = false;
                    ToolTip = 'Specifies the payment class used when creating this payment slip.';
                }
                field("Payment Class Name"; "Payment Class Name")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the payment class used.';
                }
                field("Status Name"; "Status Name")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the status of the payment.';
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the currency code of the payment.';
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the payment slip was posted.';
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date when the payment slip was created.';

                    trigger OnValidate()
                    begin
                        DocumentDateOnAfterValidate;
                    end;
                }
                field("Amount (LCY)"; "Amount (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the sum of the amounts in the Amount (LCY) fields on the associated lines.';
                }
            }
            part(Lines; "Payment Slip Subform Archive")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
            }
            group(Posting)
            {
                Caption = 'Posting';
                field("Source Code"; "Source Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the source of the entry.';
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the dimension value code with which the payment is associated.';
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the dimension value code with which the invoice is associated.';
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the type of the account that the payments have been transferred to/from.';
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the account that the payments have been transferred to/from.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Header")
            {
                Caption = '&Header';
                Image = DepositSlip;
                action(Dimensions)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ToolTip = 'View or change the dimension settings for this payment slip. If you change the dimension, you can update all lines on the payment slip.';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                    end;
                }
                action("Header RIB")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Header RIB';
                    Image = Check;
                    RunObject = Page "Payment Bank Archive";
                    RunPageLink = "No." = FIELD("No.");
                    ToolTip = 'View the RIB key that is associated with the bank account.';
                }
            }
            group("&Navigate")
            {
                Caption = '&Navigate';
                action(Header)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Header';
                    Image = DepositSlip;
                    ToolTip = 'View general information about archived payments or collections, for example, to and from customers and vendors. A payment header has one or more payment lines assigned to it. The lines contain information such as the amount, the bank details, and the due date.';

                    trigger OnAction()
                    begin
                        Navigate.SetDoc("Posting Date", "No.");
                        Navigate.Run;
                    end;
                }
                action(Line)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Line';
                    Image = Line;
                    ToolTip = 'View the ledger entry line information for the archived payment slips.';

                    trigger OnAction()
                    begin
                        CurrPage.Lines.PAGE.NavigateLine("Posting Date");
                    end;
                }
            }
        }
    }

    var
        Navigate: Page Navigate;

    local procedure DocumentDateOnAfterValidate()
    begin
        CurrPage.Update;
    end;
}

