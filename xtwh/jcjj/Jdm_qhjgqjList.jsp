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
	String qhjgqjbm=null;
	String qhjgqj=null;
	String qshd=null;
	String zzhd=null;
	String mmdglxbm=null;
	mmdglxbm=request.getParameter("mmdglxbm");
	if (mmdglxbm!=null)
	{
		if (!(mmdglxbm.equals("")))	wheresql+=" and  (jdm_qhjgqj.mmdglxbm='"+mmdglxbm+"')";
	}
	qhjgqjbm=request.getParameter("qhjgqjbm");
	if (qhjgqjbm!=null)
	{
		qhjgqjbm=cf.GB2Uni(qhjgqjbm);
		if (!(qhjgqjbm.equals("")))	wheresql+=" and  (qhjgqjbm='"+qhjgqjbm+"')";
	}
	qhjgqj=request.getParameter("qhjgqj");
	if (qhjgqj!=null)
	{
		qhjgqj=cf.GB2Uni(qhjgqj);
		if (!(qhjgqj.equals("")))	wheresql+=" and  (qhjgqj='"+qhjgqj+"')";
	}
	qshd=request.getParameter("qshd");
	if (qshd!=null)
	{
		qshd=qshd.trim();
		if (!(qshd.equals("")))	wheresql+=" and (qshd="+qshd+") ";
	}
	zzhd=request.getParameter("zzhd");
	if (zzhd!=null)
	{
		zzhd=zzhd.trim();
		if (!(zzhd.equals("")))	wheresql+=" and (zzhd="+zzhd+") ";
	}
	ls_sql="SELECT mmdglxmc,qhjgqjbm,qhjgqj,qshd,zzhd";
	ls_sql+=" FROM jdm_qhjgqj,jc_mmdglx  ";
    ls_sql+=" where (jdm_qhjgqj.mmdglxbm=jc_mmdglx.mmdglxbm(+))";
    ls_sql+=wheresql;
    ls_sql+=" order by jdm_qhjgqj.mmdglxbm,qhjgqjbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jdm_qhjgqjList.jsp","SelectJdm_qhjgqj.jsp","","EditJdm_qhjgqj.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"qhjgqjbm","qhjgqj","qshd","zzhd"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"qhjgqjbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jdm_qhjgqjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mmdglxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] qhjgqjbm = request.getParameterValues("qhjgqjbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(qhjgqjbm,"qhjgqjbm"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jdm_qhjgqj where "+chooseitem;
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
	<td  width="18%">��������</td>
	<td  width="18%">ǽ��۸��������</td>
	<td  width="20%">ǽ��۸�����</td>
	<td  width="17%">��ʼ��ȣ�>��mm</td>
	<td  width="17%">��ֹ��ȣ�<=��mm</td>
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