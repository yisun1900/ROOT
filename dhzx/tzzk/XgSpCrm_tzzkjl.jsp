<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String tzyy=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;

double rfmll=0;
double zcmll=0;
double tzhmll=0;
String spr=null;
String spsj=null;
String spsm=null;

String zklx=null;
double zdzk=10;
double gcfqdzk=10;
double glfzk=10;
double sjzk=10;
double sjfzk=10;
double qtsfxmzk=10;
String zjxzklx=null;

double gczjxfzk=10;
double glfzjxzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;
double qtsfxmzjxzk=10;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

double hdzsjz=0;
double djjje=0;
double djjbfb=0;

String ssfgs=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String khjl=null;
String dmjl="";
String dmjldh="";

String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;


String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,tzyy,clzt,lrr,lrsj,dwmc,zklx,zdzk,gcfqdzk,glfzk,sjzk,sjfzk,qtsfxmzk,zjxzklx,tzhmll,rfmll,zcmll,spr,spsj,spsm ";
	ls_sql+=" ,hdzsjz,djjje,djjbfb";
	ls_sql+=" from  crm_tzzkjl,sq_dwxx";
	ls_sql+=" where crm_tzzkjl.lrbm=sq_dwxx.dwbh and  (tzjlh='"+tzjlh+"') ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		tzyy=cf.fillNull(rs.getString("tzyy"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));

		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));

		tzhmll=rs.getDouble("tzhmll");
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spsm=cf.fillNull(rs.getString("spsm"));

		hdzsjz=rs.getDouble("hdzsjz");
		djjje=rs.getDouble("djjje");
		djjbfb=rs.getDouble("djjbfb");
	}
	rs.close();
	ps.close();


	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk";
	ls_sql+=" from  crm_tzbffyzk";
	ls_sql+=" where  (tzjlh='"+tzjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
	ls_sql+=" from crm_tzzjxzk";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
		qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
	}
	rs.close();
	ps.close();

	String ysshbz="";
	ls_sql="select cxhdbm,cxhdbmxq,cxhdbmzh,khjl,crm_zxkhxx.ssfgs,khxm,fwdz,hth,sjs,crm_zxkhxx.zxdm,dwmc,ysshbz";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		khjl=cf.fillNull(rs.getString("khjl"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));//�Ƿ�����Ԥ�����  N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
	}
	rs.close();
	ps.close();

	String kzdzfs="";
	double zdmll=0;
	double zdzkl=0;
	ls_sql="SELECT kzdzfs,zkl,zdmll";
	ls_sql+=" FROM sq_yhxx";
    ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kzdzfs=cf.fillNull(rs.getString("kzdzfs"));
		zdzkl=rs.getDouble("zkl");//����ۿ�
		zdmll=rs.getDouble("zdmll");//ǩ�����ë����
	}
	rs.close();
	ps.close();

	if (kzdzfs.equals("1"))//1������ë���ʣ�2�������ۿ�
	{
		if (tzhmll<zdmll)
		{
			out.println("��������Ȩ����"+tzhmll);
			return;
		}
	}
	else if (kzdzfs.equals("2"))//1������ë���ʣ�2�������ۿ�
	{
		if (zklx.equals("1"))//1���������ۣ�2��������ۣ�3�����ַ��ô���
		{
			if (zdzk<zdzkl)
			{
				out.println("��������Ȩ����"+zdzk+"��");
				return;
			}
		}
		else{
			if (gcfqdzk<zdzkl)
			{
				out.println("��������Ȩ����"+gcfqdzk+"��");
				return;
			}
		}
	}
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
<title>�����ۿۣ��޸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">
<div align="center">�����ۿۣ��޸����� </div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�μӹ�˾�</span></td>
    <td colspan="3"><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbm%>" target="_blank"><%=cxhdbm%></A> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С�������</span></td>
    <td><A HREF="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmxq%>" target="_blank"><%=cxhdbmxq%></A> </td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">չ������</span></td>
    <td><a href="/yx/cxhd/ViewMcJc_cxhd.jsp?fgsbh=<%=ssfgs%>&cxhdmc=<%=cxhdbmzh%>" target="_blank"><%=cxhdbmzh%></a></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">����ԭ��</span></td> 
  <td colspan="3"><%=tzyy%></td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center"><p>�ͻ��ۿ�</p></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">�ۿ�����</font></td>
  <td><%
	cf.radioToken(out,"1+��������&2+�������&3+���ַ��ô���",zklx,true);
%></td>
  <td align="right"><font color="#0000FF">�������ۿ�</font></td>
  <td><%
	cf.radioToken(out,"1+ͬ��ͬ&2+�����ۿ�",zjxzklx,true);
%></td>
</tr>

