<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ppbm=null;
	String ppmc=null;
	String clxl=null;
	String scsmc=null;

	String cldl=null;
	cldl=request.getParameter("cldl");
	if (cldl!=null)
	{
		cldl=cf.GB2Uni(cldl);
		if (!(cldl.equals("")))	wheresql+=" and  (jxc_ppxx.cldl='"+cldl+"')";
	}
	String pplb=null;
	pplb=request.getParameter("pplb");
	if (pplb!=null)
	{
		pplb=pplb.trim();
		if (!(pplb.equals("")))	wheresql+=" and (jxc_ppxx.pplb="+pplb+") ";
	}
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=ppbm.trim();
		if (!(ppbm.equals("")))	wheresql+=" and (ppbm="+ppbm+") ";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc like '%"+ppmc+"%')";
	}
	clxl=request.getParameter("clxl");
	if (clxl!=null)
	{
		clxl=cf.GB2Uni(clxl);
		if (!(clxl.equals("")))	wheresql+=" and  (clxl='"+clxl+"')";
	}
	scsmc=request.getParameter("scsmc");
	if (scsmc!=null)
	{
		scsmc=cf.GB2Uni(scsmc);
		if (!(scsmc.equals("")))	wheresql+=" and  (scsmc='"+scsmc+"')";
	}

	ls_sql="SELECT ppbm,ppmc,scsmc,cldl,clxl,tcycf,DECODE(sfxcl,'Y','��Ҫ','N','��'),DECODE(sfkgtcsl,'Y','����','N','��'),DECODE(pplb,'1','����','2','����'),bz  ";
	ls_sql+=" FROM jxc_ppxx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+=" order by pplb,cldl,clxl,scsmc,ppmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_ppxxList.jsp","","","EditJxc_ppxx.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"ppbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jxc_ppxxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] ppbm = request.getParameterValues("ppbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ppbm,"ppbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jxc_ppxx where "+chooseitem;
		sql[1]="delete from jxc_ppgysdzb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="6%">��Ʒ�Ʊ���</td>
	<td  width="14%">��Ʒ������</td>
	<td  width="11%">Ʒ������</td>
	<td  width="13%">���ϴ���</td>
	<td  width="11%">����С��</td>
	<td  width="6%">�ײ�Զ�̷�</td>
	<td  width="6%">�Ƿ������</td>
	<td  width="6%">�Ƿ�ɸ��ײ�����</td>
	<td  width="6%">��Ʒ�����</td>
	<td  width="20%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>