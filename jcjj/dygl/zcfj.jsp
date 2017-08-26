<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String yhjs=(String)session.getAttribute("yhjs");

String ddbh=request.getParameter("ddbh");
String bzdh="";
String sgd="";

String khxm=null;
String cxhdbm=null;
String sjs="";
String dwmc="";
String sgbz=null;
String hth=null;
String jc_mmydd_jhazsj=null;
String qhtsj=null;
String lxfs=null;
String fwdz=null;

String fgsbh=null;
String xmzy=null;
String xmzydh=null;
String bz=null;
String ppbm=null;
String clzt=null;
String tdsj=null;
String clgw=null;
String bjjbmc=null;
String sxhtshr=null;
String khbh=null;
String sxhtsfysh=null;
String zjxxh=null;

	String sgdmc="";
	String sgddh="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double hkze=0;
double wdzje=0;
double zczkl=0;
double zqzjhze=0;
double zjhze=0;
try {
	conn=cf.getConnection();
	ls_sql="select jc_zcdd.zjxxh,jc_zcdd.khbh,jc_zcdd.clgw,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.tdsj,jc_zcdd.clzt,jc_zcdd.ppbm,jc_zcdd.bz,crm_khxx.fgsbh,jc_zcdd.xmzy,crm_khxx.khxm,cxhdbm,qhtsj,dwmc,sjs,crm_khxx.sgd,sgbz,jc_zcdd.htshsj,crm_khxx.hth,jc_zcdd.zczkl,jc_zcdd.wdzje,jc_zcdd.hkze,sgdmc,sq_sgd.dh,fwdz,sgbz,lxfs,sxhtshr,sxhtsfysh";
	ls_sql+=" from  jc_zcdd,crm_khxx,sq_sgd,sq_dwxx";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) and  jc_zcdd.ddbh='"+ddbh+"'";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";

	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ppbm=cf.fillHtml(rs.getString("ppbm"));
		bz=cf.fillHtml(rs.getString("bz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillHtml(rs.getString("xmzy"));
		khxm=cf.fillNull(rs.getString("khxm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		zczkl=rs.getDouble("zczkl");
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("htshsj"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sxhtshr=cf.fillNull(rs.getString("sxhtshr"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
	 }
	 rs.close();
	 ps.close();
	 
	 if (sxhtsfysh!=null && sxhtsfysh.equals("N"))//M������д��ͬ��Y������ˣ�N��δ���
	{
		
//			out.println("������д��ͬδ��ˣ����ܴ�ӡ");
//			return;
	
	}

	ls_sql="select bjjbmc,sgdmc,'('||sq_sgd.dh||')' dh";
	ls_sql+=" from  crm_zxkhxx,bdm_bjjbbm,sq_sgd";
	ls_sql+=" where crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  crm_zxkhxx.khbh='"+khbh+"'";
	ls_sql+=" and  crm_zxkhxx.sgd=sq_sgd.sgd(+)";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgddh=cf.fillNull(rs.getString("dh"));
	 }
	 rs.close();
	 ps.close();

	if (clzt.equals("99"))
	{
		hkze=-1*(hkze+zjhze);
		wdzje=-1*(wdzje+zqzjhze);
	}
	else
	{
		double zcfk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='23' and gysbh='"+ppbm+"'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
		ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zcfk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if ( zcfk < (hkze-11))
		{
			out.println("���ѣ����������δ��ˣ����ܴ�ӡ��");
			out.println("<BR>ʵ�����"+zcfk);
			out.println("<BR>��������"+cf.formatDouble(hkze)+"��Ӧ���������"+cf.formatDouble(hkze-zcfk));
//			return ;
		}

		if (!zjxxh.equals(""))
		{
			String getddbh="";
			double gethkze=0;
			ls_sql="select ddbh,hkze";
			ls_sql+=" from jc_zcdd ";
			ls_sql+=" where khbh='"+khbh+"' and zjxxh='"+zjxxh+"' and ddlx='5' and ppbm='���ı��'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getddbh=rs.getString(1);
				gethkze=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where ddbh='"+getddbh+"' and scbz='N' and fklxbm='23'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
			ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zcfk=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			if ( zcfk < (gethkze-11))
			{
				out.println("���ѣ����������δ��ˣ����ܴ�ӡ������[�ռ��ɿ�]����ȡ[���ı����]");
				out.println("<BR>ʵ�����"+zcfk);
				out.println("<BR>��������"+cf.formatDouble(gethkze)+"��Ӧ���������"+cf.formatDouble(gethkze-zcfk));
				return ;
			}
		}
	}

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select bgdh from sq_yhxx";
	ls_sql+=" where yhmc='"+xmzy+"' and ssfgs ='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmzydh=cf.fillHtml(rs.getString("bgdh"));
	}
	rs.close();
	ps.close();

	if (yhjs.equals("G0"))
	{
		sjs="&nbsp;";
	}

%>

<html>
<head>
<title>���ĸ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="24%"><span lang=EN-US><img src="../../images/tubiao111.jpg" v:shapes="_x0000_i1025"></span> </td>
<%
	if (clzt.equals("99"))
	 {
		%>
		<td colspan="3"><strong>(<%=ppbm%>)���ĺ�ͬ����---�����˻���ϸ��<b>������ţ�<%=ddbh%></b>��</strong></td>
		<%
	 }
	 else{
		%>
		<td colspan="3"><strong>(<%=ppbm%>)���ĺ�ͬ����---���Ķ�����ϸ��<b>������ţ�<%=ddbh%></b>��</strong></td>
		<%
	 }
%>
  </tr>
  <tr> 
    <td height="20" align="right" colspan="2"> 
      <div align="left">�ͻ�������<b><%=khxm%></b></div>    </td>
    <td width="33%" align="right" height="20"> 
      <div align="left">��ϵ��ʽ��<b><%=lxfs%></b></div>    </td>
    <td width="34%" align="right" height="20"> 
      <div align="left">��ͬ�ţ�<b><%=hth%></b></div>    </td>
  </tr>
  <tr> 
    <td colspan="3">��ַ��<b><%=fwdz%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼ����/��װ���ʦ��<b><%=dwmc%>/<%=sjs%></b>
	<td width="34%" align="right" height="20"> 
      <div align="left"> ����ˣ�<b><%=sxhtshr%></b></div>    </td></td>
  </tr>
  <tr> 
    <td colspan="4">ʩ���ӣ�<b><%=sgdmc%><%=sgddh%></b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
<%
	 if (clzt.equals("99"))
	 {
		%>
		�˵�ʱ�䣺<b><%=tdsj%></b>
		<%
	 }
	 else{
		%>
		��ͬ�ͻ����ڣ�<b><%=jc_mmydd_jhazsj%></b>
		<%
	 }

%>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	���Ϲ��ʣ�<b><%=clgw%></b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	���ۼ���<b><%=bjjbmc%></b>

</td>
  </tr>
  <tr>
    <td colspan="4">
	</td>
  </tr>
</table> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="18%">���ƣ�ϵ��</td>
	<td  width="14%">�ͺ�</td>
	<td  width="14%">���</td>

	<td  width="12%">����λ�ã���ɫ</td>
	<td  width="7%">����</td>
	<td  width="6%">����</td>

	<td  width="7%">���Ϸ�</td>
	<td  width="8%">Զ�̷�+����</td>
	<td  width="17%">��ע</td>
</tr>
<%

	if (clzt.equals("99"))
	{
		ls_sql ="SELECT zcmc||'��'||zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm||'��'||jc_zcddmx.zcysbm,jc_zcddmx.dj||'/'||jldwbm,-1*jc_zcddmx.zjhsl,-1*jc_zcddmx.zjhje,DECODE(zjhycf+zjhqtfy,0,'0',DECODE(zjhycf,0,'',zjhycf||'+')||DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')||zjhqtfy),jc_zcddmx.bz  ";
		ls_sql+=" FROM jc_zcddmx";
		ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"'";
	}
	else{
		ls_sql ="SELECT zcmc||'��'||zclbbm,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm||'��'||jc_zcddmx.zcysbm,jc_zcddmx.dj||'/'||jldwbm,jc_zcddmx.sl,jc_zcddmx.je,DECODE(ycf+qtfyje,0,'0',DECODE(ycf,0,'',ycf||'+')||DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�')||qtfyje),jc_zcddmx.bz  ";
		ls_sql+=" FROM jc_zcddmx";
		ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"' and lx='1'";
	}
    ls_sql+=" order by jc_zcddmx.zcdlbm,jc_zcddmx.dwbh,jc_zcddmx.zclbbm,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
%> 

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 16px'>
  <tr valign="top"> 
    <td height="60"><b>��ע��</b><%=bz%></td>
  </tr>
</table>
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="34%" height="2"><b>�ۼƽ�<%=hkze%>Ԫ��Сд��</b></td>
    <td width="37%" height="2"><b>����д����<%=cf.NumToRMBStr(hkze)%></b></td>
    <td width="29%" height="2"><b>ʵ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ԫ��Сд��</b></td>
  </tr>
  
  <tr> 
    <td colspan="3"> 
      <p><b></b></p>    </td>
  </tr>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">�ͻ�ǩ�֣�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
          <td width="544">���ʦǩ�֣�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
        </tr>
        <tr> 
          <td colspan="2">���Ϲ���ǩ�֣�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
          <td width="544">�곤ǩ�֣�<U>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</U></td>
        </tr>
      </table>    </td>
</table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception:2 " + e);
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


