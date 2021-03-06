page 10867 "Payment Step Card"
{
    Caption = 'Payment Step Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Payment Step";

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                field("Payment Class"; "Payment Class")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the payment class.';
                }
                field(Line; Line)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the step line''s entry number.';
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies text to describe the payment step.';
                }
                field("Previous Status"; "Previous Status")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the status from which this step should start executing.';

                    trigger OnValidate()
                    begin
                        CalcFields("Previous Status Name");
                    end;
                }
                field("Previous Status Name"; "Previous Status Name")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    Editable = false;
                    ToolTip = 'Specifies the name of the status selected in the Previous Status field.';
                }
                field("Next Status"; "Next Status")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the status on which this step should end.';

                    trigger OnValidate()
                    begin
                        CalcFields("Next Status Name");
                    end;
                }
                field("Next Status Name"; "Next Status Name")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    Editable = false;
                    ToolTip = 'Specifies the name of the status selected in the Next Status field.';
                }
                field("Action Type"; "Action Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of action to be performed by this step.';

                    trigger OnValidate()
                    begin
                        DisableFields;
                    end;
                }
                field("Report No."; "Report No.")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = ReportNoEnable;
                    ToolTip = 'Specifies the ID for the report used, when Action Type is set to Report.';
                }
                field("Export Type"; "Export Type")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = ExportTypeEnable;
                    ToolTip = 'Specifies the method that is used to export files.';
                }
                field("Export No."; "Export No.")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = ExportNoEnable;
                    ToolTip = 'Specifies the ID code for the selected export type.';
                }
                field("Verify Lines RIB"; "Verify Lines RIB")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the RIB of the header on the payment slip lines has been properly reported.';
                }
                field("Verify Due Date"; "Verify Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the due date on the billing and payment lines has been properly reported.';
                }
                field("Source Code"; "Source Code")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = SourceCodeEnable;
                    ToolTip = 'Specifies the source code linked to the payment step.';
                }
                field("Reason Code"; "Reason Code")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = ReasonCodeEnable;
                    ToolTip = 'Specifies the reason code linked to the payment step.';
                }
                field("Header Nos. Series"; "Header Nos. Series")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = HeaderNosSeriesEnable;
                    ToolTip = 'Specifies the code used to assign numbers to the header of a new payment slip.';
                }
                field(Correction; Correction)
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = CorrectionEnable;
                    ToolTip = 'Specifies you want the payment entries to pass as corrections.';
                }
                field("Realize VAT"; "Realize VAT")
                {
                    ApplicationArea = Basic, Suite;
                    Enabled = RealizeVATEnable;
                    ToolTip = 'Specifies that the unrealized VAT should be reversed and the VAT should be declared.';
                }
                field("Verify Header RIB"; "Verify Header RIB")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the RIB on the payment slip header has been properly reported.';
                }
                field("Acceptation Code<>No"; "Acceptation Code<>No")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the acceptation code on each payment line is not No.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Step")
            {
                Caption = 'Payment Step';
                Image = Installments;
                action(Ledger)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ledger';
                    Image = Ledger;
                    RunObject = Page "Payment Step Ledger List";
                    RunPageLink = "Payment Class" = FIELD("Payment Class"),
                                  Line = FIELD(Line);
                    ToolTip = 'View and edit the list of payment steps for posting debit and credit entries to the general ledger.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DisableFields;
    end;

    trigger OnInit()
    begin
        CorrectionEnable := true;
        HeaderNosSeriesEnable := true;
        SourceCodeEnable := true;
        ReasonCodeEnable := true;
        ExportNoEnable := true;
        ExportTypeEnable := true;
        ReportNoEnable := true;
    end;

    var
        PaymentClass: Record "Payment Class";
        [InDataSet]
        ReportNoEnable: Boolean;
        [InDataSet]
        ExportTypeEnable: Boolean;
        [InDataSet]
        ExportNoEnable: Boolean;
        [InDataSet]
        ReasonCodeEnable: Boolean;
        [InDataSet]
        SourceCodeEnable: Boolean;
        [InDataSet]
        HeaderNosSeriesEnable: Boolean;
        [InDataSet]
        CorrectionEnable: Boolean;
        [InDataSet]
        RealizeVATEnable: Boolean;

    [Scope('OnPrem')]
    procedure DisableFields()
    begin
        if "Action Type" = "Action Type"::None then begin
            ReportNoEnable := false;
            ExportTypeEnable := false;
            ExportNoEnable := false;
            ReasonCodeEnable := false;
            SourceCodeEnable := false;
            HeaderNosSeriesEnable := false;
            CorrectionEnable := false;
            RealizeVATEnable := false;
        end else
            if "Action Type" = "Action Type"::Ledger then begin
                ReportNoEnable := false;
                ExportTypeEnable := false;
                ExportNoEnable := false;
                ReasonCodeEnable := true;
                SourceCodeEnable := true;
                HeaderNosSeriesEnable := false;
                CorrectionEnable := true;
                PaymentClass.Get("Payment Class");
                RealizeVATEnable :=
                  (PaymentClass."Unrealized VAT Reversal" = PaymentClass."Unrealized VAT Reversal"::Delayed);
            end else
                if "Action Type" = "Action Type"::Report then begin
                    ReportNoEnable := true;
                    ExportTypeEnable := false;
                    ExportNoEnable := false;
                    ReasonCodeEnable := false;
                    SourceCodeEnable := false;
                    HeaderNosSeriesEnable := false;
                    CorrectionEnable := false;
                    RealizeVATEnable := false;
                end else
                    if "Action Type" = "Action Type"::File then begin
                        ReportNoEnable := false;
                        ExportTypeEnable := true;
                        ExportNoEnable := true;
                        ReasonCodeEnable := false;
                        SourceCodeEnable := false;
                        HeaderNosSeriesEnable := false;
                        CorrectionEnable := false;
                        RealizeVATEnable := false;
                    end else
                        if "Action Type" = "Action Type"::"Create New Document" then begin
                            ReportNoEnable := false;
                            ExportTypeEnable := false;
                            ExportNoEnable := false;
                            ReasonCodeEnable := false;
                            SourceCodeEnable := false;
                            HeaderNosSeriesEnable := true;
                            CorrectionEnable := false;
                            RealizeVATEnable := false;
                        end;
    end;
}

