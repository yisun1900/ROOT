<%@ page contentType="text/html;charset=GBK" %>




<%

ybl.common.YBLChart  yblc=new ybl.common.YBLChart();



String[][] inData={{"中石化","1380"},{"中石油","580"},{"工商局","1120"},{"商检局","670"}};
String jpgFileName =yblc.pie(inData,"日之阳部级客户统计表",900,500,0,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String[] xData={"初中","高中","大专","本科","硕士","博士"};
double[] yData={380,1620,6100,8310,3520,1900};
jpgFileName =yblc.pie(xData,yData,"程序员学历情况调查表",500,300,1,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String[] xData2={"初中","高中","大专","本科","硕士","博士"};
int[] yData2={380,1620,6100,8310,3520,1900};
jpgFileName =yblc.pie(xData2,yData2,"程序员学历情况调查表",500,300,1,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String[] xData1={"高中","大专","本科","硕士","博士"};
String[] yData1={"1620","6100","8310","3520","1900"};
jpgFileName =yblc.pie(xData1,yData1,"程序员学历情况调查表",500,300,2,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String sql="select dwmc,sum(qye) from crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and qye!=0 group by dwmc order by dwmc";
jpgFileName =yblc.pie3D(sql,"店面签单统计",600,500,3,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%  



String[][] inData2={{"主机","1月份","300"},{"主机","2月份","680"},{"主机","3月份","1320"},{"主机","4月份","2500"}
                    ,{"汽车","1月份","200"},{"汽车","2月份","480"},{"汽车","3月份","1620"},{"汽车","4月份","2700"}
                    ,{"火车","1月份","100"},{"火车","2月份","780"},{"火车","3月份","1520"},{"火车","4月份","2100"}};
jpgFileName =yblc.bar(inData2,"2008年日之阳销售统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData11={"主机","主机","主机","主机"       ,"汽车","汽车","汽车","汽车"        ,"火车","火车","火车","火车"};
String[] yData11={"1月份","2月份","3月份","4月份"   ,"1月份","2月份","3月份","4月份"    ,"1月份","2月份","3月份","4月份"};
double[] zData11={380,1620,6100,8310              ,280,1320,4100,6310               ,480,1220,7100,6310 };
jpgFileName =yblc.bar(xData11,yData11,zData11,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData12={"主机","主机","主机","主机"       ,"汽车","汽车","汽车","汽车"       ,"火车","火车","火车","火车"};
String[] yData12={"1月份","2月份","3月份","4月份"   ,"1月份","2月份","3月份","4月份"   ,"1月份","2月份","3月份","4月份"};
int[] zData12={380,1620,2100,5310                 ,280,1320,4100,2310             ,480,1220,4100,6310 };
jpgFileName =yblc.bar(xData12,yData12,zData12,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData13={"主机","主机","主机","主机"       ,"汽车","汽车","汽车","汽车"       ,"火车","火车","火车","火车"};
String[] yData13={"1月份","2月份","3月份","4月份"   ,"1月份","2月份","3月份","4月份"   ,"1月份","2月份","3月份","4月份"};
String[] zData13={"380","1620","6100","3310"      ,"280","1320","4100","6310"      ,"480","1220","5100","6310" };
jpgFileName =yblc.bar(xData13,yData13,zData13,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[][] inData211={{"1月份","300"},{"2月份","480"},{"3月份","320"},{"4月份","210"},{"5月份","500"},{"6月份","280"},{"7月份","270"},{"8月份","250"},{"9月份","230"},{"10月份","240"},{"11月份","200"},{"12月份","250"}};
jpgFileName =yblc.bar("2008年日之阳销售统计图",inData211,"月份","销售额（万元）",900,500,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%






String[][] inData273={{"1月份","300"},{"2月份","680"},{"3月份","1320"},{"4月份","2500"}};
jpgFileName =yblc.bar(inData273,500,300,request,session);
%>
<BR>月份故障统计图，单位（次数）<BR>
<img src="<%=jpgFileName%>" border=0 >
<%


String[] inData202={"飞机2","大炮2"};
String[][] inData212={{"1月份","300"},{"2月份","680"},{"3月份","1320"},{"4月份","2500"}};
String[][] inData222={{"1月份","500"},{"2月份","880"},{"3月份","1220"},{"4月份","1500"}};
jpgFileName =yblc.bar(inData202,inData212,inData222,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] inData203={"飞机3","大炮3","导弹3"};
String[][] inData213={{"1月份","300"},{"2月份","680"},{"3月份","1320"},{"4月份","2500"}};
String[][] inData223={{"1月份","500"},{"2月份","880"},{"3月份","1220"},{"4月份","1500"}};
String[][] inData233={{"1月份","100"},{"2月份","780"},{"3月份","1520"},{"4月份","1100"}};
jpgFileName =yblc.bar(inData203,inData213,inData223,inData233,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%





String[] xData14={"1月份","2月份","3月份","4月份","5月份"};
String[] yData14={"1620","6100","8310","3520","1900"};
jpgFileName =yblc.bar(xData14,yData14,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%






sql="select dwmc,sum(qye) from crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and qye!=0 group by dwmc order by dwmc";
jpgFileName =yblc.bar(sql,"店面签单统计","店面","签约额",900,500,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%  






sql="select dwmc,sum(qye) from crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and qye!=0 group by dwmc order by dwmc";
jpgFileName =yblc.bar(sql,800,300,request,session);
%>
<BR>店面签单统计，单位（元）<BR>
<img src="<%=jpgFileName%>" border=0 >



<%
String[][] inData21={{"主机","1月份","1300"},{"主机","2月份","680"},{"主机","3月份","1120"},{"主机","4月份","1500"}
                    ,{"汽车","1月份","200"},{"汽车","2月份","480"},{"汽车","3月份","1620"},{"汽车","4月份","700"}
                    ,{"火车","1月份","700"},{"火车","2月份","480"},{"火车","3月份","1220"},{"火车","4月份","200"}};
jpgFileName =yblc.line(inData21,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData111={"主机","主机","主机","主机"       ,"汽车","汽车","汽车","汽车"        ,"火车","火车","火车","火车"};
String[] yData111={"1月份","2月份","3月份","4月份"   ,"1月份","2月份","3月份","4月份"    ,"1月份","2月份","3月份","4月份"};
double[] zData111={380,1620,6100,8310              ,280,1320,4100,6310               ,480,1220,7100,6310 };
jpgFileName =yblc.line(xData111,yData111,zData111,"月份故障统计图","月份","故障数",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >



