<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String dm_pdqybm_pdqybm=null;
	String dm_pdqybm_pdqymc=null;
	String dm_pdqybm_dqbm=null;
	dm_pdqybm_pdqybm=request.getParameter("dm_pdqybm_pdqybm");
	if (dm_pdqybm_pdqybm!=null)
	{
		dm_pdqybm_pdqybm=cf.GB2Uni(dm_pdqybm_pdqybm);
		if (!(dm_pdqybm_pdqybm.equals("")))	wheresql+=" and  (dm_pdqybm.pdqybm='"+dm_pdqybm_pdqybm+"')";
	}
	dm_pdqybm_pdqymc=request.getParameter("dm_pdqybm_pdqymc");
	if (dm_pdqybm_pdqymc!=null)
	{
		dm_pdqybm_pdqymc=cf.GB2Uni(dm_pdqybm_pdqymc);
		if (!(dm_pdqybm_pdqymc.equals("")))	wheresql+=" and  (dm_pdqybm.pdqymc='"+dm_pdqybm_pdqymc+"')";
	}
	dm_pdqybm_dqbm=request.getParameter("dm_pdqybm_dqbm");
	if (dm_pdqybm_dqbm!=null)
	{
		dm_pdqybm_dqbm=cf.GB2Uni(dm_pdqybm_dqbm);
		if (!(dm_pdqybm_dqbm.equals("")))	wheresql+=" and  (dm_pdqybm.dqbm='"+dm_pdqybm_dqbm+"')";
	}
	ls_sql="SELECT dm_pdqybm.pdqybm,dm_pdqybm.pdqymc,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,dm_pdqybm  ";
    ls_sql+=" where dm_pdqybm.dqbm=dm_dqbm.dqbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and dm_pdqybm.dqbm in( select dqbm from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' ))";
	}
	else
	{
		ls_sql+=" and dm_pdqybm.dqbm in( select dqbm from sq_dwxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' ))";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by dm_pdqybm.dqbm,dm_pdqybm.pdqybm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dm_pdqybmScList.jsp","","","EditScDm_pdqybm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pdqybm","dm_pdqybm_pdqymc","dm_dqbm_dqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pdqybm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Dm_pdqybmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] pdqybm = request.getParameterValues("pdqybm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pdqybm,"pdqybm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from dm_pdqybm where "+chooseitem;
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
	<td  width="8%">&nbsp;</td>
	<td  width="20%">�ɵ��������</td>
	<td  width="52%">�ɵ���������</td>
	<td  width="20%">����</td>
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