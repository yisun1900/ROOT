<%@ page contentType="text/html;charset=GBK" %>




<%

ybl.common.YBLChart  yblc=new ybl.common.YBLChart();



String[][] inData={{"��ʯ��","1380"},{"��ʯ��","580"},{"���̾�","1120"},{"�̼��","670"}};
String jpgFileName =yblc.pie(inData,"��֮�������ͻ�ͳ�Ʊ�",900,500,0,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String[] xData={"����","����","��ר","����","˶ʿ","��ʿ"};
double[] yData={380,1620,6100,8310,3520,1900};
jpgFileName =yblc.pie(xData,yData,"����Աѧ����������",500,300,1,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String[] xData2={"����","����","��ר","����","˶ʿ","��ʿ"};
int[] yData2={380,1620,6100,8310,3520,1900};
jpgFileName =yblc.pie(xData2,yData2,"����Աѧ����������",500,300,1,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String[] xData1={"����","��ר","����","˶ʿ","��ʿ"};
String[] yData1={"1620","6100","8310","3520","1900"};
jpgFileName =yblc.pie(xData1,yData1,"����Աѧ����������",500,300,2,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%



String sql="select dwmc,sum(qye) from crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and qye!=0 group by dwmc order by dwmc";
jpgFileName =yblc.pie3D(sql,"����ǩ��ͳ��",600,500,3,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%  



String[][] inData2={{"����","1�·�","300"},{"����","2�·�","680"},{"����","3�·�","1320"},{"����","4�·�","2500"}
                    ,{"����","1�·�","200"},{"����","2�·�","480"},{"����","3�·�","1620"},{"����","4�·�","2700"}
                    ,{"��","1�·�","100"},{"��","2�·�","780"},{"��","3�·�","1520"},{"��","4�·�","2100"}};
jpgFileName =yblc.bar(inData2,"2008����֮������ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData11={"����","����","����","����"       ,"����","����","����","����"        ,"��","��","��","��"};
String[] yData11={"1�·�","2�·�","3�·�","4�·�"   ,"1�·�","2�·�","3�·�","4�·�"    ,"1�·�","2�·�","3�·�","4�·�"};
double[] zData11={380,1620,6100,8310              ,280,1320,4100,6310               ,480,1220,7100,6310 };
jpgFileName =yblc.bar(xData11,yData11,zData11,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData12={"����","����","����","����"       ,"����","����","����","����"       ,"��","��","��","��"};
String[] yData12={"1�·�","2�·�","3�·�","4�·�"   ,"1�·�","2�·�","3�·�","4�·�"   ,"1�·�","2�·�","3�·�","4�·�"};
int[] zData12={380,1620,2100,5310                 ,280,1320,4100,2310             ,480,1220,4100,6310 };
jpgFileName =yblc.bar(xData12,yData12,zData12,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData13={"����","����","����","����"       ,"����","����","����","����"       ,"��","��","��","��"};
String[] yData13={"1�·�","2�·�","3�·�","4�·�"   ,"1�·�","2�·�","3�·�","4�·�"   ,"1�·�","2�·�","3�·�","4�·�"};
String[] zData13={"380","1620","6100","3310"      ,"280","1320","4100","6310"      ,"480","1220","5100","6310" };
jpgFileName =yblc.bar(xData13,yData13,zData13,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[][] inData211={{"1�·�","300"},{"2�·�","480"},{"3�·�","320"},{"4�·�","210"},{"5�·�","500"},{"6�·�","280"},{"7�·�","270"},{"8�·�","250"},{"9�·�","230"},{"10�·�","240"},{"11�·�","200"},{"12�·�","250"}};
jpgFileName =yblc.bar("2008����֮������ͳ��ͼ",inData211,"�·�","���۶��Ԫ��",900,500,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%






String[][] inData273={{"1�·�","300"},{"2�·�","680"},{"3�·�","1320"},{"4�·�","2500"}};
jpgFileName =yblc.bar(inData273,500,300,request,session);
%>
<BR>�·ݹ���ͳ��ͼ����λ��������<BR>
<img src="<%=jpgFileName%>" border=0 >
<%


String[] inData202={"�ɻ�2","����2"};
String[][] inData212={{"1�·�","300"},{"2�·�","680"},{"3�·�","1320"},{"4�·�","2500"}};
String[][] inData222={{"1�·�","500"},{"2�·�","880"},{"3�·�","1220"},{"4�·�","1500"}};
jpgFileName =yblc.bar(inData202,inData212,inData222,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] inData203={"�ɻ�3","����3","����3"};
String[][] inData213={{"1�·�","300"},{"2�·�","680"},{"3�·�","1320"},{"4�·�","2500"}};
String[][] inData223={{"1�·�","500"},{"2�·�","880"},{"3�·�","1220"},{"4�·�","1500"}};
String[][] inData233={{"1�·�","100"},{"2�·�","780"},{"3�·�","1520"},{"4�·�","1100"}};
jpgFileName =yblc.bar(inData203,inData213,inData223,inData233,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%





String[] xData14={"1�·�","2�·�","3�·�","4�·�","5�·�"};
String[] yData14={"1620","6100","8310","3520","1900"};
jpgFileName =yblc.bar(xData14,yData14,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%






sql="select dwmc,sum(qye) from crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and qye!=0 group by dwmc order by dwmc";
jpgFileName =yblc.bar(sql,"����ǩ��ͳ��","����","ǩԼ��",900,500,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%  






sql="select dwmc,sum(qye) from crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and qye!=0 group by dwmc order by dwmc";
jpgFileName =yblc.bar(sql,800,300,request,session);
%>
<BR>����ǩ��ͳ�ƣ���λ��Ԫ��<BR>
<img src="<%=jpgFileName%>" border=0 >



<%
String[][] inData21={{"����","1�·�","1300"},{"����","2�·�","680"},{"����","3�·�","1120"},{"����","4�·�","1500"}
                    ,{"����","1�·�","200"},{"����","2�·�","480"},{"����","3�·�","1620"},{"����","4�·�","700"}
                    ,{"��","1�·�","700"},{"��","2�·�","480"},{"��","3�·�","1220"},{"��","4�·�","200"}};
jpgFileName =yblc.line(inData21,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >
<%




String[] xData111={"����","����","����","����"       ,"����","����","����","����"        ,"��","��","��","��"};
String[] yData111={"1�·�","2�·�","3�·�","4�·�"   ,"1�·�","2�·�","3�·�","4�·�"    ,"1�·�","2�·�","3�·�","4�·�"};
double[] zData111={380,1620,6100,8310              ,280,1320,4100,6310               ,480,1220,7100,6310 };
jpgFileName =yblc.line(xData111,yData111,zData111,"�·ݹ���ͳ��ͼ","�·�","������",500,300,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >



