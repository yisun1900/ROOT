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
	String wlbm=null;
	String glmc=null;
	String cldlbm=null;
	String dqbm=null;

	String wlllbz=null;
	wlllbz=request.getParameter("wlllbz");
	if (wlllbz!=null)
	{
		wlllbz=cf.GB2Uni(wlllbz);
		if (!(wlllbz.equals("")))	wheresql+=" and  (bj_jscljgb.wlllbz='"+wlllbz+"')";
	}
	
	wlbm=request.getParameter("wlbm");
	if (wlbm!=null)
	{
		wlbm=cf.GB2Uni(wlbm);
		if (!(wlbm.equals("")))	wheresql+=" and  (bj_jscljgb.wlbm='"+wlbm+"')";
	}
	glmc=request.getParameter("glmc");
	if (glmc!=null)
	{
		glmc=cf.GB2Uni(glmc);
		if (!(glmc.equals("")))	wheresql+=" and  (bj_jscljgb.glmc like '%"+glmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (bj_jscljgb.cldlbm='"+cldlbm+"')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jscljgb.dqbm='"+dqbm+"')";
	}
	ls_sql="SELECT dqmc,DECODE(wlllbz,'Y','��Ҫ','N','��'),cldlmc,wlbm,glmc,xhgg,pp,cljldwmc,dj,lrr,lrsj ";
	ls_sql+=" FROM bj_jscljgb,dm_dqbm,bdm_cldlbm,bdm_cljldwbm ";
	ls_sql+=" where ( bj_jscljgb.dqbm=dm_dqbm.dqbm and  bj_jscljgb.cldlbm=bdm_cldlbm.cldlbm(+) and bj_jscljgb.jldwbm=bdm_cljldwbm.cljldwbm(+))";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_jscljgb.dqbm,wlbm";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_bjmbTqList.jsp","SelectTqBj_gzcljgb.jsp","","TqEditBj_gzclb.jsp?dqbm="+dqbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"wlbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_bjmbTqList.jsp?dqbm="+dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
    String dqbm=request.getParameter("dqbm");
	String[] wlbm = request.getParameterValues("wlbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(wlbm,"wlbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bj_jscljgb where dqbm='"+dqbm+"' and ("+chooseitem+")";
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
  <B><font size="3">ά������Ȩ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">��������</td>
	<td  width="4%">�赽��������</td>
	<td  width="13%">�������</td>
	<td  width="7%">������ϱ���</td>
    <td  width="15%">��������</td>
	<td  width="12%">�ͺŹ��</td>
	<td  width="15%">Ʒ��</td>
	<td  width="6%">������λ</td>
	<td  width="6%">����</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
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