#include<stdio.h>

int m,n,x[30],h[30],y[30],i,j, k,x2[30],a[30];

void main()
{
            printf(" enter the length of the first sequence\n");
            scanf("%d",&m);
            printf(" enter the length of the second sequence\n");
            scanf("%d",&n);

            printf(" enter the first sequence\n");
            for(i=0;i<m;i++)
                        scanf("%d",&x[i]);

            printf(" enter the second sequence\n");
            for(j=0;j<n;j++)
                        scanf("%d",&h[j]);

            if(m-n!=0)        /*If length of both sequences are not equal*/
            {
                        if(m>n)                        /* Pad the smaller sequence with zero*/
                        {
                        for(i=n;i<m;i++)
                                    h[i]=0;
                                    n=m;
                        }
                        for(i=m;i<n;i++)
                                    x[i]=0;
                                    m=n;
            }

            y[0]=0;
            a[0]=h[0];

            for(j=1;j<n;j++)            /*folding h(n) to h(-n)*/
                        a[j]=h[n-j];

            /*Circular convolution*/
            for(i=0;i<n;i++)
                        y[0]+=x[i]*a[i];

            for(k=1;k<n;k++)
            {
                        y[k]=0;
                        /*circular shift*/

                        for(j=1;j<n;j++)
                                    x2[j]=a[j-1];
                                    x2[0]=a[n-1];
                        for(i=0;i<n;i++)
                        {
                                    a[i]=x2[i];
                                    y[k]+=x[i]*x2[i];
                        }
            }

            /*displaying the result*/
            printf(" the circular convolution is\n");
            for(i=0;i<n;i++)
                        printf("%d \t",y[i]);
}
