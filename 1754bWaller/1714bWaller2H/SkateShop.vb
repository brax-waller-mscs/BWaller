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

    Partial Public Class SkateShop
        Public Property Id As Integer
        Public Property City As String
        Public Property State As String
        Public Property Phone As String
    
        Public Overridable Property Designs As ICollection(Of Design) = New HashSet(Of Design)
        Public Overridable Property Skates As ICollection(Of Skate) = New HashSet(Of Skate)
    
    End Class

End Namespace
