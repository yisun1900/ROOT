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
	String dm_tsyybm_tsyybm=null;
	String dm_tsyybm_tsyymc=null;
	String dm_tsyybm_tslxbm=null;
	String dm_tsyybm_tsxlbm=null;
	String dm_tsyybm_px=null;
	dm_tsyybm_tsyybm=request.getParameter("dm_tsyybm_tsyybm");
	if (dm_tsyybm_tsyybm!=null)
	{
		dm_tsyybm_tsyybm=cf.GB2Uni(dm_tsyybm_tsyybm);
		if (!(dm_tsyybm_tsyybm.equals("")))	wheresql+=" and  (dm_tsyybm.tsyybm='"+dm_tsyybm_tsyybm+"')";
	}
	dm_tsyybm_tsyymc=request.getParameter("dm_tsyybm_tsyymc");
	if (dm_tsyybm_tsyymc!=null)
	{
		dm_tsyybm_tsyymc=cf.GB2Uni(dm_tsyybm_tsyymc);
		if (!(dm_tsyybm_tsyymc.equals("")))	wheresql+=" and  (dm_tsyybm.tsyymc='"+dm_tsyybm_tsyymc+"')";
	}
	dm_tsyybm_tslxbm=request.getParameter("dm_tsyybm_tslxbm");
	if (dm_tsyybm_tslxbm!=null)
	{
		dm_tsyybm_tslxbm=cf.GB2Uni(dm_tsyybm_tslxbm);
		if (!(dm_tsyybm_tslxbm.equals("")))	wheresql+=" and  (dm_tsyybm.tslxbm='"+dm_tsyybm_tslxbm+"')";
	}
	dm_tsyybm_tsxlbm=request.getParameter("dm_tsyybm_tsxlbm");
	if (dm_tsyybm_tsxlbm!=null)
	{
		dm_tsyybm_tsxlbm=cf.GB2Uni(dm_tsyybm_tsxlbm);
		if (!(dm_tsyybm_tsxlbm.equals("")))	wheresql+=" and  (dm_tsyybm.tsxlbm='"+dm_tsyybm_tsxlbm+"')";
	}
	dm_tsyybm_px=request.getParameter("dm_tsyybm_px");
	if (dm_tsyybm_px!=null)
	{
		dm_tsyybm_px=dm_tsyybm_px.trim();
		if (!(dm_tsyybm_px.equals("")))	wheresql+=" and (dm_tsyybm.px="+dm_tsyybm_px+") ";
	}
	ls_sql="SELECT dm_tsyybm.tsyybm,dm_tsyybm.tsyymc,dm_tsyybm.zjkf,dm_tsyybm.px,dm_tsxlbm.tsxlmc,dm_tslxbm.tslxmc  ";
	ls_sql+=" FROM dm_tsxlbm,dm_tslxbm,dm_tsyybm  ";
    ls_sql+=" where dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm(+) and dm_tsyybm.tslxbm=dm_tslxbm.tslxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by  dm_tsyybm.tslxbm,dm_tsyybm.tsxlbm,dm_tsyybm.tsyybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_tsyybmList.jsp","SelectDm_tsyybm.jsp","","EditDm_tsyybm.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"tsyybm","dm_tsyybm_tsyymc","dm_tslxbm_tslxmc","dm_tsxlbm_tsxlmc","dm_tsyybm_px"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"tsyybm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_tsyybmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tsxlmc","1");//�в����������Hash��
	spanColHash.put("tslxmc","2");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] tsyybm = request.getParameterValues("tsyybm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tsyybm,"tsyybm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_tsyybm where "+chooseitem;
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
	<td  width="0%">&nbsp;</td>
	<td  width="15%">Ͷ�߱���ԭ�����</td>
	<td  width="23%">Ͷ�߱���ԭ������</td>
	<td  width="10%">�ʼ�۷�</td>
	<td  width="10%">��ʾ˳��</td>
	<td  width="18%">Ͷ�߱���С��</td>
	<td  width="15%">Ͷ�߱��޴���</td>
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