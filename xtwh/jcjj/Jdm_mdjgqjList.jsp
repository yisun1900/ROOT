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
	String mdjgqjbm=null;
	String mdjgqj=null;
	String qskd=null;
	String zzkd=null;
	String qsgd=null;
	String zzgd=null;
	String mlx=null;
	mdjgqjbm=request.getParameter("mdjgqjbm");
	if (mdjgqjbm!=null)
	{
		mdjgqjbm=cf.GB2Uni(mdjgqjbm);
		if (!(mdjgqjbm.equals("")))	wheresql+=" and  (mdjgqjbm='"+mdjgqjbm+"')";
	}
	mdjgqj=request.getParameter("mdjgqj");
	if (mdjgqj!=null)
	{
		mdjgqj=cf.GB2Uni(mdjgqj);
		if (!(mdjgqj.equals("")))	wheresql+=" and  (mdjgqj='"+mdjgqj+"')";
	}
	qskd=request.getParameter("qskd");
	if (qskd!=null)
	{
		qskd=qskd.trim();
		if (!(qskd.equals("")))	wheresql+=" and (qskd="+qskd+") ";
	}
	zzkd=request.getParameter("zzkd");
	if (zzkd!=null)
	{
		zzkd=zzkd.trim();
		if (!(zzkd.equals("")))	wheresql+=" and (zzkd="+zzkd+") ";
	}
	qsgd=request.getParameter("qsgd");
	if (qsgd!=null)
	{
		qsgd=qsgd.trim();
		if (!(qsgd.equals("")))	wheresql+=" and (qsgd="+qsgd+") ";
	}
	zzgd=request.getParameter("zzgd");
	if (zzgd!=null)
	{
		zzgd=zzgd.trim();
		if (!(zzgd.equals("")))	wheresql+=" and (zzgd="+zzgd+") ";
	}
	mlx=request.getParameter("mlx");
	if (mlx!=null)
	{
		if (!(mlx.equals("")))	wheresql+=" and (jdm_mdjgqj.mlx="+mlx+") ";
	}

	ls_sql="SELECT mlxmc,mdjgqjbm,mdjgqj,qskd,zzkd,qsgd,zzgd  ";
	ls_sql+=" FROM jdm_mdjgqj,jdm_mlx  ";
    ls_sql+=" where (jdm_mdjgqj.mlx=jdm_mlx.mlx(+))";
    ls_sql+=wheresql;
     ls_sql+=" order by jdm_mdjgqj.mlx,mdjgqjbm";
   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_mdjgqjList.jsp","SelectJdm_mdjgqj.jsp","","EditJdm_mdjgqj.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"mdjgqjbm","mdjgqj","qskd","zzkd","qsgd","zzgd"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"mdjgqjbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_mdjgqjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mlxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] mdjgqjbm = request.getParameterValues("mdjgqjbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(mdjgqjbm,"mdjgqjbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_mdjgqj where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="15%">������</td>
	<td  width="10%">�Ŷ��۸��������</td>
	<td  width="25%">�Ŷ��۸�����</td>
	<td  width="10%">��ʼ��ȣ�>��mm</td>
	<td  width="10%">��ֹ��ȣ�<=��mm</td>
	<td  width="10%">��ʼ�߶ȣ�>��mm</td>
	<td  width="10%">��ֹ�߶ȣ�<=��mm</td>
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