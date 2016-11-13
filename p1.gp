#这个模块是用于将结果写入文件
\l 1.txt
polynomial()
\l

polynomial()=
{
	local(l,i,j,k,h,s1);
	l=vector(199);
	#第一个for循环是寻找重量为3的不可约多项式
	for(j=2,200,for(k=1,j-1,if(Judge_irreducible_polynomial(x^j+x^k+1,j),l[j-1]=1;print(j);print(x^j+x^k+1);break;);););
	#第二个for循环是用于寻找重量为5的不可约多项式
	for(i=1,199,s1=0;if(l[i]==0,for(j=1,i-2,for(h=j+1,i-1,if(s1==0,for(k=h+1,i,if(Judge_irreducible_polynomial(x^(i+1)+x^k+x^h+x^j+1,i+1),print(i+1);s1=1;print(x^(i+1)+x^k+x^h+x^j+1);break;););););););)
}

#自己改造过得gcd，可用于求n比较大时的gcd（x^2^n-x,f）
Gcd(f,n)=
{
	local(i,h);
	h=Mod(x^2*Mod(1,2),f*Mod(1,2));
	for(i=1,n-1,h=Mod(h^2,f););
	h=Mod(h-x,f);
	h=gcd(h,f);
	return(lift(lift(h)));
}

#判断n次多项式是否可约
Judge_irreducible_polynomial(f,n)=
{
    local(i,g,s);
    s=1;
    for(i=1,n/2,
          g=Gcd(f,i);
          if(g!=1,s=0;break;);
          );
    return(s);
}
