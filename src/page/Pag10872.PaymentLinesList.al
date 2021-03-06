page 10872 "Payment Lines List"
{
    Caption = 'Payment Lines List';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payment Line";

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
                    ToolTip = 'Specifies the number of the payment.';
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment line''s entry number.';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a document number for the payment line.';
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the currency code for the amount on this line.';
                    Visible = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total amount (including VAT) of the payment line.';
                }
                field("Amount (LCY)"; "Amount (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total amount on the payment line in LCY.';
                    Visible = false;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of account that the payment line will be posted to.';
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the account that the entry on the journal line will be posted to.';
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the due date on the entry.';
                }
                field("Payment Class"; "Payment Class")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment class used when creating this payment slip line.';
                }
                field("Status Name"; "Status Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the status of the payment.';
                }
                field("Status No."; "Status No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the status line entry number.';
                    Visible = false;
                }
                field("Acceptation Code"; "Acceptation Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies an acceptation code for the payment line.';
                }
                field("Drawee Reference"; "Drawee Reference")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the file reference which will be used in the electronic payment (ETEBAC) file.';
                }
                field("Bank Account Name"; "Bank Account Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the bank account as entered in the Bank Account Code field.';
                    Visible = false;
                }
                field("Bank Branch No."; "Bank Branch No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the branch number of the bank account.';
                    Visible = false;
                }
                field("Agency Code"; "Agency Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the agency code of the bank account.';
                    Visible = false;
                }
                field(IBAN; IBAN)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the international bank account number (IBAN) for the payment slip.';
                }
                field("SWIFT Code"; "SWIFT Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the international bank identification code for the payment slip.';
                }
                field("Bank Account No."; "Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer or vendor bank account that you want to perform the payment to, or collection from.';
                    Visible = false;
                }
                field("RIB Key"; "RIB Key")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the two digit RIB key associated with the Bank Account No.';
                    Visible = false;
                }
                field("Payment in Progress"; "Payment in Progress")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether the payment line is taken into account for the customer or vendor payments in progress.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = '&Payment';
                action(Card)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the card for the entity on the selected line to view more details.';

                    trigger OnAction()
                    var
                        Statement: Record "Payment Header";
                        StatementForm: Page "Payment Slip";
                    begin
                        if Statement.Get("No.") then begin
                            Statement.SetRange("No.", "No.");
                            StatementForm.SetTableView(Statement);
                            StatementForm.Run;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions2")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Modify)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Modify';
                    Image = EditFilter;
                    ToolTip = 'View and edit line information for payments and collections.';

                    trigger OnAction()
                    var
                        PaymentLine: Record "Payment Line";
                        Consult: Page "Payment Line Modification";
                    begin
                        PaymentLine.Copy(Rec);
                        PaymentLine.SetRange("No.", "No.");
                        PaymentLine.SetRange("Line No.", "Line No.");
                        Consult.SetTableView(PaymentLine);
                        Consult.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = ACTION::LookupOK then
            LookupOKOnPush;
    end;

    var
        Steps: Integer;
        PayNum: Code[20];

    [Scope('OnPrem')]
    procedure SetSteps(Step: Integer)
    begin
        Steps := Step;
    end;

    [Scope('OnPrem')]
    procedure SetNumBor(N: Code[20])
    begin
        PayNum := N;
    end;

    [Scope('OnPrem')]
    procedure GetNumBor() N: Code[20]
    begin
        N := PayNum;
    end;

    local procedure LookupOKOnPush()
    var
        StatementLine: Record "Payment Line";
        PostingStatement: Codeunit "Payment Management";
    begin
        CurrPage.SetSelectionFilter(StatementLine);
        PostingStatement.CopyLigBor(StatementLine, Steps, PayNum);
        CurrPage.Close;
    end;
}

