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
	String jdm_ppbm_ppbm=null;
	String jdm_ppbm_ppmc=null;
	String jdm_ppbm_dwbh=null;
	String zclb=null;
	zclb=request.getParameter("zclb");
	if (zclb!=null)
	{
		zclb=cf.GB2Uni(zclb);
		if (!(zclb.equals("")))	wheresql+=" and  (jdm_ppbm.zclb='"+zclb+"')";
	}
	jdm_ppbm_ppbm=request.getParameter("jdm_ppbm_ppbm");
	if (jdm_ppbm_ppbm!=null)
	{
		jdm_ppbm_ppbm=cf.GB2Uni(jdm_ppbm_ppbm);
		if (!(jdm_ppbm_ppbm.equals("")))	wheresql+=" and  (jdm_ppbm.ppbm='"+jdm_ppbm_ppbm+"')";
	}
	jdm_ppbm_ppmc=request.getParameter("jdm_ppbm_ppmc");
	if (jdm_ppbm_ppmc!=null)
	{
		jdm_ppbm_ppmc=cf.GB2Uni(jdm_ppbm_ppmc);
		if (!(jdm_ppbm_ppmc.equals("")))	wheresql+=" and  (jdm_ppbm.ppmc='"+jdm_ppbm_ppmc+"')";
	}
	jdm_ppbm_dwbh=request.getParameter("jdm_ppbm_dwbh");
	if (jdm_ppbm_dwbh!=null)
	{
		jdm_ppbm_dwbh=cf.GB2Uni(jdm_ppbm_dwbh);
		if (!(jdm_ppbm_dwbh.equals("")))	wheresql+=" and  (jdm_ppbm.dwbh='"+jdm_ppbm_dwbh+"')";
	}
	ls_sql="SELECT jdm_ppbm.ppbm,jdm_ppbm.ppmc,sq_dwxx.dwmc,zcdlmc  ";
	ls_sql+=" FROM sq_dwxx,jdm_ppbm,jdm_zcdlbm  ";
    ls_sql+=" where jdm_ppbm.dwbh=sq_dwxx.dwbh and jdm_ppbm.zclb=jdm_zcdlbm.zcdlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_ppbm.zclb,jdm_ppbm.dwbh,jdm_ppbm.ppbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_ppbmList.jsp","SelectJdm_ppbm.jsp","","EditJdm_ppbm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ppbm","jdm_ppbm_ppmc","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ppbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_ppbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zcdlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] ppbm = request.getParameterValues("ppbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ppbm,"ppbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_ppbm where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="10%">Ʒ�Ʊ���</td>
	<td  width="30%">Ʒ������</td>
	<td  width="20%">��������</td>
	<td  width="15%">�������</td>
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