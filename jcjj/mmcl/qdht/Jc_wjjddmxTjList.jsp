<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(lrxh) lrxh,jc_wjjddmx.yddbh as yddbh,jc_wjjddmx.xh as xh,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,mmsbsmc,jc_wjjddmx.xinghao xinghao,TO_CHAR(jc_wjjddmx.bzdj) bzdj,TO_CHAR(jc_wjjddmx.dj) as jc_wjjddmx_dj,jc_wjjddmx.sl as jc_wjjddmx_sl,jc_wjjddmx.dj*jc_wjjddmx.sl je,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' and jc_wjjddmx.lx='1'";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+)";
	ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_wjjddmxTjList.jsp?yddbh="+yddbh,"","","TjJc_wjjddmx.jsp");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lrxh","wjmc","jdm_wjjbm_wjjmc","xinghao","mmsbsmc","bzdj","jc_wjjddmx_dj","jc_wjjddmx_sl","je","jc_wjjddmx_bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"lrxh"};
	pageObj.setKey(keyName);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">����������ϸ---������ͬ�۸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="4%">���</td>
	<td  width="18%">�������</td>
	<td  width="8%">������</td>
	<td  width="17%">�ͺ�</td>
	<td  width="9%">������</td>
	<td  width="5%">��׼����</td>
	<td  width="5%">�ͻ�����</td>
	<td  width="5%">��������</td>
	<td  width="8%">�ܽ��</td>
	<td  width="14%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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