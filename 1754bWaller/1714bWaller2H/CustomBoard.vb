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

Namespace _1714bWaller2H

    Partial Public Class CustomBoard
        Public Property Id As Integer
        Public Property Size As String
        Public Property Shape As String
        Public Property Amount As String
    
        Public Overridable Property LineItems As ICollection(Of LineItem) = New HashSet(Of LineItem)
        Public Overridable Property Design As Design
    
    End Class

End Namespace