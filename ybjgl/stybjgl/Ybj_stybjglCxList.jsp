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
	String ybj_stybjgl_ybjbh=null;
	String ybj_stybjgl_lx=null;
	String ybj_stybjgl_clzt=null;
	String ybj_stybjgl_lrr=null;
	String ybj_stybjgl_lrsj=null;
	String ybj_stybjgl_ssfgs=null;
	ybj_stybjgl_ybjbh=request.getParameter("ybj_stybjgl_ybjbh");
	if (ybj_stybjgl_ybjbh!=null)
	{
		ybj_stybjgl_ybjbh=cf.GB2Uni(ybj_stybjgl_ybjbh);
		if (!(ybj_stybjgl_ybjbh.equals("")))	wheresql+=" and  (ybj_stybjgl.ybjbh='"+ybj_stybjgl_ybjbh+"')";
	}
	ybj_stybjgl_lx=request.getParameter("ybj_stybjgl_lx");
	if (ybj_stybjgl_lx!=null)
	{
		ybj_stybjgl_lx=cf.GB2Uni(ybj_stybjgl_lx);
		if (!(ybj_stybjgl_lx.equals("")))	wheresql+=" and  (ybj_stybjgl.lx='"+ybj_stybjgl_lx+"')";
	}
	ybj_stybjgl_clzt=request.getParameter("ybj_stybjgl_clzt");
	if (ybj_stybjgl_clzt!=null)
	{
		ybj_stybjgl_clzt=cf.GB2Uni(ybj_stybjgl_clzt);
		if (!(ybj_stybjgl_clzt.equals("")))	wheresql+=" and  (ybj_stybjgl.clzt='"+ybj_stybjgl_clzt+"')";
	}
	ybj_stybjgl_lrr=request.getParameter("ybj_stybjgl_lrr");
	if (ybj_stybjgl_lrr!=null)
	{
		ybj_stybjgl_lrr=cf.GB2Uni(ybj_stybjgl_lrr);
		if (!(ybj_stybjgl_lrr.equals("")))	wheresql+=" and  (ybj_stybjgl.lrr='"+ybj_stybjgl_lrr+"')";
	}
	ybj_stybjgl_lrsj=request.getParameter("ybj_stybjgl_lrsj");
	if (ybj_stybjgl_lrsj!=null)
	{
		ybj_stybjgl_lrsj=ybj_stybjgl_lrsj.trim();
		if (!(ybj_stybjgl_lrsj.equals("")))	wheresql+="  and (ybj_stybjgl.lrsj>=TO_DATE('"+ybj_stybjgl_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_stybjgl_lrsj=request.getParameter("ybj_stybjgl_lrsj2");
	if (ybj_stybjgl_lrsj!=null)
	{
		ybj_stybjgl_lrsj=ybj_stybjgl_lrsj.trim();
		if (!(ybj_stybjgl_lrsj.equals("")))	wheresql+="  and (ybj_stybjgl.lrsj<=TO_DATE('"+ybj_stybjgl_lrsj+"','YYYY/MM/DD'))";
	}
	ybj_stybjgl_ssfgs=request.getParameter("ybj_stybjgl_ssfgs");
	if (ybj_stybjgl_ssfgs!=null)
	{
		ybj_stybjgl_ssfgs=cf.GB2Uni(ybj_stybjgl_ssfgs);
		if (!(ybj_stybjgl_ssfgs.equals("")))	wheresql+=" and  (ybj_stybjgl.ssfgs='"+ybj_stybjgl_ssfgs+"')";
	}
	ls_sql="SELECT ybj_stybjgl.ybjbh,ybj_stybjgl.mj,ybj_stybjgl.fgms,ybj_stybjgl.zxzj, DECODE(ybj_stybjgl.lx,'1','�����','2','��������'), DECODE(ybj_stybjgl.clzt,'1','��ʹ��','2','����'),ybj_stybjgl.lrr,ybj_stybjgl.lrsj,ybj_stybjgl.lrbm,sq_dwxx.dwmc,ybj_stybjgl.bz  ";
	ls_sql+=" FROM sq_dwxx,ybj_stybjgl  ";
    ls_sql+=" where ybj_stybjgl.ssfgs=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by ybj_stybjgl.ybjbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Ybj_stybjglCxList.jsp","SelectCxYbj_stybjgl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ybjbh","ybj_stybjgl_mj","ybj_stybjgl_fgms","ybj_stybjgl_zxzj","ybj_stybjgl_lx","ybj_stybjgl_clzt","ybj_stybjgl_lrr","ybj_stybjgl_lrsj","ybj_stybjgl_lrbm","sq_dwxx_dwmc","ybj_stybjgl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ybjbh"};
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
  <B><font size="3">ʵ��������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�������</td>
	<td  width="5%">���</td>
	<td  width="33%">�������</td>
	<td  width="5%">װ�����</td>
	<td  width="4%">����</td>
	<td  width="4%">״̬</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="8%">¼�벿��</td>
	<td  width="7%">�����ֹ�˾</td>
	<td  width="20%">��ע</td>
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