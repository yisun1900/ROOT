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
	String fshm=null;
	String jssj=null;
	String dxnr=null;
	fshm=request.getParameter("fshm");
	if (fshm!=null)
	{
		fshm=cf.GB2Uni(fshm);
		if (!(fshm.equals("")))	wheresql+=" and  (fshm='"+fshm+"')";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj<=TO_DATE('"+jssj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	dxnr=request.getParameter("dxnr");
	if (dxnr!=null)
	{
		dxnr=cf.GB2Uni(dxnr);
		if (!(dxnr.equals("")))	wheresql+=" and  (dxnr='"+dxnr+"')";
	}
	ls_sql="SELECT xh,fshm,to_char(jssj,'yyyy-MM-dd hh24:mi:ss'),dxnr  ";
	ls_sql+=" FROM dx_jsdx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+=" order by xh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dx_jsdxCxList.jsp","SelectCxDx_jsdx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","fshm","jssj","dxnr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[3]="align='left'";
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
  <B><font size="3">���Ž��ռ�¼��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���</td>
	<td  width="11%">�ֻ�����</td>
	<td  width="18%">����ʱ��</td>
	<td  width="65%">��������</td>
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