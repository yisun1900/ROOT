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
	String jdm_kdjgqj_kdjgqjbm=null;
	String jdm_kdjgqj_kdjgqj=null;
	String jdm_kdjgqj_qskd=null;
	String jdm_kdjgqj_zzkd=null;
	String jdm_kdjgqj_mmdglxbm=null;
	jdm_kdjgqj_kdjgqjbm=request.getParameter("jdm_kdjgqj_kdjgqjbm");
	if (jdm_kdjgqj_kdjgqjbm!=null)
	{
		jdm_kdjgqj_kdjgqjbm=cf.GB2Uni(jdm_kdjgqj_kdjgqjbm);
		if (!(jdm_kdjgqj_kdjgqjbm.equals("")))	wheresql+=" and  (jdm_kdjgqj.kdjgqjbm='"+jdm_kdjgqj_kdjgqjbm+"')";
	}
	jdm_kdjgqj_kdjgqj=request.getParameter("jdm_kdjgqj_kdjgqj");
	if (jdm_kdjgqj_kdjgqj!=null)
	{
		jdm_kdjgqj_kdjgqj=cf.GB2Uni(jdm_kdjgqj_kdjgqj);
		if (!(jdm_kdjgqj_kdjgqj.equals("")))	wheresql+=" and  (jdm_kdjgqj.kdjgqj='"+jdm_kdjgqj_kdjgqj+"')";
	}
	jdm_kdjgqj_qskd=request.getParameter("jdm_kdjgqj_qskd");
	if (jdm_kdjgqj_qskd!=null)
	{
		jdm_kdjgqj_qskd=jdm_kdjgqj_qskd.trim();
		if (!(jdm_kdjgqj_qskd.equals("")))	wheresql+=" and (jdm_kdjgqj.qskd="+jdm_kdjgqj_qskd+") ";
	}
	jdm_kdjgqj_zzkd=request.getParameter("jdm_kdjgqj_zzkd");
	if (jdm_kdjgqj_zzkd!=null)
	{
		jdm_kdjgqj_zzkd=jdm_kdjgqj_zzkd.trim();
		if (!(jdm_kdjgqj_zzkd.equals("")))	wheresql+=" and (jdm_kdjgqj.zzkd="+jdm_kdjgqj_zzkd+") ";
	}
	jdm_kdjgqj_mmdglxbm=request.getParameter("jdm_kdjgqj_mmdglxbm");
	if (jdm_kdjgqj_mmdglxbm!=null)
	{
		jdm_kdjgqj_mmdglxbm=cf.GB2Uni(jdm_kdjgqj_mmdglxbm);
		if (!(jdm_kdjgqj_mmdglxbm.equals("")))	wheresql+=" and  (jdm_kdjgqj.mmdglxbm='"+jdm_kdjgqj_mmdglxbm+"')";
	}
	ls_sql="SELECT jc_mmdglx.mmdglxmc,jdm_kdjgqj.kdjgqjbm,jdm_kdjgqj.kdjgqj,jdm_kdjgqj.qskd,jdm_kdjgqj.zzkd";
	ls_sql+=" FROM jc_mmdglx,jdm_kdjgqj  ";
    ls_sql+=" where jdm_kdjgqj.mmdglxbm=jc_mmdglx.mmdglxbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_kdjgqj.mmdglxbm,jdm_kdjgqj.kdjgqjbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_kdjgqjList.jsp","SelectJdm_kdjgqj.jsp","","EditJdm_kdjgqj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kdjgqjbm","jdm_kdjgqj_kdjgqj","jdm_kdjgqj_qskd","jdm_kdjgqj_zzkd","jc_mmdglx_mmdglxmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kdjgqjbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_kdjgqjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mmdglxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] kdjgqjbm = request.getParameterValues("kdjgqjbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kdjgqjbm,"kdjgqjbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_kdjgqj where "+chooseitem;
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
	<td  width="27%">��������</td>
	<td  width="15%">��ȼ۸��������</td>
	<td  width="15%">��ȼ۸�����</td>
	<td  width="15%">��ʼ��ȣ�>��</td>
	<td  width="15%">��ֹ��ȣ�<=��</td>
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