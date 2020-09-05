function f1 = Fun_Cost(x)
    %线路总成本x = 100:1:13000;
    y1 =1.*(x<=250)+((600-x)/350).*(x>250&x<=600)+0.*(x>600);
    y2 =0.*(x<250&x>600)+((x-250)/350).*(x<600&x>=250)+((1500-x)/900).*(x<1500&x>=600);
    y3 =0.*(x<600)+((x-600)/900).*(x>600&x<=1500)+1.*(x>1500);
    f1 = [y1,y2,y3];
    f1=f1./sum(f1);%将归一化结果存于f1中
end
-----------------------------------------------------------------------------------------------------------------
function f2 = Fun_Time(x)
    %交易成功时长x = 0:10:50746;
    y1 =1.*(x<=1000)+((1200-x)/200).*(x>1000&x<=1200)+0.*(x>1200);
    y2 =0.*(x<1000&x>5000)+((x-1000)/200).*(x<=1200&x>=1000)+((5000-x)/3800).*(x<5000&x>1200);
    y3 =0.*(x<1200)+((x-1200)/3800).*(x>1200&x<=5000)+1.*(x>5000);
    f2 = [y1,y2,y3];
    f2=f2./sum(f2);%将归一化结果存于f2中
end
------------------------------------------------------------------------------------------------------------------
function f3 = Fun_Distance(x)
    %总里程x = 0:1:2700;
    y1 =1.*(x<=40)+((55-x)/15).*(x>40&x<=55)+0.*(x>55);
    y2 =0.*(x<40&x>500)+((x-40)/15).*(x<55&x>=40)+((500-x)/445).*(x<500&x>=55);
    y3 =0.*(x<55)+((x-55)/445).*(x>55&x<=500)+1.*(x>500);
    f3 = [y1,y2,y3];
    f3=f3./sum(f3);%将归一化结果存于f3中
end
------------------------------------------------------------------------------------------------------------------
function f4 = Fun_CNum(x)
    %C端议价反馈数量x = 0:0.01:35;
    y1 =1.*(x<=0.5)+((1-x)/0.5).*(x>0.5&x<=1)+0.*(x>1);
    y2 =0.*(x<0.5&x>2)+((x-0.5)/0.5).*(x<1&x>=0.5)+(2-x).*(x<2&x>=1);
    y3 =0.*(x<1)+(x-1).*(x>1&x<=2)+1.*(x>2);
    f4 = [y1,y2,y3];
    f4=f4./sum(f4);%将归一化结果存于f4中
end
------------------------------------------------------------------------------------------------------------------
function f5 = Fun_Profit(x)
    %利润率x = -0.5:0.01:2.2;
    y1 =1.*(x<=-0.09)+(-x/0.09).*(x>=-0.09&x<=0)+0.*(x>=0);
    y2 =0.*(x<-0.09&x>=0.6)+((x+0.09)/0.54).*(x<0.45&x>=-0.09)+((0.6-x)/0.15).*(x<0.6&x>=0.45);
    y3 =0.*(x<=0)+(x/0.6).*(x>0&x<=0.6)+1.*(x>=0.6);
    f5 = [y3,y2,y1];
    f5=f5./sum(f5);%将归一化结果存于f5中
end
---------------------------------------------------------------------------------------------------------------------
function f6 = Fun_CarLen(x)
    %车辆长度x = 4:0.01:15;
    y1 =1.*(x<=5)+((9.6-x)/4.6).*(x>5&x<=9.6)+0.*(x>9.6);
    y2 =0.*(x<5&x>=10)+((x-5)/4.6).*(x<9.6&x>=5)+((10-x)/0.4).*(x<10&x>=9.6);
    y3 =0.*(x<5)+((x-5)/5).*(x>5&x<=10)+1.*(x>10);
    f6 = [y3,y2,y1];
    f6=f6./sum(f6);%将归一化结果存于f6中
end
------------------------------------------------------------------------------------------------------------------
for i=1:16016
   x=wbx(i,1);
   yw1= Fun_Cost(x);
   x=wbx(i,2);
   yw2=Fun_Time(x);
   x=wbx(i,3);
   yw3= Fun_Distance(x);
   x=wbx(i,4);
   yw4=Fun_CNum(x);
    x=wbx(i,5);
    yw5=Fun_Profit(x);
    x=wbx(i,6);
    yw6=Fun_CarLen(x)
  
   zh=[yw1;yw2;yw3;yw4;yw5;yw6];
   A=[0.1,0.5,0.1,0.1,0.1,0.1];
   R=A*zh;
   RZ(i,1:3)=R
   
end