'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated from a template.
'
'     Manual changes to this file may cause unexpected behavior in your application.
'     Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Namespace _1754bWaller2F

    Partial Public Class Donation
        Public Property Id As Integer
        Public Property DonationDate As Date
        Public Property Value As Decimal
    
        Public Overridable Property Person As Person
        Public Overridable Property DonationTypes As ICollection(Of DonationTypes) = New HashSet(Of DonationTypes)
    
    End Class

End Namespace
