<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #3300FF}
-->
</style>
</head>
<%
String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

%>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="insertform" >
<center>���깤���㣭��������ϸ��</center>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="17%">���ݵ�ַ</td>
	<td  width="5%">ǩ������</td>
	<td  width="5%">�������</td>
	<td  width="7%">��ɻ���</td>
	<td  width="5%">�����</td>
	<td  width="7%">����ɽ��</td>
	<td  width="5%">��ɱ��� </td>
	<td  width="7%">��ɽ��</td>
	<td  width="5%">��������</td>
	<td  width="7%">ʵ�����</td>
	<td  width="22%">��ע</td>
</tr>

<%

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String fgsbh=null;
String dwbh=null;
String sjsbh=null;
String zjxm=null;
String zjlx=null;
String sjfw=null;
String sjfw2=null;
double xdsskbfb=0;
double tcze=0;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,sjsbh,zjxm,zjlx,sjfw,sjfw2,xdsskbfb,tcze ,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_zjjsjl";
	ls_sql+=" where jsjlh='"+jsjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zjlx=cf.fillNull(rs.getString("zjlx"));
		sjfw=cf.fillNull(rs.getDate("sjfw"));
		sjfw2=cf.fillNull(rs.getDate("sjfw2"));
		xdsskbfb=rs.getDouble("xdsskbfb");
		tcze=rs.getDouble("tcze");

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String sgdmc=null;
	String sjs=null;
	String qyrq=null;
	double qye=0;
	double sfke=0;
	String ysgcjdmc=null;
	String zjjsbz=null;

	String qdlx=null;
	String tclx=null;
	double sjfksbl=0;
	double tcjs=0;
	double ytcbl=0;
	double ytcje=0;
	double bctcbl=0;
	double bctcje=0;
	double zjqtfy=0;
	double sjtcje=0;
	String tcbz=null;

	double alltcjs=0;
	double allytcje=0;
	double allbctcje=0;
	double allzjqtfy=0;
	double allsjtcje=0;

	String bgcolor="#E8E8FF";

	int row=0;
	int row1=0;

	ls_sql="SELECT cw_zjjsmx.khbh,hth,khxm,fwdz,sgdmc,sjs,qyrq,qye,sfke,ysgcjdmc,DECODE(crm_khxx.zjjsbz,'0','δ����','1','�ѽ���') zjjsbz";
	ls_sql+=" ,DECODE(cw_zjjsmx.qdlx,'1','��װ','3','��װ') qdlx,DECODE(cw_zjjsmx.tclx,'2','�깤���') tclx, sjfksbl,tcjs,ytcbl,ytcje,bctcbl,bctcje,zjqtfy,sjtcje,cw_zjjsmx.bz ";
	ls_sql+=" FROM cw_zjjsmx,crm_khxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where cw_zjjsmx.khbh=crm_khxx.khbh and cw_zjjsmx.jsjlh='"+jsjlh+"'";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
//	ls_sql+=" and cw_zjjsmx.tclx='2'";//1��ǩ����ɣ�2���깤��ɣ�3����ƿͻ���4���˵�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		qye=rs.getDouble("qye");
		sfke=rs.getDouble("sfke");
		ysgcjdmc=rs.getString("ysgcjdmc");
		zjjsbz=rs.getString("zjjsbz");

		qdlx=rs.getString("qdlx");
		tclx=rs.getString("tclx");
		sjfksbl=rs.getDouble("sjfksbl");
		tcjs=rs.getDouble("tcjs");
		ytcbl=rs.getDouble("ytcbl");
		bctcbl=rs.getDouble("bctcbl");
		bctcje=rs.getDouble("bctcje");
		zjqtfy=rs.getDouble("zjqtfy");
		sjtcje=rs.getDouble("sjtcje");
		tcbz=cf.fillHtml(rs.getString("bz"));

		alltcjs+=tcjs;
		allytcje+=ytcje;
		allbctcje+=bctcje;
		allzjqtfy+=zjqtfy;
		allsjtcje+=sjtcje;

		alltcjs=cf.doubleTrim(alltcjs);
		allytcje=cf.doubleTrim(allytcje);
		allbctcje=cf.doubleTrim(allbctcje);
		allzjqtfy=cf.doubleTrim(allzjqtfy);
		allsjtcje=cf.doubleTrim(allsjtcje);

		row++;
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A HREF="Editcw_zjjsmx.jsp?jsjlh=<%=jsjlh%>&khbh=<%=khbh%>" target="_blank">�ۿ�</A></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=qdlx%></td>
			<td><%=tclx%></td>
			<td><%=tcjs%></td>
			<td><%=ytcbl%>%</td>
			<td><%=ytcje%></td>
			<td><%=bctcbl%>%</td>
			<td><%=bctcje%></td>
			<td><%=zjqtfy%></td>
			<td><%=sjtcje%></td>
			<td><%=tcbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();



%>
	<tr bgcolor="#CCCCCC"  align="center">
		<td>�ϼ�</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=alltcjs%></td>
		<td>&nbsp;</td>
		<td><%=allytcje%></td>
		<td>&nbsp;</td>
		<td><%=allbctcje%></td>
		<td><%=allzjqtfy%></td>
		<td><%=allsjtcje%></td>
		<td>&nbsp;</td>
	</tr>
</table>



<DIV align="center">�ʼ���㣨�����¼�ţ�<%=jsjlh%>��</DIV>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">�ֹ�˾</td>
      <td width="30%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>
      </td>
      <td width="22%" align="right">&nbsp;</td>
      <td width="30%">&nbsp; 
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">�ʼ�</td>
      <td width="30%"> 
        <input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" readonly>
      <td align="right" width="22%">�ʼ�����</td>
      <td width="30%"> 
        <select name="zjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectToken(out,"1+���μ���&2+����",zjlx,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ʱ�䷶Χ ��</td>
      <td width="30%"> 
        <input type="text" name="sjfw" size="20" maxlength="10"  value="<%=sjfw%>" readonly>
      </td>
      <td align="right" width="22%">ʱ�䷶Χ ��</td>
      <td width="30%"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=sjfw2%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="30%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="22%">¼��ʱ��</td>
      <td width="30%"> 
        <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">¼�벿�� </td>
      <td width="30%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>
      </td>
      <td width="22%" align="right"><font color="#0000CC">����ܶ�</font></td>
      <td width="30%"><%=tcze%>��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right">��ע</div>
      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="jsjlh" value="<%=jsjlh%>" >
        <input type="button"  value="�޸ı�ע" onClick="f_do(insertform)" >
        <input type="button"  value="��ɽ���" onClick="f_tlsbl(insertform)">
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
  </table>
</form>



</body>
</html>



<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="SaveEditCw_zjjsjl.jsp";
	FormName.submit();
	return true;
}


function f_tlsbl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
		FormName.jsjlh.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="EndCw_zjjsjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
