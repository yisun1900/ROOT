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
	String xcmbm=null;
	String xcmlxbm=null;
	String bklxxh=null;
	String mbcl=null;
	String xbpz=null;
	String zsxt=null;
	String jjfs=null;
	String pmdj=null;
	String ymdj=null;
	String zpmc=null;
	String lrr=null;
	String lrsj=null;
	xcmbm=request.getParameter("xcmbm");
	if (xcmbm!=null)
	{
		xcmbm=cf.GB2Uni(xcmbm);
		if (!(xcmbm.equals("")))	wheresql+=" and  (jc_bgmbj.xcmbm='"+xcmbm+"')";
	}
	xcmlxbm=request.getParameter("xcmlxbm");
	if (xcmlxbm!=null)
	{
		xcmlxbm=cf.GB2Uni(xcmlxbm);
		if (!(xcmlxbm.equals("")))	wheresql+=" and  (jc_bgmbj.xcmlxbm='"+xcmlxbm+"')";
	}
	bklxxh=request.getParameter("bklxxh");
	if (bklxxh!=null)
	{
		bklxxh=cf.GB2Uni(bklxxh);
		if (!(bklxxh.equals("")))	wheresql+=" and  (jc_bgmbj.bklxxh='"+bklxxh+"')";
	}
	mbcl=request.getParameter("mbcl");
	if (mbcl!=null)
	{
		mbcl=cf.GB2Uni(mbcl);
		if (!(mbcl.equals("")))	wheresql+=" and  (jc_bgmbj.mbcl='"+mbcl+"')";
	}
	xbpz=request.getParameter("xbpz");
	if (xbpz!=null)
	{
		xbpz=cf.GB2Uni(xbpz);
		if (!(xbpz.equals("")))	wheresql+=" and  (jc_bgmbj.xbpz='"+xbpz+"')";
	}
	zsxt=request.getParameter("zsxt");
	if (zsxt!=null)
	{
		zsxt=cf.GB2Uni(zsxt);
		if (!(zsxt.equals("")))	wheresql+=" and  (jc_bgmbj.zsxt='"+zsxt+"')";
	}
	jjfs=request.getParameter("jjfs");
	if (jjfs!=null)
	{
		jjfs=cf.GB2Uni(jjfs);
		if (!(jjfs.equals("")))	wheresql+=" and  (jc_bgmbj.jjfs='"+jjfs+"')";
	}
	pmdj=request.getParameter("pmdj");
	if (pmdj!=null)
	{
		pmdj=pmdj.trim();
		if (!(pmdj.equals("")))	wheresql+=" and  (jc_bgmbj.pmdj="+pmdj+") ";
	}
	ymdj=request.getParameter("ymdj");
	if (ymdj!=null)
	{
		ymdj=ymdj.trim();
		if (!(ymdj.equals("")))	wheresql+=" and  (jc_bgmbj.ymdj="+ymdj+") ";
	}
	zpmc=request.getParameter("zpmc");
	if (zpmc!=null)
	{
		zpmc=cf.GB2Uni(zpmc);
		if (!(zpmc.equals("")))	wheresql+=" and  (jc_bgmbj.zpmc='"+zpmc+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jc_bgmbj.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jc_bgmbj.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (jc_bgmbj.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xcmbm,xcmlxmc,bklxxh,mbcl,xbpz,DECODE(jjfs,'1','ƽ�׵���','2','ƽ�׵���+������׵���') jjfs,pmdj,ymdj,'<IMG SRC=\"images/'||UPPER(jc_bgmbj.zpmc)||'\" width=100>' zpmc,zsxt,bz,lrr,lrsj  ";
	ls_sql+=" FROM jc_bgmbj,jdm_xcmlxbm  ";
    ls_sql+=" where jc_bgmbj.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xcmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_bgmbjCxList.jsp","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��

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
  <B><font size="3">�Ͳ��ű��ۣ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">�Ͳ��ű���</td>
	<td  width="4%">�Ͳ�������</td>
	<td align="left" width="9%">&nbsp;&nbsp;<strong>������</strong>���߿��ͺ�<BR>
	  &nbsp;&nbsp;<strong>����</strong>������<BR>
	  &nbsp;&nbsp;<strong>����</strong>������<BR>
	  &nbsp;&nbsp;<strong>�������</strong>������</td>
	<td align="left" width="11%">&nbsp;&nbsp;<strong>������</strong>������<BR>
	  &nbsp;&nbsp;<strong>����</strong>����ɫ<BR>
	  &nbsp;&nbsp;<strong>����</strong>����ɫ<BR>
	  &nbsp;&nbsp;<strong>�������</strong>������</td>
	<td  width="9%">о������</td>
	<td  width="5%">�Ƽ۷�ʽ</td>
	<td  width="4%">ƽ�׵���</td>
	<td  width="4%">���׵���</td>
	<td  width="8%">��Ƭ����</td>
	<td  width="11%">װ������</td>
	<td  width="23%">��ע</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
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