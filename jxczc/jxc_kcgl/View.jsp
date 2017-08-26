<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String clbm="";
String dqbm="";
String gysmc="";
String lsj="";
String xsj="";
String cxhdbl="";
String myqjf="";
String sfycx="";
String cxkssj="";
String cxjzsj="";
String cxj="";
String lscxhdbl="";
String cxmyqjf="";
String xsfs="";
double zcpzsl=0;
String dhsl="";
String ycgsl="";
String whereclbm="";
String wheredqbm="";
String clmc="";
String xh="";
String gg="";
String zp="";
String scsmc=""; 
String ppmc="";
String cldlbm=""; 
String clxlbm="";
String ccpzsl="";
String bfpzsl="";
String wheresql="";
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
if (whereclbm!=null && !(whereclbm.equals("")))
{
//	whereclbm=cf.addZero(whereclbm,13);
	wheresql+=" and jxc_clbm.nbbm='"+whereclbm+"' ";
}
wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
if (wheredqbm!=null && !(wheredqbm.equals("")))
{wheresql+=" and jxc_cljgb.dqbm='"+wheredqbm+"' ";}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	ls_sql="select jxc_cljgb.clbm clbm,dqmc dqbm,jxc_kcb.gysmc gysmc,lsj,xsj,cxhdbl,myqjf,DECODE(sfycx,'N','��','Y','��') sfycx,cxkssj,cxjzsj,cxj,lscxhdbl,cxmyqjf,DECODE(xsfs,'1','����Ʒ','2','�ֻ�����','3','����޻�������') xsfs,zcpzsl,dhsl,ycgsl,jxc_clbm.clmc clmc,jxc_clbm.xh xh,jxc_clbm.gg gg,'<img src=\"/jxc/jxc_clbm/clzp/'||jxc_kcb.zp||'\" width=\"100px\" height=\"100px\">' zp,jxc_clbm.scsmc scsmc,jxc_clbm.ppmc ppmc,jxc_clbm.cldlbm cldlbm,jxc_clbm.clxlbm clxlbm,ccpzsl,bfpzsl ";
	ls_sql+=" from  jxc_cljgb,dm_dqbm,jxc_kcb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_kcb.clbm and jxc_cljgb.dqbm=dm_dqbm.dqbm and jxc_clbm.clbm=jxc_cljgb.clbm "; 
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ccpzsl=cf.fillNull(rs.getString("ccpzsl"));
		bfpzsl=cf.fillNull(rs.getString("bfpzsl"));
		clbm=cf.fillNull(rs.getString("clbm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		myqjf=cf.fillNull(rs.getString("myqjf"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cxj=cf.fillNull(rs.getString("cxj"));
		lscxhdbl=cf.fillNull(rs.getString("lscxhdbl"));
		cxmyqjf=cf.fillNull(rs.getString("cxmyqjf"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		zcpzsl=rs.getDouble("zcpzsl");
		dhsl=cf.fillNull(rs.getString("dhsl"));
		ycgsl=cf.fillNull(rs.getString("ycgsl"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zp=cf.fillNull(rs.getString("zp"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
	}
	else 
	{
		if (whereclbm!=null && !(whereclbm.equals("")))
		{
			%>
		<SCRIPT language=javascript >
		<!--
//		alert("û���ڿ�����ҵ���Ӧ���ݣ�");
		window.location.href="View2.jsp?dqbm=<%=wheredqbm%>&clbm=<%=whereclbm%>";
		window.close();
		//-->
		</SCRIPT>
		<%
		}
	}
//	out.print(ls_sql);
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> ������Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">���ϱ���</td>
  <td bgcolor="#FFFFCC"><%=clbm%></td>
  <td width="15%" rowspan="4" align="right">��Ƭ</td>
  <td width="35%" rowspan="4"><%=zp%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">��������</td>
  <td><%=clmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">��Ӧ�� </td>
  <td><%=gysmc%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td width="15%" align="right"><font color="red">���ۼ�</font></td>
  <td width="35%"><%=xsj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#99CCFF">���ϴ���</td>
  <td width="35%" bgcolor="#99CCFF"><%=cldlbm%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">����С��</td>
  <td width="35%" bgcolor="#99CCFF"><%=clxlbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%" bgcolor="#99CCFF"> 
    Ʒ��</td>
  <td width="35%" bgcolor="#99CCFF"><%=scsmc%></td>
  <td width="15%" align="right" bgcolor="#99CCFF">��Ʒ��</td>
  <td width="35%" bgcolor="#99CCFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99CCFF">�ͺ�</td>
  <td bgcolor="#99CCFF"><%=xh%></td>
  <td align="right" bgcolor="#99CCFF">���</td>
  <td bgcolor="#99CCFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF">�������� </td>
  <td width="35%" bgcolor="#9999FF"><%=dqbm%></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color=green>����Ʒ������</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=green><%=zcpzsl%></font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#9999FF"><font color=blue>�д�Ʒ������</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=blue><%=ccpzsl%></font></td>
  <td width="15%" align="right" bgcolor="#9999FF"><font color=red>����Ʒ������</font> </td>
  <td width="35%" bgcolor="#9999FF"><font color=red><%=bfpzsl%></font> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">�г����</td>
  <td width="35%" bgcolor="#CCFFCC"><%=lsj%></td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    ��������  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxhdbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    ÿԪǮ����  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=myqjf%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    �Ƿ��д���  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=sfycx%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    ������ʼʱ��  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxkssj%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    ��������ʱ��  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxjzsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    <font color="red">������</font>  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxj%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    �����ڼ�������  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=lscxhdbl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    ������ÿԪǮ����  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=cxmyqjf%>  </td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    ���۷�ʽ  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=xsfs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">�Ѳɹ�����</td>
  <td width="35%" bgcolor="#CCFFCC"><%=ycgsl%></td>
  <td width="15%" align="right" bgcolor="#CCFFCC"> 
    �ͻ���������  </td>
  <td width="35%" bgcolor="#CCFFCC"> 
    <%=dhsl%>  </td>
</tr>
</table>
</body>
</html>
<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql2=null;
	String wheresql2=" and clbm= '"+clbm+"' and jxc_kcb.dqbm='"+wheredqbm+"' ";
	ls_sql2="SELECT dqmc,ckmc,hjmc,hwmc,jxc_kcb.clbm clbm,jxc_kcb.clmc clmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jxc_kcb.xh xh,jxc_kcb.nbbm nbbm,'' zp,SUM(jxc_kcb.kcsl) ";
	ls_sql2+=" FROM jxc_kcb,dm_dqbm,jxc_ckmc,jxc_hjmc,jxc_hwmc  ";
    ls_sql2+=" where jxc_kcb.dqbm=dm_dqbm.dqbm and jxc_kcb.ckbh=jxc_ckmc.ckbh and jxc_kcb.hjbh=jxc_hjmc.hjbh and jxc_kcb.hwbh=jxc_hwmc.hwbh ";
    ls_sql2+=wheresql2;
	ls_sql2+=" group by dqmc,ckmc,hjmc,hwmc,jxc_kcb.clbm,jxc_kcb.clmc,DECODE(zljb,'1','<font color=green>����Ʒ</font>','2','<font color=blue>�д�Ʒ</font>','3','<font color=red>����Ʒ</font>'),jxc_kcb.xh,jxc_kcb.nbbm,'' ";
	ls_sql2+=" order by dqmc,ckmc,hjmc,hwmc,jxc_kcb.clmc ";
//	out.print(ls_sql2);

    pageObj.sql=ls_sql2;
//���ж����ʼ��
	pageObj.initPage("","","","");
//	pageObj.setPageRow(Integer.parseInt(myxssl));
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"lsh","jxc_kcb_clmc","jxc_kcb_cllb","jxc_kcb_cldlbm","jxc_kcb_clxlbm","jxc_kcb_scsmc","jxc_kcb_ppmc","jxc_kcb_cllbbm","jxc_kcb_xh","jxc_kcb_gg","jxc_kcb_clysbm","jxc_kcb_jldwbm","jxc_kcb_hwbh","jxc_kcb_pjts","jxc_kcb_sfyh","jxc_kcb_cpjb","jxc_kcb_fgsx","jxc_kcb_cpsm","jxc_kcb_cd","jxc_kcb_zp","jxc_kcb_cgzq","jxc_kcb_bz","jxc_kcb_clbm","jxc_kcb_hjbh","jxc_kcb_ckbh","jxc_kcb_dqbm","jxc_kcb_rkj","jxc_kcb_kcsl","jxc_kcb_kcje"};
	pageObj.setDisColName(disColName);
*/

//��������
//	String[] keyName={"clbm"};
//	pageObj.setKey(keyName);
	//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("ckmc","1");//�в����������Hash��
	spanColHash.put("hjmc","1");//�в����������Hash��
	spanColHash.put("hwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
<br>&nbsp;
<CENTER >
  ������
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">���ڵ���</td>
	<td  width="5%">���ڲֿ�</td>
	<td  width="5%">���ڻ���</td>
	<td  width="5%">���ڻ�λ</td>
	<td  width="2%">���ϱ���</td>
	<td  width="5%">��������</td>
	<td  width="5%">��������</td>
	<td  width="3%">�ͺ�</td>
	<td  width="3%">�ڲ�����</td>
	<td  width="1%">��Ƭ</td>
	<td  width="2%">�������</td>
	
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