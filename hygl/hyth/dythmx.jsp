<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObject" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ls_sql=null;
String wheresql=" WHERE (dm_thjl.plbm=xt_plbm.plbm(+)) and dm_thjl.thdw=sq_dwxx.dwbh(+)";
int curPage=0;
String pageStr=request.getParameter("curPage");
String thrq=null;
String thrq2=null;
String thdw=null;

if (pageStr!=null)//��x������
{
	//Ҫ����ʾ�ڼ�ҳ
	curPage=Integer.parseInt(pageStr);
}
else//��һ������,��Ҫ��ѯ
{
	curPage=1;
	String thjlh=null;
	String cpbm=null;
	String thj=null;
	String thyy=null;
	String thbz=null;
	String czy=null;
	String ywxh=null;
	String xsdw=null;
	String khbh=null;
	String shbz=null;
	String shr=null;
	String shrq=null;
	String sfjs=null;

	String bkbh=null;
	String plbm=null;
	String pmbm=null;
	String cplb=null;
	String jlzl=null;
	String zszl=null;
	String pszl=null;
	String lsj=null;
	String bqj=null;
	String sxj=null;
	String khlx=null;
	khlx=request.getParameter("khlx");
	if (khlx!=null)
	{
		if (!(khlx.equals("")))	wheresql+="  and (khlx='"+khlx+"')";
	}
	bkbh=request.getParameter("bkbh");
	if (bkbh!=null)
	{
		bkbh=cf.GB2Uni(bkbh);
		if (!(bkbh.equals("")))	wheresql+="  and (bkbh='"+bkbh+"')";
	}
	plbm=request.getParameter("plbm");
	if (plbm!=null)
	{
		plbm=cf.GB2Uni(plbm);
		if (!(plbm.equals("")))	wheresql+="  and (dm_thjl.plbm='"+plbm+"')";
	}
	pmbm=request.getParameter("pmbm");
	if (pmbm!=null)
	{
		pmbm=cf.GB2Uni(pmbm);
		if (!(pmbm.equals("")))	wheresql+="  and (pmbm='"+pmbm+"')";
	}
	cplb=request.getParameter("cplb");
	if (cplb!=null)
	{
		cplb=cf.GB2Uni(cplb);
		if (!(cplb.equals("")))	wheresql+="  and (cplb='"+cplb+"')";
	}

	jlzl=request.getParameter("jlzl");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl>="+jlzl+") ";
	}
	jlzl=request.getParameter("jlzl2");
	if (jlzl!=null)
	{
		jlzl=jlzl.trim();
		if (!(jlzl.equals("")))	wheresql+=" and  (jlzl<="+jlzl+") ";
	}
	zszl=request.getParameter("zszl");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl>="+zszl+") ";
	}
	zszl=request.getParameter("zszl2");
	if (zszl!=null)
	{
		zszl=zszl.trim();
		if (!(zszl.equals("")))	wheresql+=" and  (zszl<="+zszl+") ";
	}
	pszl=request.getParameter("pszl");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl>="+pszl+") ";
	}
	pszl=request.getParameter("pszl2");
	if (pszl!=null)
	{
		pszl=pszl.trim();
		if (!(pszl.equals("")))	wheresql+=" and  (pszl<="+pszl+") ";
	}
	lsj=request.getParameter("lsj");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj>="+lsj+") ";
	}
	lsj=request.getParameter("lsj2");
	if (lsj!=null)
	{
		lsj=lsj.trim();
		if (!(lsj.equals("")))	wheresql+=" and  (lsj<="+lsj+") ";
	}
	bqj=request.getParameter("bqj");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj>="+bqj+") ";
	}
	bqj=request.getParameter("bqj2");
	if (bqj!=null)
	{
		bqj=bqj.trim();
		if (!(bqj.equals("")))	wheresql+=" and  (bqj<="+bqj+") ";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj>="+sxj+") ";
	}
	sxj=request.getParameter("sxj2");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj<="+sxj+") ";
	}

	
	
	thrq=request.getParameter("thrq");
	if (thrq!=null)
	{
		if (!(thrq.equals("")))	wheresql+="  and dm_thjl.thrq>=TO_DATE('"+thrq+"','YYYY-MM-DD')";
	}
	thrq2=request.getParameter("thrq2");
	if (thrq2!=null)
	{
		if (!(thrq2.equals("")))	wheresql+="  and dm_thjl.thrq<=TO_DATE('"+thrq2+"','YYYY-MM-DD')";
	}
	thjlh=request.getParameter("thjlh");
	if (thjlh!=null)
	{
		thjlh=cf.GB2Uni(thjlh);
		if (!(thjlh.equals("")))	wheresql+="  and (thjlh='"+thjlh+"')";
	}
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+="  and (cpbm='"+cpbm+"')";
	}
	thdw=request.getParameter("thdw");
	if (thdw!=null)
	{
		thdw=cf.GB2Uni(thdw);
		if (!(thdw.equals("")))	wheresql+="  and (thdw='"+thdw+"')";
	}
	thj=request.getParameter("thj");
	if (thj!=null)
	{
		thj=thj.trim();
		if (!(thj.equals("")))	wheresql+=" and  (thj="+thj+") ";
	}
	thyy=request.getParameter("thyy");
	if (thyy!=null)
	{
		thyy=cf.GB2Uni(thyy);
		if (!(thyy.equals("")))	wheresql+=" and  (thyy='"+thyy+"')";
	}
	thbz=request.getParameter("thbz");
	if (thbz!=null)
	{
		thbz=cf.GB2Uni(thbz);
		if (!(thbz.equals("")))	wheresql+="  and (thbz='"+thbz+"')";
	}
	czy=request.getParameter("czy");
	if (czy!=null)
	{
		czy=cf.GB2Uni(czy);
		if (!(czy.equals("")))	wheresql+="  and (czy='"+czy+"')";
	}
	ywxh=request.getParameter("ywxh");
	if (ywxh!=null)
	{
		ywxh=cf.GB2Uni(ywxh);
		if (!(ywxh.equals("")))	wheresql+="  and (ywxh='"+ywxh+"')";
	}
	xsdw=request.getParameter("xsdw");
	if (xsdw!=null)
	{
		xsdw=cf.GB2Uni(xsdw);
		if (!(xsdw.equals("")))	wheresql+="  and (xsdw='"+xsdw+"')";
	}
	sxj=request.getParameter("sxj");
	if (sxj!=null)
	{
		sxj=sxj.trim();
		if (!(sxj.equals("")))	wheresql+=" and  (sxj="+sxj+") ";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+="  and (shbz='"+shbz+"')";
	}
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+="  and (shr='"+shr+"')";
	}
	shrq=request.getParameter("shrq");
	if (shrq!=null)
	{
		shrq=shrq.trim();
		if (!(shrq.equals("")))	wheresql+="  and (shrq=TO_DATE('"+shrq+"','YYYY/MM/DD'))";
	}
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=sfjs.trim();
		if (!(sfjs.equals("")))	wheresql+=" and (sfjs="+sfjs+") ";
	}

	ls_sql="SELECT thjlh,cpbm,dwmc,plmc,bqj,sxj,thj,DECODE(thbz,0,'�����˻�',1,'��껻��',2,'����˻�'),thrq,czy,DECODE(sfjs,0,'��',1,'��')  ";
	ls_sql+=" FROM dm_thjl,xt_plbm,sq_dwxx  ";
    ls_sql+=wheresql;
	ls_sql+=" order by thjlh ";
