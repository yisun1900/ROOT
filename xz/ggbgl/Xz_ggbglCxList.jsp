<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");//��ȡ��¼��
String yhjs=(String)session.getAttribute("yhjs");//��ȡ�û���ɫ
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;

	String ls_sql=null;
	String wheresql="";
	String xz_ggbgl_ggbh=null;
	String xz_ggbgl_ggmc=null;
	String xz_ggbgl_fbsj=null;
	String xz_ggbgl_fbr=null;
	String xz_ggbgl_fbbm=null;
	String xz_ggbgl_lrr=null;
	String xz_ggbgl_lrsj=null;

	String fbfgs=null;
	fbfgs=request.getParameter("fbfgs");
	if (fbfgs!=null)
	{
		fbfgs=cf.GB2Uni(fbfgs);
		if (!(fbfgs.equals("")))	wheresql+=" and  (xz_ggbgl.fbfgs='"+fbfgs+"')";
	}

	xz_ggbgl_ggbh=request.getParameter("xz_ggbgl_ggbh");
	if (xz_ggbgl_ggbh!=null)
	{
		xz_ggbgl_ggbh=cf.GB2Uni(xz_ggbgl_ggbh);
		if (!(xz_ggbgl_ggbh.equals("")))	wheresql+=" and  (xz_ggbgl.ggbh='"+xz_ggbgl_ggbh+"')";
	}
	xz_ggbgl_ggmc=request.getParameter("xz_ggbgl_ggmc");
	if (xz_ggbgl_ggmc!=null)
	{
		xz_ggbgl_ggmc=cf.GB2Uni(xz_ggbgl_ggmc);
		if (!(xz_ggbgl_ggmc.equals("")))	wheresql+=" and  (xz_ggbgl.ggmc='"+xz_ggbgl_ggmc+"')";
	}
	xz_ggbgl_fbsj=request.getParameter("xz_ggbgl_fbsj");
	if (xz_ggbgl_fbsj!=null)
	{
		xz_ggbgl_fbsj=xz_ggbgl_fbsj.trim();
		if (!(xz_ggbgl_fbsj.equals("")))	wheresql+="  and (xz_ggbgl.fbsj>=TO_DATE('"+xz_ggbgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_fbsj=request.getParameter("xz_ggbgl_fbsj2");
	if (xz_ggbgl_fbsj!=null)
	{
		xz_ggbgl_fbsj=xz_ggbgl_fbsj.trim();
		if (!(xz_ggbgl_fbsj.equals("")))	wheresql+="  and (xz_ggbgl.fbsj<=TO_DATE('"+xz_ggbgl_fbsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_fbr=request.getParameter("xz_ggbgl_fbr");
	if (xz_ggbgl_fbr!=null)
	{
		xz_ggbgl_fbr=cf.GB2Uni(xz_ggbgl_fbr);
		if (!(xz_ggbgl_fbr.equals("")))	wheresql+=" and  (xz_ggbgl.fbr='"+xz_ggbgl_fbr+"')";
	}
	xz_ggbgl_fbbm=request.getParameter("xz_ggbgl_fbbm");
	if (xz_ggbgl_fbbm!=null)
	{
		xz_ggbgl_fbbm=cf.GB2Uni(xz_ggbgl_fbbm);
		if (!(xz_ggbgl_fbbm.equals("")))	wheresql+=" and  (xz_ggbgl.fbbm='"+xz_ggbgl_fbbm+"')";
	}
	xz_ggbgl_lrr=request.getParameter("xz_ggbgl_lrr");
	if (xz_ggbgl_lrr!=null)
	{
		xz_ggbgl_lrr=cf.GB2Uni(xz_ggbgl_lrr);
		if (!(xz_ggbgl_lrr.equals("")))	wheresql+=" and  (xz_ggbgl.lrr='"+xz_ggbgl_lrr+"')";
	}
	xz_ggbgl_lrsj=request.getParameter("xz_ggbgl_lrsj");
	if (xz_ggbgl_lrsj!=null)
	{
		xz_ggbgl_lrsj=xz_ggbgl_lrsj.trim();
		if (!(xz_ggbgl_lrsj.equals("")))	wheresql+="  and (xz_ggbgl.lrsj>=TO_DATE('"+xz_ggbgl_lrsj+"','YYYY/MM/DD'))";
	}
	xz_ggbgl_lrsj=request.getParameter("xz_ggbgl_lrsj2");
	if (xz_ggbgl_lrsj!=null)
	{
		xz_ggbgl_lrsj=xz_ggbgl_lrsj.trim();
		if (!(xz_ggbgl_lrsj.equals("")))	wheresql+="  and (xz_ggbgl.lrsj<=TO_DATE('"+xz_ggbgl_lrsj+"','YYYY/MM/DD'))";
	}
	if (yhjs.equals("A0"))
	{
		ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,'<A HREF=\"/xz/ggbgl/file/'||xz_ggbgl.fj||'\" target=\"_blank\">'||xz_ggbgl.fj||'</A>',xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
		ls_sql+=" FROM sq_dwxx,xz_ggbgl  ";
		ls_sql+=" where xz_ggbgl.fbbm=sq_dwxx.dwbh";
		ls_sql+=wheresql;
		ls_sql+=" order by xz_ggbgl.fbsj desc,xz_ggbgl.ggbh";
	}
	else
	{
		ls_sql="SELECT xz_ggbgl.ggbh,xz_ggbgl.ggmc,'<A HREF=\"/xz/ggbgl/file/'||xz_ggbgl.fj||'\" target=\"_blank\">'||xz_ggbgl.fj||'</A>',xz_ggbgl.fbsj,xz_ggbgl.fbr,dwmc";
		ls_sql+=" FROM sq_dwxx,xz_ggbgl,xz_ggdx  ";
		ls_sql+=" where xz_ggbgl.fbbm=sq_dwxx.dwbh and xz_ggdx.ggbh=xz_ggbgl.ggbh and xz_ggdx.yhdlm='"+yhdlm+"'";
		ls_sql+=wheresql;
		ls_sql+=" order by xz_ggbgl.fbsj desc,xz_ggbgl.ggbh";
	}
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_ggbglCxList.jsp","","","");
	pageObj.setViewBolt("");
	pageObj.setPageRow(60);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ggbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXz_ggbgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�鿴�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="11%">������</td>
	<td  width="39%">����</td>
	<td  width="20%">����</td>
	<td  width="10%">����ʱ��</td>
	<td  width="7%">������</td>
	<td  width="13%">��������</td>
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