<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_gwgl_gwbh=null;
	String xz_gwgl_gwmc=null;
	String xz_gwgl_gwfj=null;
	String xz_gwgl_fbsj=null;
	String xz_gwgl_fbbm=null;
	String xz_gwgl_lrsj=null;
	String xz_gwgl_lrr=null;
	String fbr=null;
	fbr=request.getParameter("fbr");
	if (fbr!=null)
	{
		fbr=cf.GB2Uni(fbr);
		if (!(fbr.equals("")))	wheresql+=" and  (xz_gwgl.fbr='"+fbr+"')";
	}
	
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
	}
	else
	{
		wheresql+=" and  ((xz_gwgl.fbfgs='"+ssfgs+"' and fbfw='1') or (fbfw='2'))";
	}

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (xz_gwgl.fbfgs='"+fbfgs+"')";
	}
	String fbfw=null;
	fbfw=request.getParameter("fbfw");
	if (fbfw!=null)
	{
		fbfw=cf.GB2Uni(fbfw);
		if (!(fbfw.equals("")))	wheresql+=" and  (xz_gwgl.fbfw='"+fbfw+"')";
	}
	
	
	xz_gwgl_gwbh=request.getParameter("xz_gwgl_gwbh");
	if (xz_gwgl_gwbh!=null)
	{
		xz_gwgl_gwbh=cf.GB2Uni(xz_gwgl_gwbh);
		if (!(xz_gwgl_gwbh.equals("")))	wheresql+=" and  (xz_gwgl.gwbh='"+xz_gwgl_gwbh+"')";
	}
	xz_gwgl_gwmc=request.getParameter("xz_gwgl_gwmc");
	if (xz_gwgl_gwmc!=null)
	{
		xz_gwgl_gwmc=cf.GB2Uni(xz_gwgl_gwmc);
		if (!(xz_gwgl_gwmc.equals("")))	wheresql+=" and  (xz_gwgl.gwmc like '%"+xz_gwgl_gwmc+"%')";
	}
	xz_gwgl_gwfj=request.getParameter("xz_gwgl_gwfj");
	if (xz_gwgl_gwfj!=null)
	{
		xz_gwgl_gwfj=cf.GB2Uni(xz_gwgl_gwfj);
		if (!(xz_gwgl_gwfj.equals("")))	wheresql+=" and  (xz_gwgl.gwfj like '%"+xz_gwgl_gwfj+"%')";
	}
	xz_gwgl_fbsj=request.getParameter("xz_gwgl_fbsj");
	if (xz_gwgl_fbsj!=null)
	{
		xz_gwgl_fbsj=xz_gwgl_fbsj.trim();
		if (!(xz_gwgl_fbsj.equals("")))	wheresql+="  and (xz_gwgl.fbsj>=TO_DATE('"+xz_gwgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_gwgl_fbsj=request.getParameter("xz_gwgl_fbsj2");
	if (xz_gwgl_fbsj!=null)
	{
		xz_gwgl_fbsj=xz_gwgl_fbsj.trim();
		if (!(xz_gwgl_fbsj.equals("")))	wheresql+="  and (xz_gwgl.fbsj<=TO_DATE('"+xz_gwgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_gwgl_fbbm=request.getParameter("fbbm");
	if (xz_gwgl_fbbm!=null)
	{
		xz_gwgl_fbbm=cf.GB2Uni(xz_gwgl_fbbm);
		if (!(xz_gwgl_fbbm.equals("")))	wheresql+=" and  (xz_gwgl.fbbm='"+xz_gwgl_fbbm+"')";
	}
	xz_gwgl_lrsj=request.getParameter("xz_gwgl_lrsj");
	if (xz_gwgl_lrsj!=null)
	{
		xz_gwgl_lrsj=xz_gwgl_lrsj.trim();
		if (!(xz_gwgl_lrsj.equals("")))	wheresql+="  and (xz_gwgl.lrsj>=TO_DATE('"+xz_gwgl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_gwgl_lrsj=request.getParameter("xz_gwgl_lrsj2");
	if (xz_gwgl_lrsj!=null)
	{
		xz_gwgl_lrsj=xz_gwgl_lrsj.trim();
		if (!(xz_gwgl_lrsj.equals("")))	wheresql+="  and (xz_gwgl.lrsj<=TO_DATE('"+xz_gwgl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_gwgl_lrr=request.getParameter("xz_gwgl_lrr");
	if (xz_gwgl_lrr!=null)
	{
		xz_gwgl_lrr=cf.GB2Uni(xz_gwgl_lrr);
		if (!(xz_gwgl_lrr.equals("")))	wheresql+=" and  (xz_gwgl.lrr='"+xz_gwgl_lrr+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}


	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT xz_gwgl.gwbh,DECODE(fbfw,'1','����˾','2','����'),xz_gwgl.gwmc,'<A HREF=\"/xz/gwgl/file/'||xz_gwgl.gwfj||'\" target=\"_blank\">'||xz_gwgl.gwfj||'</A>',xz_gwgl.fbsj,xz_gwgl.fbr,a.dwmc fbbm,b.dwmc fbfgs,xz_gwgl.lrsj,xz_gwgl.lrr  ";
	ls_sql+=" FROM xz_gwgl,sq_dwxx a,sq_dwxx b ";
    ls_sql+="  where xz_gwgl.fbbm=a.dwbh and xz_gwgl.fbfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_gwglCxList.jsp","SelectCxXz_gwgl.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"gwbh","xz_gwgl_gwmc","xz_gwgl_gwfj","xz_gwgl_fbsj","xz_gwgl_fbr","xz_gwgl_fbbm","xz_gwgl_lrsj","xz_gwgl_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"gwbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_gwgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gwbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">���ı��</td>
	<td  width="7%">������Χ</td>
	<td  width="16%">��������</td>
	<td  width="19%">���ĸ���</td>
	<td  width="7%">����ʱ��</td>
	<td  width="8%">������</td>
	<td  width="12%">��������</td>
	<td  width="11%">�����ֹ�˾</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="5%">¼����</td>
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