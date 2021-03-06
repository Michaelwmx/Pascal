const maxn=100005;
var n,i:longint;
    a,b,c,t:array[1..maxn]of longint;

procedure swap(var x,y:longint);
var k:longint;
begin   
    k:=x;
    x:=y;
    y:=k;
end;

procedure qs(l,r:longint);//ascend
var x,y,k:longint;
begin
    x:=l;y:=r;
    k:=a[(l+r)shr 1];
    repeat
        while a[x]<k do inc(x);
        while a[y]>k do dec(y);
        if x<=y then
        begin
            swap(a[x],a[y]);
            swap(b[x],b[y]);
            inc(x);
            dec(y);
        end;
    until x>y;
    if l<y then qs(l,y);
    if r>x then qs(x,r);
end;

function lowbit(x:longint):longint;
begin
    exit(x and(-x));
end;

procedure change(x:longint);
begin
    if x=0 then exit;
    while x<=n do
    begin
        inc(c[x]);
        x:=x+lowbit(x);
    end;
end;

function sum(x:longint):longint;
begin
    sum:=0;
    while x>0 do
    begin
        inc(sum,c[x]);
        x:=x-lowbit(x);
    end;
end;

function median(x:longint):longint;
var k,l,r,mid:longint;
begin
    l:=1;r:=n;
    while l<r do
    begin
        //writeln('l:',l,'r:',r);
        mid:=(l+r)div 2;
        k:=sum(mid);
        if k<x then l:=mid+1
        else if k>=x then r:=mid
    end;
    exit(l);
end;


begin
    readln(n);
    for i:=1 to n do
    begin
        read(a[i]);
        b[i]:=i;
    end;
    qs(1,n);
    for i:=1 to n do//discretize
    t[b[i]]:=i;
    filldword(c,n,0);
    for i:=1 to (n+1)div 2 do
    begin
        change(t[2*i-2]);
        change(t[2*i-1]);
        writeln(a[median(i)]);
    end;
end.