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
	String dm_shxmbm_shxmbm=null;
	String dm_shxmbm_shxmmc=null;
	String dm_shxmbm_shxmdlbm=null;
	String dm_shxmbm_shxmxlbm=null;
	String dm_shxmbm_kf=null;
	dm_shxmbm_shxmbm=request.getParameter("dm_shxmbm_shxmbm");
	if (dm_shxmbm_shxmbm!=null)
	{
		dm_shxmbm_shxmbm=cf.GB2Uni(dm_shxmbm_shxmbm);
		if (!(dm_shxmbm_shxmbm.equals("")))	wheresql+=" and  (dm_shxmbm.shxmbm='"+dm_shxmbm_shxmbm+"')";
	}
	dm_shxmbm_shxmmc=request.getParameter("dm_shxmbm_shxmmc");
	if (dm_shxmbm_shxmmc!=null)
	{
		dm_shxmbm_shxmmc=cf.GB2Uni(dm_shxmbm_shxmmc);
		if (!(dm_shxmbm_shxmmc.equals("")))	wheresql+=" and  (dm_shxmbm.shxmmc like '%"+dm_shxmbm_shxmmc+"%')";
	}
	dm_shxmbm_shxmdlbm=request.getParameter("dm_shxmbm_shxmdlbm");
	if (dm_shxmbm_shxmdlbm!=null)
	{
		dm_shxmbm_shxmdlbm=cf.GB2Uni(dm_shxmbm_shxmdlbm);
		if (!(dm_shxmbm_shxmdlbm.equals("")))	wheresql+=" and  (dm_shxmbm.shxmdlbm='"+dm_shxmbm_shxmdlbm+"')";
	}
	dm_shxmbm_shxmxlbm=request.getParameter("dm_shxmbm_shxmxlbm");
	if (dm_shxmbm_shxmxlbm!=null)
	{
		dm_shxmbm_shxmxlbm=cf.GB2Uni(dm_shxmbm_shxmxlbm);
		if (!(dm_shxmbm_shxmxlbm.equals("")))	wheresql+=" and  (dm_shxmbm.shxmxlbm='"+dm_shxmbm_shxmxlbm+"')";
	}
	dm_shxmbm_kf=request.getParameter("dm_shxmbm_kf");
	if (dm_shxmbm_kf!=null)
	{
		dm_shxmbm_kf=dm_shxmbm_kf.trim();
		if (!(dm_shxmbm_kf.equals("")))	wheresql+=" and (dm_shxmbm.kf="+dm_shxmbm_kf+") ";
	}
	ls_sql="SELECT shxmdlmc,shxmxlmc,dm_shxmbm.shxmbm,dm_shxmbm.shxmmc,dm_shxmbm.kf  ";
	ls_sql+=" FROM dm_shxmbm,dm_shxmdlbm,dm_shxmxlbm  ";
    ls_sql+=" where dm_shxmbm.shxmxlbm=dm_shxmxlbm.shxmxlbm and dm_shxmbm.shxmdlbm=dm_shxmdlbm.shxmdlbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dm_shxmbm.shxmdlbm,dm_shxmbm.shxmxlbm,shxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_shxmbmList.jsp","SelectDm_shxmbm.jsp","","EditDm_shxmbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"shxmbm","dm_shxmbm_shxmmc","dm_shxmdlbm_shxmdlmc","dm_shxmxlbm_shxmxlmc","dm_shxmbm_kf"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"shxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_shxmbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("shxmdlmc","1");//�в����������Hash��
	spanColHash.put("shxmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] shxmbm = request.getParameterValues("shxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shxmbm,"shxmbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_shxmbm where "+chooseitem;
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
	<td  width="16%">�����Ŀ����</td>
	<td  width="20%">�����ĿС��</td>
	<td  width="10%">�����Ŀ����</td>
	<td  width="38%">�����Ŀ����</td>
	<td  width="6%">�۷�</td>
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