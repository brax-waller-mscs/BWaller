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

Partial Public Class Invoice
    Public Property Id As Integer
    Public Property InvoiceDate As Date
    Public Property DueDate As Date

    Public Overridable Property Apartment As Apartment
    Public Overridable Property LineItems As ICollection(Of LineItem) = New HashSet(Of LineItem)
    Public Overridable Property Receipts As ICollection(Of Receipt) = New HashSet(Of Receipt)

End Class
