<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
String yhdlm=(String)session.getAttribute("yhdlm");

if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;

	String ls_sql=null;

	ls_sql=" SELECT  ggbh,ck,ggmc,fbsj,fbr,dwmc";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT  xz_ggbgl.ggbh,'δ�Ķ�' ck,xz_ggbgl.ggmc,xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
	ls_sql+=" FROM xz_ggdx,xz_ggbgl,sq_dwxx  ";
    ls_sql+=" where xz_ggdx.ggbh=xz_ggbgl.ggbh and xz_ggbgl.fbbm=sq_dwxx.dwbh and xz_ggdx.yhdlm='"+yhdlm+"' and xz_ggbgl.lrsj>SYSDATE-30";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT  xz_ggbgl.ggbh,'�Ķ�' ck,xz_ggbgl.ggmc,xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
	ls_sql+=" FROM sq_dwxx,xz_ggbgl,xz_ggckjl  ";
    ls_sql+=" where xz_ggckjl.yhdlm='"+yhdlm+"' and xz_ggbgl.ggbh=xz_ggckjl.ggbh and xz_ggbgl.fbbm=sq_dwxx.dwbh ";
	ls_sql+=" ) ";
	ls_sql+=" order by ck,fbsj desc,ggbh";

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_OldggbglCxList.jsp","","","");
	pageObj.setViewBolt("");
	pageObj.setPageRow(60);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ggbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_ggbgl.jsp";//Ϊ�в�����coluParm.link���ó�������
//	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ggbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">������</td>
	<td  width="7%">&nbsp;</td>
	<td  width="50%">����</td>
	<td  width="10%">����ʱ��</td>
	<td  width="8%">������</td>
	<td  width="14%">��������</td>
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