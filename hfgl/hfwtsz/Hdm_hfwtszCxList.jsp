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
	String hdm_hfwtsz_hflxbm=null;
	String wtbh=null;

	hdm_hfwtsz_hflxbm=request.getParameter("hdm_hfwtsz_hflxbm");
	if (hdm_hfwtsz_hflxbm!=null)
	{
		hdm_hfwtsz_hflxbm=cf.GB2Uni(hdm_hfwtsz_hflxbm);
		if (!(hdm_hfwtsz_hflxbm.equals("")))	wheresql+=" and  (hdm_hfwtsz.hflxbm='"+hdm_hfwtsz_hflxbm+"')";
	}
	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		wtbh=cf.GB2Uni(wtbh);
		if (!(wtbh.equals("")))	wheresql+=" and  (hdm_hfwtsz.wtbh='"+wtbh+"')";
	}

	ls_sql="SELECT dm_hflxbm.hflxmc,hdm_hfwtsz.wtbh,wtmc";
	ls_sql+=" FROM dm_hflxbm,hdm_hfwtsz,hdm_hfwt  ";
    ls_sql+=" where hdm_hfwtsz.hflxbm=dm_hflxbm.hflxbm(+)";
    ls_sql+=" and hdm_hfwtsz.wtbh=hdm_hfwt.wtbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hdm_hfwtsz.hflxbm,hdm_hfwtsz.wtbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Hdm_hfwtszCxList.jsp","","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="30%">�ط�����</td>
	<td  width="10%">������</td>
	<td  width="60%">��������</td>
</tr>
<%
	pageObj.printDate();
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