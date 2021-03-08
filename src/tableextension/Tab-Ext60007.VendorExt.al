tableextension 60007 "VendorExt" extends Vendor
{
    fields
    {
        field(10860; "Payment in progress (LCY)"; Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE("Account Type" = CONST(Vendor),
                                                                   "Account No." = FIELD("No."),
                                                                   "Copied To Line" = CONST(0),
                                                                   "Payment in Progress" = CONST(true)));
            Caption = 'Payment in progress (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10880; "Exclude from Payment Reporting"; Boolean)
        {
            Caption = 'Exclude from Payment Reporting';
            DataClassification = CustomerContent;
        }
    }

}