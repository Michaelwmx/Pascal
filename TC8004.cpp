#include <cstdio>
#include <cstring>
#include <cmath>
#define LL long long
#define MAXM 1000005

class SquareFreeNumbers{
private:
	int n,m,mu[MAXM],p[MAXM],cnt;
	bool inp[MAXM];

	LL sieve(LL n){
		m=sqrt(n);
        mu[1]=1;
        memset(inp+1,0,m*sizeof(inp[0]));
        inp[0]=inp[1]=1;
        cnt=0;
        LL sum=mu[1]*(n/1);
        for(int i=2;i<=m;i++){
            if(!inp[i]) p[++cnt]=i,mu[i]=-1;
            for(int j=1;j<=cnt && i*p[j]<=m;j++){
                inp[i*p[j]]=1;
                if(i%p[j])
                    mu[i*p[j]]=-mu[i];
                else{
                    mu[i*p[j]]=0;
                    break;
                }
            }
            sum+=mu[i]*(n/i/i);
        }
        return sum;
	}

public:
	int getCount(long min, long max){
		return (int)(sieve(max)-sieve(min-1));
	}
};