<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=cf.GB2Uni(request.getParameter("fgs"));

	String sjwjrq=request.getParameter("sjwjrq");
	String sjwjrq2=request.getParameter("sjwjrq2");

	String sfwj=request.getParameter("sfwj");//����

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="select '',crm_khxx.khbh khbh,crm_khxx.hth hth,crm_khxx.khxm khxm,crm_khxx.qye qye,sq_sgd.sgdmc sgdmc,cl_djjflmx.cldlmc,cl_djjflmx.ylqje,cl_djjflmx.sjje sjje,to_char(round((sjje/qye * 100), 2)) || '%',cl_djjflmx.jmyy,cl_djjflmx.ylqje-cl_djjflmx.sjje jmje";
	ls_sql+=" from cl_djjflmx,crm_khxx,sq_sgd  ";
	ls_sql+=" where cl_djjflmx.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
	if(sfwj.equals("5")){
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"' and crm_khxx.gcjdbm='5' ";
	ls_sql+=" and crm_khxx.sjwjrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjwjrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
	}
	else if(sfwj.equals("4")){
	ls_sql+=" and crm_khxx.fgsbh='"+fgs+"' and crm_khxx.gcjdbm='4' ";
	ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjwjrq+"','YYYY-MM-DD') and crm_khxx.sjjgrq<=TO_DATE('"+sjwjrq2+"','YYYY-MM-DD')";
	}
//		ls_sql+=" and cl_djjflmx.ylqje>cl_djjflmx.sjje ";
//		ls_sql+=" and cl_djjflmx.ylqje*0.98>cl_djjflmx.sjje ";
	ls_sql+=" order by  crm_khxx.fgsbh,crm_khxx.khxm,cl_djjflmx.cldlmc";
//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("clfxKhList.jsp","","","");

	pageObj.setPageRow(Integer.parseInt(myxssl));

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="Cl_djjCxList.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//�����г�������

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="../../dzbj/zxbjmx/Bj_khbjmxDyList.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("hth",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("hth","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("qye","1");//�в����������Hash��
	spanColHash.put("sgdmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��


}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<CENTER >
  <B><font size="3">����ͳ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>

<tr bgcolor="CCCCCC" align="center"> 
	<td width="4%"><B>���</b></td>
	<td width="7%"><B>�ͻ����</b></td>
	<td width="7%"><B>��ͬ��</b></td>
	<td width="7%"><B>�ͻ�����</b></td>
	<td width="8%"><B>����ǩԼ��</b></td>
	<td width="7%"><B>��Ŀ����</b></td>
	<td width="10%"><B>���ϴ���</b></td>
	<td width="9%"><B>Ӧ��ȡ���</b></td>
	<td width="8%"><B>ʵ�ʽ��</b></td>
	<td width="6%"><B>ռ��</b></td>
	<td width="14%"><B>����ԭ��</b></td>
	<td width="8%"><B>������</b></td>

</tr>
<%
	pageObj.printDateSum(true);
	pageObj.displayFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 

//-->
</script>


