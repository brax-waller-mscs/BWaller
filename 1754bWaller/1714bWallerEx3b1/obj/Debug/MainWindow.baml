   M S B A M L   `   `   `  ����K  G1714bWallerEx3b1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:_1714bWallerEx3b1_1714bWallerEx3b1  5   	   H D1714bwaller2G, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullF3clr-namespace:_1714bwaller2G;assembly=1714bwaller2G_1714bwaller2G 5   	   "    _1714bWallerEx3b1.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:_1714bWallerEx3b1     5   	   N_1714bwaller2G3clr-namespace:_1714bwaller2G;assembly=1714bwaller2G     5   	   -   5          � Title$-  '1714bWaller3b1 Property Manager, People��5	   	   $��514.056��69   $��645.445��6J    � 	Resources 5
         personViewSource  personApartments1ViewSource �� Source �� Source��%\   &	        &	      7   �� 5   
   6   �� 5   
    6C   �� *Apartments1+8   5      .��5      �  � DataContext# [ 6   .+�5   
   � -   5         �Name$ grid1��5      $	��Top=�6   $��	37,81,0,0q�66   $
��Left=�6I   # [  6d   $	��265��6�    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6     � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   .+�5      �� $��Center=�6   $��3��6/   $��3q�6<   $
��Left=�6G   $��0��6b   $��Email:��6r   �� 5      -   5         ��Name$ emailTextBox��5      $	��185��6,   $��Center=�68   $��3��6�   $��	3,4,-62,4q�6�   $��24��6�   $
��Left=�6  $��1��6  ��6S   �� *Email+	 �� Mode$	 TwoWay=�
 �� NotifyOnValidationError
 .  �� ValidatesOnExceptions .  �� UpdateSourceTrigger$ PropertyChanged=�6  �� 5      $��Center=�6   $��1��6/   $��3q�6<   $
��Left=�6G   $��0��6b   $��First Name:��6r   �� 5      -   5        $ firstNameTextBox��5      $	��120��60   $��Center=�6<   $��1��6�   $��3q�6�   $��23��6�   $
��Left=�6  $��1��6  ��6W   �� *	FirstName+$	 TwoWay=�
 .  . $ PropertyChanged=�6  �� 5       $��Center=�6   $��3q�6/   $
��Left=�6:   $��0��6U   $	��Id:��6e   �� 5!      -   5        $ 	idTextBox��5!      $��72��6)   $��Center=�64   $��3,4,0,4q�6�   $��24��6�   $
��Left=�6�   $��1��6  {�.  ��6O   �� *Id+$	 TwoWay=�
 .  . $ PropertyChanged=�6  �� 5"      $��Center=�6   $��2��6/   $��3q�6<   $
��Left=�6G   $��0��6b   $��
Last Name:��6r   �� 5#      -   5        $ lastNameTextBox��5#      $	��120��6/   $��Center=�6;   $��2��6�   $��3q�6�   $��23��6�   $
��Left=�6   $��1��6  ��6V   �� *
LastName+$	 TwoWay=�
 .  . $ PropertyChanged=�6  �� 5$      $��Center=�6   $��4��6/   $��3q�6<   $
��Left=�6G   $��0��6b   $��Phone:��6r   �� 5%      -   5        $ phoneTextBox��5%      $	��120��6,   $��Center=�68   $��4��6�   $��3q�6�   $��23��6�   $
��Left=�6�   $��1��6  ��6S   �� *Phone+$	 TwoWay=�
 .  . $ PropertyChanged=�6  5&      c� 5'   
   $
��Left=�6   $��39��6-   $��0,10,0,0q�69   $	��Top=�6K   $	��374��6c   .@�5(      �� -   5         ��Name$ firstButton��5(      $��|<��6*   $��30��6:   $	��Top=�6F   $��40��6^   6i   �� 5)      -	   5        $ 
backButton��5)      $��<��6)   $��30��68   $	��Top=�6D   $��40��6\   6g   �� 5*      -
   5        $ 
nextButton��5*      $��>��6)   $��30��68   $	��Top=�6D   $��40��6\   6g   �� 5+      -   5        $ 
lastButton��5+      $��>|��6)   $��30��69   $	��Top=�6E   $��40��6]   6h   �� 5,      -   5        $ 
saveButton��5,      $
��Save��6)   $��30��68   $	��Top=�6D   $��40��6\   6g   5-      &   System.Windows.Controls.DataGrid  5.   
   -   5          Name$ apartments1DataGrid��5.         AutoGenerateColumns .     EnableRowVirtualization . $��138,257,174,107q�6�      RowDetailsVisibilityMode$ VisibleWhenSelected=�6�   ��6k   ��    Columns 5/      0  *System.Windows.Controls.DataGridTextColumn  50      -   5        apartmentNumColumn��,  &System.Windows.Controls.DataGridColumn   Header$ Apartment Num��50   b      Width5  /System.Windows.Controls.DataGridLengthConverter$ SizeToHeader 6y   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6A   �� *ApartmentNum+6y     51      -   5        bathroomsColumn��$ 	Bathrooms��51   \   $ SizeToHeader 6o    6>   �� *	Bathrooms+6o     52      -   5        idColumn��$ Id��52   N   $ SizeToHeader 6Z      
Visibility$ Hidden=�6o    67   �� *Id+6o     53      -   5        
rentColumn��$
 Rent��53   R   $ SizeToHeader 6`    69   �� *Rent+6`     54      -   5        squareFeetColumn��$ Square Feet��54   ^   $ SizeToHeader 6s    6?   �� *
SquareFeet+6s   56      58      59      