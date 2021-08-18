
#include <iostream>
using namespace std;



int main()
{
   int num[20],avgm[20],avgl[20],odd[20],even[20],total=0,min,max,mul,temp,j=0,k=0,l=0,m=0;
   double totald,avg,divi,maxd,mind;
   cout<<"Group Name: Fire Breathing Rubber Duckies\n"
       <<"Group Members: \n"
       <<"Nahvin\nZaid\nAnisa\nJeya\n\n"
       <<"Enter 20 positive numbers:\n";
   for(int i=0;i<20;i++)
   {
       cin>>num[i];
       total+=num[i];
   }
   for(int i=0;i<20;i++)
	{
		for(int j=i+1;j<20;j++)
		{
			if(num[i]>num[j])
			{
				temp  =num[i];
				num[i]=num[j];
				num[j]=temp;
			}
		}
	}
	cout<<"\nAscending order of the numbers:\n";
	for(int i=0;i<20;i++)
	{
	    cout<<num[i]<<" ";
	}
   max=num[19];
   min=num[0];
   totald=total;
   avg=totald/20;
   cout<<"\n\nThe sum of entered numbers: "<<total
       <<"\n\nThe average of entered numbers: "<<avg<<endl;
   for(int i=0;i<20;i++)
   {
       if(num[i]>avg)
       {
           avgm[j]=num[i];
           j++;
       }
       if(num[i]<avg)
       {
           avgl[k]=num[i];
           k++;
       }
       {if(num[i]%2!=0)
       {
           odd[l]=num[i];
           l++;
       }
       else if(num[i]%2==0)
       {
           even[m]=num[i];
           m++;
       }}



   }
   maxd=max;
   mind=min;
   mul=max*min;
   divi=maxd/mind;
   cout<<"\nThe list of numbers that is more than average:\n";
   for(int i=0;i<j;i++)
   {
       cout<<avgm[i]<<" ";
   }
   cout<<"\n\nThe list of numbers that is less than average:\n";
   for(int i=0;i<k;i++)
   {
       cout<<avgl[i]<<" ";
   }
   cout<<"\n\nThe list of odd numbers:\n";
   for(int i=0;i<l;i++)
   {
       cout<<odd[i]<<" ";
   }
   cout<<"\n\nThe list of even numbers:\n";
   for(int i=0;i<m;i++)
   {
       cout<<even[i]<<" ";
   }
   cout<<"\n\nThe multiplication between the highest and the lowest number is: "<<mul<<endl;
   cout<<"\nThe division between the highest and the lowest number is: "<<divi<<endl;
   cout<<"\nThe list of programming techniques used:\n1.Array\n2.For loop\n3.Selection(if condition)";
   return 0;
}
