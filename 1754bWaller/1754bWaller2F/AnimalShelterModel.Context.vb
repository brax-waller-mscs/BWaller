﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated from a template.
'
'     Manual changes to this file may cause unexpected behavior in your application.
'     Manual changes to this file will be overwritten if the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Data.Entity
Imports System.Data.Entity.Infrastructure

Namespace _1754bWaller2F

    Partial Public Class AnimalShelterModelContainer
        Inherits DbContext
    
        Public Sub New()
            MyBase.New("name=AnimalShelterModelContainer")
        End Sub
    
        Protected Overrides Sub OnModelCreating(modelBuilder As DbModelBuilder)
            Throw New UnintentionalCodeFirstException()
        End Sub
    
        Public Overridable Property AnimalTypes() As DbSet(Of AnimalType)
        Public Overridable Property Animals() As DbSet(Of Animal)
        Public Overridable Property People() As DbSet(Of Person)
        Public Overridable Property DonationTypes() As DbSet(Of DonationTypes)
        Public Overridable Property Donations() As DbSet(Of Donation)
    
    End Class

End Namespace