//	out.println(ls_sql);
    pageObject.sql=ls_sql;
//���ж����ʼ��
	pageObject.initPage("","","","");
	pageObject.setPageRow(20000);
/*
//������ʾ��
	String[] disColName={"thjlh","cpbm","thdw","thj","thbz","thrq","czy"};
	pageObject.setDisColName(disColName);
*/
	}
%>
<%
	String dwmc=null;

	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	try {
		conn=cf.getConnection();    //�õ�����
		
		ls_sql="select dwmc from sq_dwxx ";
		ls_sql+=" where dwbh='"+thdw+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			dwmc=rs.getString(1);
		}

		rs.close();
		ps.close();
	}
	catch (Exception e) {
		try{
			out.println("getDate.Exception: " + e);
			out.println("sql=" + ls_sql);
		}
		catch (Exception e1){}
	}
	finally 
	{
		try{
			if (rs != null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn != null) cf.close(conn);    //�ͷ�����
		}
		catch (Exception e){}
	}

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2"><%=dwmc%>�˻���ϸ</font></B>
  <BR>��<%=thrq%>--<%=thrq2%>��
</CENTER>
<%
	pageObject.out=out;
	pageObject.getDate(curPage);
	pageObject.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%" >�˻���¼��</td>
	<td  width="12%" >��Ʒ����</td>
	<td  width="15%" >�˻���λ</td>
	<td  width="15%" >Ʒ��</td>
	<td  width="6%" >��ǩ��</td>
	<td  width="6%" >ʵ����</td>
	<td  width="6%" >�˻���</td>
	<td  width="8%" >����˻�</td>
	<td  width="10%" >�˻�����</td>
	<td  width="6%" >����Ա</td>
	<td  width="6%" >����</td>
</tr>
<%
	pageObject.printDateSum();
	pageObject.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObject.printScript();
%> 
//-->
</script>
</html>