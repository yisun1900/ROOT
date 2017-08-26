<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_khxx_khxm=null;
String crm_khxx_hth=null;
String crm_khxx_lxfs=null;
String crm_khxx_qye=null;

String sq_dwxx_dwmc=null;
String crm_khxx_kgrq=null;
String crm_khxx_jgrq=null;
double crm_khxx_zkl=0;
String crm_khxx_yhyy=null;
String crm_khxx_fwdz=null;
String crm_khxx_zjxm=null;
String crm_khxx_sjs=null;
String crm_khxx_czbm=null;
String crm_khxx_ysbm=null;
String crm_khxx_sgd=null;
String crm_khxx_qyrq=null;
String crm_khxx_hxbm=null;
String jyjdrq=null;
String crm_khxx_csrq=null;
String crm_khxx_zybm=null;
String crm_khxx_fj=null;
String crm_khxx_fwmj=null;
String sgbz=null;
String bzdh="";

String zgsmc="";

String wherecrm_khxx_khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
Statement stmt1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	stmt = conn.createStatement();

	ls_sql="select khxm,sgbz,hth,lxfs,qye,dwmc,kgrq,jgrq,zkl,yhyy,fwdz,zjxm,sjs,czbm,ysbm,sgd,qyrq,hxbm,jyjdrq,csrq,zybm,fj,fwmj";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+wherecrm_khxx_khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		crm_khxx_khxm=cf.fillHtml(rs.getString("khxm"));
		crm_khxx_hth=cf.fillHtml(rs.getString("hth"));
		crm_khxx_lxfs=cf.fillHtml(rs.getString("lxfs"));
		crm_khxx_qye=cf.fillHtml(rs.getString("qye"));
		sq_dwxx_dwmc=cf.fillHtml(rs.getString("dwmc"));
		crm_khxx_kgrq=cf.fillHtml(rs.getDate("kgrq"));
		crm_khxx_jgrq=cf.fillHtml(rs.getDate("jgrq"));
		crm_khxx_zkl=rs.getDouble("zkl");
		crm_khxx_yhyy=cf.fillHtml(rs.getString("yhyy"));
		crm_khxx_fwdz=cf.fillHtml(rs.getString("fwdz"));
		crm_khxx_zjxm=cf.fillHtml(rs.getString("zjxm"));
		crm_khxx_sjs=cf.fillHtml(rs.getString("sjs"));


		crm_khxx_czbm=cf.fillHtml(rs.getString("czbm"));
		crm_khxx_ysbm=cf.fillHtml(rs.getString("ysbm"));
		crm_khxx_sgd=cf.fillHtml(rs.getString("sgd"));
		crm_khxx_qyrq=cf.fillHtml(rs.getDate("qyrq"));
		crm_khxx_hxbm=cf.fillHtml(rs.getString("hxbm"));
		jyjdrq=cf.fillHtml(rs.getDate("jyjdrq"));
		crm_khxx_csrq=cf.fillHtml(rs.getDate("csrq"));
		crm_khxx_zybm=cf.fillHtml(rs.getString("zybm"));
		crm_khxx_fj=cf.fillHtml(rs.getString("fj"));
		crm_khxx_fwmj=cf.fillHtml(rs.getString("fwmj"));

	}
	rs.close();
	
	//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"' and bzmc  ='"+sgbz+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

	ls_sql=" select csz from sq_xtcsb";
	ls_sql+=" where csbm='gsmc' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zgsmc=cf.fillNull(rs.getString("csz"));
	}
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>��ӡ�ɹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	font-weight: bold;
}
.style2 {
	font-size: 14px;
	font-weight: bold;
}
.style4 {font-size: 12px}
.table {
	border: 1px solid #000000;
	margin: 0px;
	padding: 0px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
  <table width="100%"  border="0">
    <tr> 
      <td colspan="2"> 
        <div align="center"><b><%=zgsmc%></b></div>
      </td>
      <td width="38%"> 
        <div align="center" class="style1">�� �� ��</div>
      </td>
      <td colspan="2" width="31%"> 
        <div align="center"><span class="style4">��ţ�GC-7.5-01</span></div>
      </td>
    </tr>
    <tr> 
      <td colspan="5"> 
        <hr align="center" width="100%" size="1" noshade>
      </td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="5">
    <tr>
      <td width="86%"><div align="justify" class="style2">ǩ���ֲ��� <%=sq_dwxx_dwmc%></div></td>
      <td width="14%" class="style2">��������</td>
    </tr>
  </table>
  <br>
  <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#000000" class="table" style="FONT-SIZE:14">
    <tr class="style4">
      <td width="10%"><div align="center" class="style4">�ͻ�����</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_khxm%> </div></td>
      <td width="10%" class="style4"><div align="center">��ͬ���</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_hth%> </div></td>
      <td width="10%" class="style4"><div align="center" class="style4">��ϵ��ʽ</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_lxfs%> </div></td>
    </tr>
    <tr class="style4">
      <td width="10%"><div align="center" class="style4">���̱���</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_qye%> ��
        <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",crm_khxx_hxbm,true);
%>
          �������<%=crm_khxx_fwmj%>�� </div></td>
      <td width="10%" class="style4"><div align="center">��������</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_kgrq%>��<%=crm_khxx_jgrq%> </div></td>
      <td width="10%" class="style4"><div align="center" class="style4">�� &nbsp;&nbsp;&nbsp;��</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_zkl%>�ۣ�<%=crm_khxx_yhyy%>�� </div></td>
    </tr>
    <tr class="style4">
      <td width="10%"><div align="center" class="style4">ʩ����ַ</div></td>
      <td colspan="3"><div align="left"><%=crm_khxx_fwdz%></div></td>
      <td width="10%" class="style4"><div align="center" class="style4">��������</div></td>
      <td width="25%"><div align="left">
          <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",crm_khxx_czbm,true);
%>
          <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",crm_khxx_ysbm,true);
%> 
      </div></td>
    </tr>
    <tr class="style4">
      <td width="10%" class="style4"><div align="center">ʩ������</div></td>
      <td width="25%"><div align="left">
          <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> 
      </div></td>
      <td width="10%" class="style4"><div align="center">����Ѳ��</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_zjxm%> </div></td>
      <td width="10%" class="style4"><div align="center" class="style4">�� �� ʦ</div></td>
      <td width="25%"><div align="left"><%=crm_khxx_sjs%> </div></td>
    </tr>
  </table>
  <table width="100%"  border="0">
    <tr>
      <td><div align="right" class="style2"><span class="style2">ǩ�����ڣ�</span><%=crm_khxx_qyrq%></div></td>
    </tr>
    <tr>
      <td class="style4">ע���������ݼ������һ�ν��׵�����������ֳ����׵�����</td>
    </tr>
    <tr>
      <td><div align="right"><span class="style4">����ʱ�䣺<%=jyjdrq%></span>&nbsp;</div></td>
    </tr>
  </table>
    <div align="center">
    <table width="100%"  border="0">
      <tr>
        <td width="100%"><hr align="center" width="100%" size="1" noshade></td>
      </tr>
    </table>
  </div>
  <div align="center">
    <table width="100%"  border="0">
      <tr> 
        <td colspan="2"> 
          <div align="center"><b><%=zgsmc%></b></div>
        </td>
        <td width="38%"> 
          <div align="center" class="style1">�� �� ��</div>
        </td>
        <td colspan="2" width="31%"> 
          <div align="center"><span class="style4">��ţ�GC-7.5-01</span></div>
        </td>
      </tr>
    </table>
    <table width="100%"  border="0" cellspacing="5">
      <tr>
        <td width="86%"><div align="justify" class="style2">ǩ���ֲ��� <%=sq_dwxx_dwmc%></div></td>
        <td width="14%" class="style2">��������</td>
      </tr>
    </table>
    <br>
    <table width="100%"  border="1" cellpadding="5" cellspacing="0" bordercolor="#000000" class="table" style="FONT-SIZE:14">
      <tr class="style4">
        <td width="10%"><div align="center" class="style4">�ͻ�����</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_khxm%> </div></td>
        <td width="10%" class="style4"><div align="center">��ͬ���</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_hth%> </div></td>
        <td width="10%" class="style4"><div align="center" class="style4">��ϵ��ʽ</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_lxfs%> </div></td>
      </tr>
      <tr class="style4">
        <td width="10%"><div align="center" class="style4">���̱���</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_qye%>��
            <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",crm_khxx_hxbm,true);
%>
�������<%=crm_khxx_fwmj%>��</div></td>
        <td width="10%" class="style4"><div align="center">��������</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_kgrq%>�� <%=crm_khxx_jgrq%> </div></td>
        <td width="10%" class="style4"><div align="center" class="style4">�� &nbsp;&nbsp;&nbsp;��</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_zkl%>�ۣ�<%=crm_khxx_yhyy%>�� </div></td>
      </tr>
      <tr class="style4">
        <td width="10%"><div align="center" class="style4">ʩ����ַ</div></td>
        <td colspan="3"><div align="left"><%=crm_khxx_fwdz%> </div></td>
        <td width="10%" class="style4"><div align="center" class="style4">��������</div></td>
        <td width="25%"><div align="left">
            <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",crm_khxx_czbm,true);
%>
            <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",crm_khxx_ysbm,true);
%>
        </div></td>
      </tr>
      <tr class="style4">
        <td width="10%" class="style4"><div align="center">ʩ������</div></td>
        <td width="25%"><div align="left">
            <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>
        </div></td>
        <td width="10%" class="style4"><div align="center">����Ѳ��</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_zjxm%> </div></td>
        <td width="10%" class="style4"><div align="center" class="style4">�� �� ʦ</div></td>
        <td width="25%"><div align="left"><%=crm_khxx_sjs%> </div></td>
      </tr>
    </table>
    <table width="100%"  border="0">
      <tr>
        <td><div align="right" class="style2"><span class="style2">ǩ�����ڣ�</span><%=crm_khxx_qyrq%></div></td>
      </tr>
      <tr>
        <td class="style4">ע���������ݼ������һ�ν��׵�����������ֳ����׵�����</td>
      </tr>
    </table>
  </div>
  <br>
  <table width="100%"  border="0" cellpadding="5" cellspacing="0" bordercolor="#000000">
    <tr> 
      <td width="8%" class="style4" align="right"> �� &nbsp;&nbsp;&nbsp;��</td>
      <td width="24%">��<%=sgbz%></td>
      <td width="10%" class="style4" align="right">�� &nbsp;&nbsp;&nbsp;��</td>
      <td width="22%">��<%=bzdh%></td>
      <td width="10%" class="style4"></td>
      <td width="26%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="8%" class="style4" align="left"> 
        <div align="right">�� &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="24%"> 
        <div align="right"></div>
      </td>
      <td width="10%" class="style4"> 
        <div align="right">ľ &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="22%"> 
        <div align="right"></div>
      </td>
      <td width="10%" class="style4"> 
        <div align="right">ˮ &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="26%"> 
        <div align="right"></div>
      </td>
    </tr>
    <tr> 
      <td width="8%" class="style4"> 
        <div align="right">�� &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="24%"> 
        <div align="right"></div>
      </td>
      <td width="10%" class="style4"> 
        <div align="right">չ &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="22%"> 
        <div align="right"></div>
      </td>
      <td width="10%" class="style4"> 
        <div align="right">�� &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="26%"> 
        <div align="right"></div>
      </td>
    </tr>
    <tr> 
      <td width="8%" class="style4"> 
        <div align="right">�� &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="24%"> 
        <div align="right"></div>
      </td>
      <td width="10%" class="style4"> 
        <div align="right">�� &nbsp;&nbsp;&nbsp;��</div>
      </td>
      <td width="22%"> 
        <div align="right"></div>
      </td>
      <td width="10%" class="style4"> 
        <div align="right"></div>
      </td>
      <td width="26%"> 
        <div align="right"></div>
      </td>
    </tr>
  </table>
  <br>
  <table width="100%"  border="0" cellpadding="5" cellspacing="0">
    <tr>
      <td width="25%" class="style4">��������ʱ��</td>
      <td width="25%">&nbsp;</td>
      <td width="25%" class="style4">���ι�������ʱ��</td>
      <td width="25%">&nbsp;</td>
    </tr>
    <tr>
      <td width="25%" class="style4">��������ʱ��</td>
      <td width="25%">&nbsp;</td>
      <td width="25%" class="style4">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
  </table>
    <table width="100%"  border="0" cellpadding="5" cellspacing="0">
    <tr class="style4">
      <td width="25%" class="style4">�������ڣ�<%=crm_khxx_csrq%></td>
      <td width="25%">С�����ۣ�<%=crm_khxx_fj%></td>
      <td width="25%">�ͻ�ְҵ��
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",crm_khxx_zybm,true);
%></td>
      <td width="25%">�����<%=crm_khxx_fwmj%></td>
    </tr>
  </table>
  <br>
</div>
</body>
</html>
