#!/usr/bin/awk -f
{
   var1 = 0
   var2 = 1
  
 for ( i = 0 ; i < $0 ; i++ )
   {
      if ( i <= 1 )
         var3 = i;
      else
      {
         var3 = var1 + var2;
         var1 = var2;
         var2 = var3;
      }
   }
print var3

}