<%
if (zklx.equals("1"))
{
	%>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">�����ۿ�</font></td>
              <td><%=zdzk%></td>
              <td align="right">&nbsp;</td>
              <td></td>
            </tr>
	<%
}
else if (zklx.equals("2"))
{
	%>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">���̷��ۿ�</font></td>
              <td><%=gcfqdzk%></td>
              <td align="right"><font color="#0000FF"></font></td>
              <td></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">������ۿ�</font></td>
              <td><%=glfzk%></td>
              <td align="right"><font color="#0000FF">˰���ۿ�</font></td>
              <td><%=sjzk%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��Ʒ��ۿ�</font></td>
              <td><%=sjfzk%></td>
              <td align="right"><font color="#0000FF">�����շ���Ŀ�ۿ�</font></td>
              <td><%=qtsfxmzk%></td>
            </tr>
	<%
}
else if (zklx.equals("3"))
{
	%>
            <tr bgcolor="#FFFFFF">
              <td align="right"  ><font color="#0000FF">���̣����ķ��ۿ�</font></td>
              <td  ><%=clfzk%></td><td align="right"  ><font color="#0000FF">���̣����ķ��ۿ�</font></td>
                <td  ><%=zcfzk%></td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" ><font color="#0000FF">���̣��˹����ۿ�</font></td>
              <td  ><%=rgfzk%></td><td align="right"  ><font color="#0000FF">���̣�������ۿ�</font></td>
                <td  ><%=ysfzk%></td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"  ><font color="#0000FF">���̣���е���ۿ�</font></td>
              <td  ><%=jxfzk%></td><td align="right"  ><font color="#0000FF">���̣���ķ��ۿ�</font></td>
                <td  ><%=shfzk%></td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"  ><font color="#0000FF">���̣��������ۿ�</font></td>
              <td ><%=qtfzk%></td><td align="right"  >&nbsp;</td>
              <td >&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">������ۿ�</font></td>
              <td><%=glfzk%></td>
              <td align="right"><font color="#0000FF">˰���ۿ�</font></td>
              <td><%=sjzk%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��Ʒ��ۿ�</font></td>
              <td><%=sjfzk%></td>
              <td align="right"><font color="#0000FF">�����շ���Ŀ�ۿ�</font></td>
              <td><%=qtsfxmzk%></td>
            </tr>
	<%
}
%>
<%
if (zjxzklx.equals("2"))//1��ͬ��ͬ��2�������ۿ�
{
	%>
			<tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">���̷��������ۿ�</font></td>
              <td><%=gczjxfzk%></td>
              <td align="right"><font color="#0000FF"></font></td>
              <td></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">������������ۿ�</font></td>
              <td><%=glfzjxzk%></td>
              <td align="right"><font color="#0000FF">˰���������ۿ�</font></td>
              <td><%=sjzjxzk%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">��Ʒ��������ۿ�</font></td>
              <td><%=sjfzjxzk%></td>
              <td align="right"><font color="#0000FF">�����շ���Ŀ�������ۿ�</font></td>
              <td><%=qtsfxmzjxzk%></td>
            </tr>
	<%
}
%>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="right">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">�˸�ë����</span></td>
  <td><%=rfmll%>%</td>
  <td align="right"><span class="STYLE2">����ë����</span></td>
  <td><%=zcmll%>%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE2">������ë����</span></td>
  <td><%=tzhmll%>%</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">����ȯ�ٷֱ�</span></td>
  <td><%=djjbfb%>
    ��</td><td align="right"><span class="STYLE2">����ȯ���</span></td>
  <td><%=djjje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">����;�ֵ</span></td>
  <td><%=hdzsjz%></td>
  <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">¼����</span></td> 
  <td width="32%"><%=lrr%></td>
  <td align="right" width="18%"><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"><%=lrsj%></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�������</td>
  <td>
    <%
	cf.radioToken(out,"clzt","4+����ͨ���޸��ۿ�&5+����δͨ��",clzt);
%>  </td>
  <td align="right"><span class="STYLE2">¼�벿��</span></td>
  <td><%=lrbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">������</span></td>
  <td><input type="text" name="spr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">����ʱ��</span></td>
  <td><input type="text" name="spsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"><textarea name="spsm" cols="71" rows="2"><%=spsm%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
		<input type="hidden" name="tzjlh"  value="<%=tzjlh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input  type="button" onClick="window.open('/dhzx/sjszxone/ylbj.jsp?khbh=<%=khbh%>')"  value="�鿴����">
	  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_khzsxx.jsp?khbh=<%=khbh%>')"  value="������Ϣ">
	  <input type="button" onClick="window.open('/dhzx/dhzx/ViewCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="����ȯ">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.clzt)) {
		alert("��ѡ��[�������]��");
		FormName.clzt[0].focus();
		return false;
	}
	if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.spsm)=="") {
			alert("������[����˵��]��");
			FormName.spsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.spr)=="") {
		alert("������[������]��");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("������[����ʱ��]��");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}

	FormName.action="SaveXgSpCrm_tzzkjl.jsp";
	FormName.submit();
	return true;
}

function f_bfdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_bfxmtzk.jsp";
	FormName.submit();
	return true;
}

function f_dxdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_gcdxtzk.jsp";
	FormName.submit();
	return true;
}

function f_qtdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="InsertCrm_qtxmtzk.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
