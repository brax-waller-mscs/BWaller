Class MainWindow
    Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs) Handles MyBase.Loaded

        Dim InvoiceViewSource As System.Windows.Data.CollectionViewSource = CType(Me.FindResource("InvoiceViewSource"), System.Windows.Data.CollectionViewSource)
        'Load data by setting the CollectionViewSource.Source property:
        'InvoiceViewSource.Source = [generic data source]
    End Sub
End Class
